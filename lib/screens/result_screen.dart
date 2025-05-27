import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final double bmi;

  ResultScreen({required this.bmi});

  String _getBMICategory() {
    if (bmi < 18.5) return "Underweight";
    else if (bmi < 24.9) return "Normal";
    else if (bmi < 29.9) return "Overweight";
    else return "Obese";
  }

  @override
  Widget build(BuildContext context) {
    String category = _getBMICategory();

    return Scaffold(
      appBar: AppBar(title: Text("Your BMI Result"),backgroundColor: Colors.blue,foregroundColor: Colors.white),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset('assets/images/bmiimg.jpg',width: 300,height: 300,),
              SizedBox(height: 20),
              Text("Your BMI is:", style: TextStyle(fontSize: 20)),
              Text(bmi.toStringAsFixed(2),
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              Text("Category: $category",
                  style: TextStyle(fontSize: 24, color: Colors.green)),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue,foregroundColor: Colors.white),
                child: Text("Calculate Again"),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
