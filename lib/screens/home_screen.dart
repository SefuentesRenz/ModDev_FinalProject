
import 'package:flutter/material.dart';
import 'recipe_list_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/homescreen.jpeg'), // Ensure path matches the actual image
            fit: BoxFit.cover, // Make sure the image covers the whole background
          ),
        ),
        child: Center(
          // Center the contents of the screen
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center vertically
            children: [
              Text(
                'Welcome to the Recipe App',
                style: TextStyle(
                  fontSize: 40, // Font size for the welcome message
                  color: const Color.fromARGB(255, 255, 255, 255), // Set text color to white
                  fontWeight: FontWeight.bold, // Make text bold
                ),
              ),  
              SizedBox(height: 0), // Add space between texts
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RecipeListScreen(),
                    ),
                  );
                },
                child: Text('View Recipes'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
