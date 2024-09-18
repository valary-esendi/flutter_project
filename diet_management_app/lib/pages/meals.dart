import 'package:flutter/material.dart';

class MealsPage extends StatefulWidget {
  const MealsPage({super.key});

  @override
  _MealsPageState createState() => _MealsPageState();
}

class _MealsPageState extends State<MealsPage> {
  final List<Map<String, dynamic>> meals = []; // List to hold meal data
  final TextEditingController mealNameController = TextEditingController();
  final TextEditingController mealTypeController = TextEditingController();
  final TextEditingController mealTimesController = TextEditingController();
  final TextEditingController foodExpirationController = TextEditingController();
  String sustainabilityTips = ''; // Store sustainability tips

  @override
  void initState() {
    super.initState();
    displaySustainabilityTips();
  }

  void _addMeal() {
    final mealName = mealNameController.text;
    final mealType = mealTypeController.text;
    final mealTimes = int.tryParse(mealTimesController.text) ?? 0;
    final foodExpiration = foodExpirationController.text;

    if (mealName.isNotEmpty && mealType.isNotEmpty && foodExpiration.isNotEmpty) {
      setState(() {
        meals.add({
          'meal': mealName,
          'meal_type': mealType,
          'meal_type_times': mealTimes,
          'food_expiration': DateTime.parse(foodExpiration).toIso8601String(),
        });
      });

      // Clear inputs
      mealNameController.clear();
      mealTypeController.clear();
      mealTimesController.clear();
      foodExpirationController.clear();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Meal added successfully!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill out all fields.')),
      );
    }
  }

  Future<void> _selectFoodExpirationDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      setState(() {
        foodExpirationController.text = pickedDate.toIso8601String().split('T').first; // Format as YYYY-MM-DD
      });
    }
  }

  void displaySustainabilityTips() {
    setState(() {
      sustainabilityTips = 'Sustainability Tips:\n'
          'Consider incorporating more plant-based meals into your diet for reduced environmental impact.\n'
          'Buy local and seasonal produce to support local farmers and reduce carbon footprints.';
    });
  }

  void _showPopup(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Notification'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Color _getTileColor(DateTime expirationDate, String mealType, int timesConsumed) {
    final now = DateTime.now();
    final yesterday = now.subtract(const Duration(days: 1));

    if (expirationDate.isAtSameMomentAs(now)) {
      return Colors.red;
    } else if (expirationDate.isBefore(now) && expirationDate.isAfter(yesterday)) {
      return Colors.orange;
    } else if ((mealType.toLowerCase() == 'protein' || mealType.toLowerCase() == 'fat') && timesConsumed >= 2) {
      return Colors.blue;
    }
    
    return Colors.transparent; // Default color
  }

  String _getPopupMessage(DateTime expirationDate, String mealType, int timesConsumed) {
    final now = DateTime.now();
    final yesterday = now.subtract(const Duration(days: 1));
    String message = '';

    if (expirationDate.isAtSameMomentAs(now)) {
      message = 'Consume this meal as soon as possible!';
    } else if (expirationDate.isBefore(now) && expirationDate.isAfter(yesterday)) {
      message = 'This meal has expired!';
    } else if ((mealType.toLowerCase() == 'protein' || mealType.toLowerCase() == 'fat') && timesConsumed >= 2) {
      message = 'Minimize your intake of fats and proteins!';
    }

    return message;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meals', style: TextStyle(color: Color.fromARGB(255, 240, 132, 132))),
        backgroundColor: const Color.fromARGB(255, 207, 112, 236),
      ),
      body: Container(
        color: const Color.fromARGB(255, 144, 123, 230), // Background color
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              'Your Meals',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Form(
              child: Column(
                children: [
                  TextField(
                    controller: mealNameController,
                    decoration: const InputDecoration(labelText: 'Meal Name', border: OutlineInputBorder()),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: mealTypeController,
                    decoration: const InputDecoration(labelText: 'Meal Type (e.g., fats, proteins)', border: OutlineInputBorder()),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: mealTimesController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'Times Consumed', border: OutlineInputBorder()),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: foodExpirationController,
                    decoration: const InputDecoration(labelText: 'Expiration Date (YYYY-MM-DD)', border: OutlineInputBorder()),
                    readOnly: true,
                    onTap: () => _selectFoodExpirationDate(context), // Show date picker on tap
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _addMeal,
                    child: const Text('Add Meal'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Display sustainability tips
            Text(sustainabilityTips),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: meals.length,
                itemBuilder: (context, index) {
                  final meal = meals[index];
                  final expirationDate = DateTime.parse(meal['food_expiration']);
                  final mealType = meal['meal_type'];
                  final mealTimes = meal['meal_type_times'];

                  Color tileColor = _getTileColor(expirationDate, mealType, mealTimes);
                  String popupMessage = _getPopupMessage(expirationDate, mealType, mealTimes);

                  return GestureDetector(
                    onTap: () {
                      if (popupMessage.isNotEmpty) {
                        _showPopup(popupMessage);
                      }
                    },
                    child: Card(
                      color: tileColor, // Set dynamic color
                      child: ListTile(
                        title: Text(meal['meal'] ?? ''),
                        subtitle: Text(
                          'Type: $mealType, '
                          'Times: $mealTimes, '
                          'Expiration: ${meal['food_expiration'].split('T').first}',
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Logic for logout (simulated here; implement as needed)
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Logout functionality not implemented')));
        },
        backgroundColor: const Color(0xFFFCB680),
        child: const Icon(Icons.logout),
      ),
    );
  }
}