import 'login.dart';
import 'package:flutter/material.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Register',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 207, 112, 236), // Consistent AppBar color
      ),
      body: Container(
        color: const Color.fromARGB(255, 144, 123, 230), // Consistent background color
        padding: const EdgeInsets.all(20), // Consistent padding
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Register',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            // TextField for Full Name
            const TextField(
              decoration: InputDecoration(
                labelText: 'Full Name',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromARGB(211, 165, 166, 172)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromARGB(211, 165, 166, 172)),
                ),
              ),
            ),
            const SizedBox(height: 10),
            // TextField for Email
            const TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromARGB(211, 165, 166, 172)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromARGB(211, 165, 166, 172)),
                ),
              ),
            ),
            const SizedBox(height: 10),
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
            // ElevatedButton for Registration
            ElevatedButton(
              onPressed: () {
                // Here you would normally handle registration logic.
                // For now, just navigate to the login page.
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 105, 107, 233),
                foregroundColor: const Color.fromARGB(255, 153, 146, 146),
              ),
              child: const Text('Register'),
            ),
            const SizedBox(height: 10),
            // TextButton for navigating to the Login page
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              child: const Text("Already have an account? Login"),
            ),
          ],
        ),
      ),
    );
  }
}