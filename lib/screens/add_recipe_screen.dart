import 'package:flutter/material.dart';
import '../models/recipe_model.dart';

class AddRecipeScreen extends StatefulWidget {
  final Function(Recipe) onAddRecipe;

  AddRecipeScreen({required this.onAddRecipe});

  @override
  _AddRecipeScreenState createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _ingredientsController = TextEditingController();
  final _instructionsController = TextEditingController();

  void _submitRecipe() {
    final name = _nameController.text;
    final description = _descriptionController.text;
    final ingredients = _ingredientsController.text;
    final instructions = _instructionsController.text;

    if (name.isNotEmpty &&
        description.isNotEmpty &&
        ingredients.isNotEmpty &&
        instructions.isNotEmpty) {
      final newRecipe = Recipe(name, description, ingredients, instructions, 'assets/default.jpg');

      widget.onAddRecipe(newRecipe);
      Navigator.pop(context); // Close the screen after adding the recipe
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Recipe'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Recipe Name'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            TextField(
              controller: _ingredientsController,
              decoration: InputDecoration(labelText: 'Ingredients'),
            ),
            TextField(
              controller: _instructionsController,
              decoration: InputDecoration(labelText: 'Instructions'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitRecipe,
              child: Text('Add Recipe'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _ingredientsController.dispose();
    _instructionsController.dispose();
    super.dispose();
  }
}