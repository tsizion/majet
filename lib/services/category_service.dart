import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/category_model.dart';

class CategoryService {
  final SupabaseClient _client = Supabase.instance.client;

  /// ✅ Fetch all categories (Public can read)
  Future<List<Category>> getCategories() async {
    print('🔹 [CategoryService] Fetching categories...');
    try {
      final response = await _client
          .from('categories')
          .select()
          .order('name', ascending: true);

      print('🔹 [CategoryService] Raw response: $response');

      if (response == null) {
        print('❌ [CategoryService] Response is null');
        return [];
      }

      final list = List<Map<String, dynamic>>.from(response as List);
      print('🔹 [CategoryService] Mapped list length: ${list.length}');
      return list.map((json) => Category.fromJson(json)).toList();
    } catch (e) {
      print('❌ [CategoryService] Fetch error: $e');
      return [];
    }
  }

  /// ✅ Insert category (Admin Feature — requires policy)
  Future<bool> addCategory(String name) async {
    print('🔹 [CategoryService] Adding category: $name');
    try {
      final response = await _client
          .from('categories')
          .insert({'name': name})
          .select()
          .maybeSingle();

      print('🔹 [CategoryService] Insert response: $response');

      if (response == null) {
        print('❌ [CategoryService] Insert failed, no return');
        return false;
      }

      print('✅ [CategoryService] Category added: $name');
      return true;
    } catch (e) {
      print('❌ [CategoryService] Insert error: $e');
      return false;
    }
  }

  /// ✅ Update category name
  Future<bool> updateCategory(int id, String newName) async {
    print('🔹 [CategoryService] Updating category ID $id -> $newName');
    try {
      final response = await _client
          .from('categories')
          .update({'name': newName})
          .eq('id', id)
          .select()
          .maybeSingle();

      print('🔹 [CategoryService] Update response: $response');

      if (response == null) {
        print('❌ [CategoryService] Update failed');
        return false;
      }

      print('✅ [CategoryService] Category updated: $newName');
      return true;
    } catch (e) {
      print('❌ [CategoryService] Update error: $e');
      return false;
    }
  }

  /// ❌ Delete category (Only if not used — requires admin + rules)
  Future<bool> deleteCategory(int id) async {
    print('🔹 [CategoryService] Deleting category ID: $id');
    try {
      final response =
          await _client.from('categories').delete().eq('id', id).select();
      print('🔹 [CategoryService] Delete response: $response');

      print('🗑 [CategoryService] Category deleted — ID: $id');
      return true;
    } catch (e) {
      print('❌ [CategoryService] Delete error: $e');
      return false;
    }
  }
}
