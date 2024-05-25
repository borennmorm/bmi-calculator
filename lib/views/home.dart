import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/textfield.dart';
import '../model/model.dart';
import 'about.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late TextEditingController _hightController;
  late TextEditingController _weightController;
  String result = '';
  String category = '';
  String description = '';

  @override
  void initState() {
    super.initState();
    _hightController = TextEditingController();
    _weightController = TextEditingController();
  }

  @override
  void dispose() {
    _hightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
        backgroundColor: Colors.green[200],
        actions: [
          IconButton(
            icon: const Icon(CupertinoIcons.question_circle),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AboutView()));
            },
          ),
        ],
      ),
      backgroundColor: Colors.green[200],
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              "BMI Calculator",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            MyTextFied(
              controll: _hightController,
              labelText: "Hight (m)",
            ),
            MyTextFied(
              controll: _weightController,
              labelText: "Weight (kg)",
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                calcBMI();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Text('Calculate BMI'),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                width: double.infinity,
                // height: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.green[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        'Your BMI Analysis',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text(
                      "BMI: ${result.isNotEmpty ? result : '0.0'}",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'You\'re ${category.isNotEmpty ? category : 'weight is'}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text(
                        description.isNotEmpty
                            ? description
                            : 'BMI Description',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[500],
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void calcBMI() {
    // double height = double.tryParse(_hightController.text) ?? 0.0;
    // double weight = double.tryParse(_weightController.text) ?? 0.0;
    // using this maybe cause unnecessary progress

    String heightText = _hightController.text;
    String weightText = _weightController.text;

    double? height = double.tryParse(heightText);
    double? weight = double.tryParse(weightText);

    if (height == null || weight == null || height <= 0 || weight <= 0) {
      setState(() {
        result = 'Invalid input';
        category = '';
        description = '';
      });
      return;
    }

    double bmi = weight / (height * height);
    setState(() {
      result = bmi.toStringAsFixed(1);
      BMICalcu bmiCalcu = getBMICategory(bmi);
      category = bmiCalcu.bmiCategory;
      description = bmiCalcu.bmiDescription;
    });
  }

  BMICalcu getBMICategory(double bmi) {
    if (bmi < 18.5) {
      return BMICalcu.BMICategories[0];
    } else if (bmi < 25) {
      return BMICalcu.BMICategories[1];
    } else if (bmi < 30) {
      return BMICalcu.BMICategories[2];
    } else if (bmi < 35) {
      return BMICalcu.BMICategories[3];
    } else if (bmi < 40) {
      return BMICalcu.BMICategories[4];
    } else {
      return BMICalcu.BMICategories[5];
    }
  }
}
