import 'register.dart';
import 'meals.dart';
import 'package:flutter/material.dart';
// Removed API imports, since we're no longer using them.

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 105, 107, 233),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Login',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            // TextField for Username
            const TextField(
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromARGB(211, 165, 166, 172)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromARGB(211, 165, 166, 172)),
                ),
              ),
            ),
            const SizedBox(height: 10),
            // TextField for Password
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromARGB(211, 165, 166, 172)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromARGB(211, 165, 166, 172)),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // ElevatedButton for Login
            ElevatedButton(
              onPressed: () {
                // Navigate to the MealsPage for simplicity
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MealsPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 105, 107, 233),
                foregroundColor: const Color.fromARGB(255, 160, 160, 167),
              ),
              child: const Text('Login'),
            ),
            // SizedBox adds vertical space (10 pixels)
            const SizedBox(height: 10),
            // TextButton for navigating to the Registration page
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RegistrationPage()),
                );
              },
              style: TextButton.styleFrom(
                foregroundColor: const Color.fromARGB(255, 105, 107, 233),
              ),
              child: const Text("Don't have an account? Register here"),
            ),
          ],
        ),
      ),
    );
  }
}