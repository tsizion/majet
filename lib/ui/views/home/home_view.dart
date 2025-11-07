import 'package:flutter/material.dart';
import 'package:majet/core/constants/app_colors.dart';
import 'package:majet/services/auth_service.dart';
import 'package:majet/services/category_service.dart';
import 'package:majet/ui/views/home/category_section.dart';
import 'package:majet/ui/views/home/right_drawer.dart';
import 'package:stacked/stacked.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'home_viewmodel.dart';
import 'discover_view.dart';
import '../../../models/category_model.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return _HomeContent();
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}

class _HomeContent extends StatefulWidget {
  const _HomeContent({Key? key}) : super(key: key);

  @override
  State<_HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<_HomeContent> {
  bool showDiscover = true;
  String? userName;
  bool isDrawerOpen = false; // drawer state
  void openDrawer() {
    setState(() => isDrawerOpen = true);
  }

  void closeDrawer() {
    setState(() => isDrawerOpen = false);
  }

  List<Category> categories = [];
  bool isLoadingCategories = true;

  final CategoryService _categoryService = CategoryService();

  @override
  void initState() {
    super.initState();
    print('🔹 [_HomeContent] initState called');

    _checkUser();
    _loadCategories();
  }

  Future<void> _loadCategories() async {
    try {
      final response = await _categoryService.getCategories();

      // Print the raw response from Supabase
      print('📝 Raw categories response: $response');

      // If response is a list of Map, convert to Category
      final List<Category> safeList = response.map<Category>((json) {
        return json is Category
            ? json
            : Category.fromJson(json as Map<String, dynamic>);
      }).toList();

      setState(() {
        categories = safeList;
        isLoadingCategories = false;
      });
    } catch (e) {
      print('❌ Failed to load categories: $e');
      setState(() {
        categories = [];
        isLoadingCategories = false;
      });
    }
  }

  Future<void> _checkUser() async {
    final client = Supabase.instance.client;
    final session = client.auth.currentSession;

    if (session != null &&
        session.expiresAt != null &&
        session.expiresAt! * 1000 > DateTime.now().millisecondsSinceEpoch) {
      final email = session.user?.email;
      if (email != null) {
        final record = await client
            .from('users')
            .select()
            .eq('email', email)
            .maybeSingle();

        if (record != null) {
          final Map<String, dynamic> userData = record as Map<String, dynamic>;
          setState(() {
            showDiscover = false;
            userName = userData['full_name'] ?? email;
          });
          return;
        }
      }
    }

    final localUser = await AuthService().getCurrentUser();
    if (localUser != null) {
      setState(() {
        showDiscover = false;
        userName = localUser.fullName;
      });
      return;
    }

    setState(() {
      showDiscover = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            actions: [
              if (userName != null)
                Row(
                  children: [
                    Text('Hey, $userName',
                        style: const TextStyle(fontSize: 16)),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: openDrawer,
                      child: const CircleAvatar(
                        radius: 18,
                        child: Icon(Icons.person, size: 20),
                      ),
                    ),
                    const SizedBox(width: 10),
                  ],
                )
              else
                IconButton(
                  onPressed: () => Navigator.pushNamed(context, '/signup'),
                  icon: const Icon(Icons.person_add),
                  tooltip: 'Create Account',
                ),
            ],
          ),
          body: Stack(
            children: [
              // Main content
              Column(
                children: [
                  // Search bar, filter, categories, etc.
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search...',
                              prefixIcon:
                                  const Icon(Icons.search, color: primaryColor),
                              filled: true,
                              fillColor: Colors.grey[200],
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 14),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                    color: primaryColor, width: 1.5),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        InkWell(
                          onTap: () => print('Filter tapped'),
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(Icons.filter_list,
                                color: Colors.white, size: 24),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        isLoadingCategories
                            ? const Center(child: CircularProgressIndicator())
                            : CategorySection(
                                categories: categories
                                    .map((c) => c.name ?? 'Unknown')
                                    .toList(),
                                onCategorySelected: (category) {
                                  print("Selected category: $category");
                                },
                              ),
                        Expanded(
                          child: showDiscover
                              ? DiscoverView(
                                  onSkip: () =>
                                      setState(() => showDiscover = false))
                              : Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(25),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        if (userName != null)
                                          Text(
                                            'Welcome back, $userName!',
                                            style: const TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center,
                                          )
                                        else
                                          const Text(
                                            'Welcome to the App!',
                                            style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center,
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // Right drawer overlay
            ],
          ),
        ),
        if (isDrawerOpen)
          RightDrawer(
            onClose: closeDrawer,
            width: MediaQuery.of(context).size.width * 0.5,
            userName: userName, // <-- pass the username
          ),
      ],
    );
  }
}
