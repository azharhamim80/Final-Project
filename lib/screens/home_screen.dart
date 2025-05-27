import 'package:flutter/material.dart';
import 'result_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final feetController = TextEditingController();
  final inchController = TextEditingController();
  final weightController = TextEditingController();

  void _calculateBMI() {
    final double? feet = double.tryParse(feetController.text);
    final double? inches = double.tryParse(inchController.text);
    final double? weight = double.tryParse(weightController.text);

    if (feet != null && inches != null && weight != null && (feet > 0 || inches > 0) && weight > 0) {
      double totalInches = (feet * 12) + inches;
      double heightInMeters = totalInches * 0.0254;

      double bmi = weight / (heightInMeters * heightInMeters);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(bmi: bmi),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter valid height and weight.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BMI Calculator"),backgroundColor: Colors.blue,foregroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(height: 26),
            TextField(
              controller: feetController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Height (ft)",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: inchController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Height (in)",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 16),
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Weight (kg)",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateBMI,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white
              ),
              child: Text("Calculate"),
              
            ),
          ],
        ),
      ),
    );
  }
}
