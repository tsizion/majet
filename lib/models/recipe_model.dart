import 'step_model.dart';
import 'ingredient_model.dart';

class Recipe {
  final int id;
  final DateTime createdAt;
  final String? title;
  final String? description;
  final String? imageUrl;
  final int? uploaderId;
  final String status;
  final int? totalMin;
  final List<StepModel>? steps;
  final List<Ingredient>? ingredients;

  Recipe({
    required this.id,
    required this.createdAt,
    this.title,
    this.description,
    this.imageUrl,
    this.uploaderId,
    this.status = 'pending',
    this.totalMin,
    this.steps,
    this.ingredients,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'] as int,
      createdAt: DateTime.parse(json['created_at'] as String),
      title: json['title'] as String?,
      description: json['description'] as String?,
      imageUrl: json['image_url'] as String?,
      uploaderId: json['uploader_id'] as int?,
      status: json['status'] ?? 'pending',
      totalMin: json['total_min'] as int?,
      steps: json['steps'] != null
          ? (json['steps'] as List).map((e) => StepModel.fromJson(e)).toList()
          : null,
      ingredients: json['ingredients'] != null
          ? (json['ingredients'] as List)
              .map((e) => Ingredient.fromJson(e))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_at': createdAt.toIso8601String(),
      'title': title,
      'description': description,
      'image_url': imageUrl,
      'uploader_id': uploaderId,
      'status': status,
      'total_min': totalMin,
      'steps': steps?.map((e) => e.toJson()).toList(),
      'ingredients': ingredients?.map((e) => e.toJson()).toList(),
    };
  }
}
