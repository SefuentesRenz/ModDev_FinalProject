// lib/models/recipe_model.dart
class Recipe {
  final String name;
  final String description;
  final String ingredients;
  final String instructions;
  final String imagePath; // Add this line

  Recipe(this.name, this.description, this.ingredients, this.instructions, this.imagePath);
}
