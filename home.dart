import 'package:flutter/material.dart';
import 'login.dart';
import 'register.dart';

class HomePage extends StatelessWidget {
  final String username;

  HomePage({required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome, $username!",
              style: TextStyle(fontSize: 40),
            ),
            SizedBox(height: 30.0),
            Text(
              "Body Mass Index (BMI) Calculator",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => BmiDialog(),
                );
              },
              child: Text("Calculate BMI"),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Logout dan kembali ke halaman login
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text("Back to Login"),
            ),
          ],
        ),
      ),
    );
  }
}

class BmiDialog extends StatefulWidget {
  @override
  _BmiDialogState createState() => _BmiDialogState();
}

class _BmiDialogState extends State<BmiDialog> {
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  String _result = "";

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("BMI Calculator"),
      content: Column(
        children: [
          TextField(
            controller: _weightController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Weight (kg)",
            ),
          ),
          SizedBox(height: 16.0),
          TextField(
            controller: _heightController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Height (cm)",
            ),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              double calculateBmi(double weight, double height) {
                // Menghitung BMI menggunakan rumus BMI = berat badan (kg) / (tinggi badan (m))^2
                height = height / 100; // Konversi tinggi dari cm ke m
                return weight / (height * height);
              }

              double weight = double.tryParse(_weightController.text) ?? 0.0;
              double height = double.tryParse(_heightController.text) ?? 0.0;
              double bmi = calculateBmi(weight, height);
              String result = "";
              if (bmi < 18.5) {
                result = "Underweight";
              } else if (bmi >= 18.5 && bmi < 24.9) {
                result = "Normal";
              } else {
                result = "Overweight";
              }
              setState(() {
                _result = "BMI: ${bmi.toStringAsFixed(2)}\nResult: $result";
              });
            },
            child: Text("Calculate"),
          ),
          SizedBox(height: 16.0),
          Text(
            _result,
            style: TextStyle(fontSize: 20),
          ), // Menampilkan hasil BMI
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Close"),
        ),
      ],
    );
  }
}
