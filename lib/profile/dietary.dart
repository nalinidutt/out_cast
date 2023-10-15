import 'package:flutter/material.dart';

class DietaryPreferences extends StatefulWidget {
  const DietaryPreferences({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<DietaryPreferences> {
  List<String> selectedPreferences = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: const Text(
                  'Any dietary restrictions?',
                  style: TextStyle(fontSize: 24),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 2.2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  children: [
                    _buildOptionCard('vegetarian', Icons.grass),
                    _buildOptionCard('vegan', Icons.grain),
                    _buildOptionCard('kosher', Icons.star_border),
                    _buildOptionCard('gluten free', Icons.food_bank),
                    _buildOptionCard('sea food allergies', Icons.water),
                    _buildOptionCard('lactose intolerance', Icons.local_cafe),
                    _buildOptionCard('halal', Icons.star),
                    _buildOptionCard('diabetic', Icons.healing),
                    _buildOptionCard('peanut allergies', Icons.circle_notifications),
                    _buildOptionCard('paleo diet', Icons.pie_chart),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  'So far, you’ve selected:',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: Text(
                  selectedPreferences.map((e) => '• $e').join('\n'),
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {Navigator.pop(context);},
                  child: const Text('All Good. Continue!'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.green.shade200, padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptionCard(String title, IconData icon) {
    final isSelected = selectedPreferences.contains(title);

    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            selectedPreferences.remove(title);
          } else {
            selectedPreferences.add(title);
          }
        });
      },
      child: Card(
        color: isSelected ? Colors.green.shade200 : Colors.white,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(icon, size: 40, color: isSelected ? Colors.white : Colors.black),
              Text(title, textAlign: TextAlign.center, style: TextStyle(color: isSelected ? Colors.white : Colors.black)),
            ],
          ),
        ),
      ),
    );
  }
}
