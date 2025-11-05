import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';

class AuthService {
  final SupabaseClient _client = Supabase.instance.client;

  /// SIGN UP a user with role
  Future<bool> signUp(String email, String password, String fullName,
      {String role = 'consumer'}) async {
    try {
      final AuthResponse res = await _client.auth.signUp(
        email: email,
        password: password,
        data: {'full_name': fullName},
      );

      final user = res.user;
      if (user == null) {
        print('Signup failed: no user returned from Supabase');
        return false;
      }

      // Insert into users table
      final response = await _client
          .from('users')
          .insert({
            'full_name': fullName,
            'email': email,
            'role': role,
            'approved': false, // auto approve consumer
            'created_at': DateTime.now().toIso8601String(),
          })
          .select()
          .maybeSingle();

      if (response == null) {
        // Rollback auth user if insert fails
        await _client.auth.admin.deleteUser(user.id);
        print('Signup failed: could not insert into users table');
        return false;
      }

      print('Signup success for $email');
      return true;
    } catch (e) {
      print('Signup error: $e');
      return false;
    }
  }

  /// SIGN IN a user
  Future<bool> signIn(String email, String password) async {
    try {
      final AuthResponse res = await _client.auth.signInWithPassword(
        email: email,
        password: password,
      );

      final user = res.user;
      final session = res.session;
      if (user == null || session == null) {
        print('SignIn failed: no user or session');
        return false;
      }

      // Fetch user from table
      final record =
          await _client.from('users').select().eq('email', email).maybeSingle();

      if (record == null) {
        print('SignIn failed: user not found in table');
        return false;
      }

      final Map<String, dynamic> userData = record as Map<String, dynamic>;
      final approved = userData['approved'] as bool? ?? false;

      if (!approved) {
        print('SignIn failed: user not approved yet');
        return false;
      }

      // Save user + token locally
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', session.accessToken);
      await prefs.setString('user_email', user.email ?? '');
      await prefs.setString(
          'user_fullName', user.userMetadata?['full_name'] ?? '');
      await prefs.setString('user_role', userData['role'] ?? 'consumer');

      print('SignIn success for $email');
      return true;
    } catch (e) {
      print('SignIn error: $e');
      return false;
    }
  }

  /// SIGN OUT
  Future<void> signOut() async {
    await _client.auth.signOut();
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    print('User signed out and local storage cleared');
  }

  /// Get current user from local storage
  Future<AppUser?> getCurrentUser() async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString('user_email');
    final fullName = prefs.getString('user_fullName');
    final role = prefs.getString('user_role');

    if (email == null || fullName == null || role == null) return null;

    return AppUser(
      id: 0, // you can fetch real id from users table if needed
      fullName: fullName,
      email: email,
      role: role,
      approved: true,
      createdAt: DateTime.now(),
    );
  }
}
