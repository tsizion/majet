class Ingredient {
  final int id;
  final DateTime createdAt;
  final int? recipeId;
  final String? name;
  final String? quantity;

  Ingredient({
    required this.id,
    required this.createdAt,
    this.recipeId,
    this.name,
    this.quantity,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      id: json['id'] as int,
      createdAt: DateTime.parse(json['created_at'] as String),
      recipeId: json['recipe_id'] as int?,
      name: json['name'] as String?,
      quantity: json['quantity'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_at': createdAt.toIso8601String(),
      'recipe_id': recipeId,
      'name': name,
      'quantity': quantity,
    };
  }
}
