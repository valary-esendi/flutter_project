// Importing Flutter Material package for Material Design components
import 'package:flutter/material.dart';
import 'pages/login.dart'; // Ensure this file contains LoginPage class definition
import 'pages/meals.dart'; // Ensure this file contains MealsPage class definition
import 'pages/register.dart'; // Ensure this file contains RegisterPage class definition if you're using it

// The main function is the entry point of the app.
// It calls the runApp() method to start the DietManagementApp.
void main() {
  runApp(const DietManagementApp()); // Starts the DietManagementApp widget.
}

// DietManagementApp class, which is a StatelessWidget.
// This defines the overall structure and theme of the app.
class DietManagementApp extends StatelessWidget {
  const DietManagementApp({Key? key}) : super(key: key); // Use Key? for null safety

  @override
  Widget build(BuildContext context) {
    // MaterialApp is the root widget of the app.
    return MaterialApp(
      title: 'Meal Management App', // Title of the app displayed in the task manager.

      // Defining the theme for the app.
      theme: ThemeData(
        primarySwatch: Colors.teal, // Setting blue as the primary color for the app.

        // Defining text themes for various parts of the app.
        textTheme: const TextTheme(
          headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.teal), // Styling for large headlines.
          bodyMedium: TextStyle(fontSize: 16, color: Color.fromARGB(255, 121, 146, 230)), // Styling for body text.
        ),

        // Defining the default button style for older buttons.
        buttonTheme: const ButtonThemeData(
          buttonColor: Color.fromARGB(255, 230, 168, 140), 
          textTheme: ButtonTextTheme.primary, // Ensures that button text color is suitable for the button background.
        ),

        // Styling for modern ElevatedButtons.
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal, // Setting blue as the background color for ElevatedButtons.
          ),
        ),
      ),

      // Defining the dark theme for the app.
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: Colors.teal, // Blue as the primary color for dark mode.

        // Defining a color scheme for dark mode.
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.teal, // Using blue as the main color in dark mode.
        ).copyWith(
          secondary: Colors.tealAccent, // BlueAccent as the secondary color in dark mode.
        ),

        // Defining text themes for dark mode.
        textTheme: const TextTheme(
          headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.tealAccent), // Styling for headlines in dark mode.
          bodyMedium: TextStyle(fontSize: 16, color: Colors.white), // Styling for body text in dark mode.
        ),

        // Styling for ElevatedButtons in dark mode.
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal, // Blue background for buttons in dark mode.
          ),
        ),
      ),

      // Setting the app to automatically switch between light and dark mode based on the system settings.
      themeMode: ThemeMode.system, // System-defined theme mode (light/dark).

      // Defining the initial route of the app, which is the login page.
      initialRoute: '/',

      // Defining the routes for navigation between different pages.
      routes: {
        '/': (context) => const LoginPage(), // Root route loads the LoginPage.
        '/register': (context) => const RegistrationPage(), // '/register' route loads the RegisterPage.
        '/meals': (context) => const MealsPage(), // '/meals' route loads the MealsPage.
      },
    );
  }
}