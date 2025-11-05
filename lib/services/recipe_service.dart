import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/recipe_model.dart';
import '../models/step_model.dart';
import '../models/ingredient_model.dart';

class RecipeService {
  final SupabaseClient _client = Supabase.instance.client;

  /// Fetch all recipes with steps & ingredients
  Future<List<Recipe>> getRecipes() async {
    final data = await _client
        .from('recipes')
        .select('*, steps(*), ingredients(*)') as List<dynamic>?;

    if (data == null) return [];

    return data
        .map((json) => Recipe.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  /// Fetch single recipe
  Future<Recipe?> getRecipeDetail(int recipeId) async {
    final data = await _client
        .from('recipes')
        .select('*, steps(*), ingredients(*)')
        .eq('id', recipeId)
        .maybeSingle() as Map<String, dynamic>?;

    if (data == null) return null;

    return Recipe.fromJson(data);
  }

  /// Add recipe with optional steps & ingredients
  Future<Recipe?> addRecipe({
    required String title,
    String? description,
    String? imageUrl,
    required int uploaderId,
    int? totalMin,
    List<StepModel>? steps,
    List<Ingredient>? ingredients,
  }) async {
    final inserted = await _client
        .from('recipes')
        .insert({
          'title': title,
          'description': description,
          'image_url': imageUrl,
          'uploader_id': uploaderId,
          'total_min': totalMin,
        })
        .select()
        .single() as Map<String, dynamic>?;

    if (inserted == null) return null;
    final int recipeId = inserted['id'];

    // Add steps
    if (steps != null) {
      for (var step in steps) {
        await _client.from('steps').insert({
          'recipe_id': recipeId,
          'step_number': step.stepNumber,
          'instruction': step.instruction,
          'minutes': step.minutes,
        });
      }
    }

    // Add ingredients
    if (ingredients != null) {
      for (var ing in ingredients) {
        await _client.from('ingredients').insert({
          'recipe_id': recipeId,
          'name': ing.name,
          'quantity': ing.quantity,
        });
      }
    }

    return getRecipeDetail(recipeId);
  }

  /// Delete recipe
  Future<void> deleteRecipe(int recipeId) async {
    await _client.from('steps').delete().eq('recipe_id', recipeId);
    await _client.from('ingredients').delete().eq('recipe_id', recipeId);
    await _client.from('recipes').delete().eq('id', recipeId);
  }

  /// Update recipe
  Future<Recipe?> updateRecipe(int recipeId, Map<String, dynamic> data) async {
    await _client.from('recipes').update(data).eq('id', recipeId);
    return getRecipeDetail(recipeId);
  }
}
