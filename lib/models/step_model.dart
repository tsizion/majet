class StepModel {
  final int id;
  final DateTime createdAt;
  final int? recipeId;
  final int? stepNumber;
  final String? instruction;
  final int? minutes;

  StepModel({
    required this.id,
    required this.createdAt,
    this.recipeId,
    this.stepNumber,
    this.instruction,
    this.minutes,
  });

  factory StepModel.fromJson(Map<String, dynamic> json) {
    return StepModel(
      id: json['id'] as int,
      createdAt: DateTime.parse(json['created_at'] as String),
      recipeId: json['recipe_id'] as int?,
      stepNumber: json['step_number'] as int?,
      instruction: json['instruction'] as String?,
      minutes: json['minutes'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_at': createdAt.toIso8601String(),
      'recipe_id': recipeId,
      'step_number': stepNumber,
      'instruction': instruction,
      'minutes': minutes,
    };
  }
}
