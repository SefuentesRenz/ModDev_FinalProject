import 'package:flutter/material.dart';
import '../models/recipe_model.dart';
import 'recipe_detail_screen.dart';
import 'add_recipe_screen.dart';

class RecipeListScreen extends StatefulWidget {
  @override
  _RecipeListScreenState createState() => _RecipeListScreenState();
}

class _RecipeListScreenState extends State<RecipeListScreen> {
  // Predefined list of recipes
  List<Recipe> recipes = [
    Recipe(
      'Adobo',
      '(Filipino Braised Meat in Vinegar and Soy Sauce)',
      'For the Marinade and Braising: \n1.5 lbs (700g) chicken (thighs, drumsticks) or pork belly (liempo)\n 1/3 cup soy sauce\n 1/4 cup white vinegar\n 6 cloves garlic, minced or crushed\n 1 bay leaf\n 1 tsp whole peppercorns\n 1 tbsp sugar (optional, for a hint of sweetness)\n 1/2 cup water or chicken broth\n Optional for Additional Flavor:\n',
      '1. Marinate pork, 2. Cook in a pot, 3. Simmer until tender.',
      'assets/Adobo.jpg',
    ),
    Recipe(
      'Sinigang',
      'Sinigang Recipe (Filipino Sour Soup)',
      '1.5 lbs (700g) pork belly (liempo) or pork ribs \n 8 cups water \n  1 onion, quartered \n  2 large tomatoes, quartered \n  2-3 pieces green chilies (siling haba, optional) \n  1 packet sinigang mix (or 1/2 cup fresh tamarind juice) \n  Salt and fish sauce (patis) to taste',
      '1. Boil pork, 2. Add vegetables, 3. Season with tamarind.',
      'assets/Sinigang.jpg',
    ),
    Recipe(
      'Kare-Kare',
      'Kare-Kare Recipe (Filipino Peanut Stew)',
      'For the Meat: \n 2 lbs (900g) oxtail, tripe, or beef shank (you can combine or substitute with pork hocks) \n 8-10 cups water \n 1 onion, quartered \n 1 tsp salt \n 1 tsp peppercorns',
      '1. Cook oxtail, 2. Prepare peanut sauce, 3. Mix with vegetables.',
      'assets/Kare-kare.jpeg',
    ),
    Recipe(
      'Bulalo',
      'Bulalo Recipe (Filipino Beef Marrow Stew)',
      '2-3 lbs (900g-1.3kg) beef shank (with bone marrow) \n 1 large onion, quartered \n 8-10 cups water \n 2-3 ears of corn, cut into pieces',
      '1. Boil beef, 2. Add corn, 3. Simmer until tender.',
      'assets/Bulalo.webp',
    ),
    Recipe(
      'Pinakbet',
      'Pinakbet Recipe (Filipino Mixed Vegetables with Shrimp Paste)',
      '1/2 lb (250g) pork belly or pork shoulder, sliced into bite-sized pieces \n 2 tbsp cooking oil \n 1 onion, chopped \n 4 cloves garlic, minced',
      '1. Saute vegetables, 2. Add shrimp paste, 3. Simmer.',
      'assets/pinakbet.jpg',
    ),
    Recipe(
      'Pancit Guisado',
      'Pancit Bihon is a stir-fried rice noodle dish with vegetables, meat, and a savory sauce.',
      'For the main dish: \n 250 grams bihon (rice noodles) \n 2 tablespoons cooking oil \n 3 cloves garlic, minced \n 1 medium onion, sliced \n 150 grams chicken breast or pork, thinly sliced \n 100 grams shrimp (optional) \n 1 cup cabbage, shredded \n 1 medium carrot, julienned \n 1/2 cup green beans, sliced diagonally \n 1/4 cup soy sauce \n 2 tablespoons oyster sauce \n 1 cup chicken broth or water \n Salt and pepper to taste' ,
      'Prepare the noodles, \n  2: Cook the protein:, \n  3: Cook the vegetables:, \n 4: Make the sauce:, 5: Add the noodles:, 6: Combine everything:, 7: Serve:',
      'assets/pancit.jpg',
    ),
    Recipe(
      'Lumpiang Shangai',
      'a popular Filipino spring roll often served as an appetizer or snack.',
      '500 grams ground pork (or a mix of pork and beef) \n 1 medium carrot, finely grated \n 1 medium onion, finely chopped \n 2 cloves garlic, minced \n 1/4 cup spring onions, finely chopped \n 1/2 cup water chestnuts or jicama (singkamas), finely chopped (optional) \n 100 grams shrimp (optional) \n 1 large egg \n 2 tablespoons soy sauce \n 1 tablespoon oyster sauce (optional) \n 1 teaspoon salt \n 1/2 teaspoon ground black pepper' ,
      '1: Prepare the filling: \n 2: Wrap the lumpia: \n  3: Fry the lumpia:, \n 4: Serve:',
      'assets/lumpia.jpg',
    ),
    Recipe(
      'Sisig',
      'a beloved Filipino dish known for its savory, tangy, and slightly spicy flavors.',
      '500 grams pork belly or pork jowl \n 250 grams pork liver, finely chopped (optional) \n 1 medium onion, finely chopped \n 1–2 green chilies (siling haba), sliced\n 1–2 red chilies (siling labuyo), finely chopped (optional for spice) \n 1/4 cup mayonnaise \n 1 teaspoon black pepper \n Salt to taste \n 1 raw egg (optional, for topping)' ,
      '1: Prepare the meat: \n  2: Cook the liver (if using):, \n  3: Sauté the ingredients:, \n 4:Add flavorings:, 5: Add mayonnaise:, 6: Serve sizzling:',
      'assets/sisig.jpg',
    ),
  ];

  // Add recipe function
  void _addRecipe(Recipe newRecipe) {
    setState(() {
      recipes.add(newRecipe); // Add the new recipe to the list
    });
  }

  // Remove recipe function
  void _removeRecipe(int index) {
    String removedRecipeName = recipes[index].name; // Store name for SnackBar
    setState(() {
      recipes.removeAt(index); // Remove the recipe at the given index
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$removedRecipeName removed')),
    );
  }

  // Show confirmation dialog for recipe removal
  void _showConfirmationDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Deletion'),
          content:
              Text('Are you sure you want to delete "${recipes[index].name}"?'),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: Text('Delete'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                _removeRecipe(index);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Philippine Viands Recipes'),
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 150, // Set container height to display image background well
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(recipes[index].imagePath),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.4), // Darken overlay
                    BlendMode.darken,
                  ),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: ListTile(
                title: Text(
                  recipes[index].name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Text color for contrast
                  ),
                ),
                subtitle: Text(
                  recipes[index].description,
                  style: TextStyle(color: Colors.white70),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          RecipeDetailScreen(recipe: recipes[index]),
                    ),
                  );
                },
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    _showConfirmationDialog(context, index);
                  },
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddRecipeScreen(onAddRecipe: _addRecipe),
            ),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
