import 'dart:math';

import 'package:flutter/material.dart';

class NumberGeneratorScreen extends StatefulWidget {
  const NumberGeneratorScreen({super.key});

  @override
  _NumberGeneratorScreenState createState() => _NumberGeneratorScreenState();
}

class _NumberGeneratorScreenState extends State<NumberGeneratorScreen> {
  int number1 = 0;
  int number2 = 0;
  int correctAnswers = 0;
  int incorrectAnswers = 0;
  int clicks = 0;
  final int maxClicks = 10;

  void generateRandomNumbers() {
    setState(() {
      number1 = Random().nextInt(100);
      number2 = Random().nextInt(100);
    });
  }

  void handleButtonClick(int selectedNumber) {
    setState(() {
      if ((selectedNumber == number1 && number1 > number2) ||
          (selectedNumber == number2 && number2 > number1)) {
        correctAnswers++;
      } else {
        incorrectAnswers++;
      }
      clicks++;
      if (clicks < maxClicks) {
        generateRandomNumbers();
      }
    });
  }

  void restartGame() {
    setState(() {
      number1 = 0;
      number2 = 0;
      correctAnswers = 0;
      incorrectAnswers = 0;
      clicks = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Number Generator Game"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Visibility(
                visible: clicks < maxClicks,
                child: SizedBox(
                  width: 200,
                  height: 250,
                  child: ElevatedButton(
                    onPressed: () => handleButtonClick(number1),
                    child: Text(
                      '$number1',
                      style: const TextStyle(fontSize: 24, color: Colors.black),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: clicks < maxClicks,
                child: SizedBox(
                  width: 200,
                  height: 250,
                  child: ElevatedButton(
                    onPressed: () => handleButtonClick(number2),
                    child: Text(
                      '$number2',
                      style: const TextStyle(fontSize: 24, color: Colors.black),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.all(16.0),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: Column(
              children: [
                const Text(
                  'Game Stats:',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Correct Answers:',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      '$correctAnswers',
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Incorrect Answers:',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      '$incorrectAnswers',
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: restartGame,
                child: const Text(
                  'Restart Game',
                  style: TextStyle(fontSize: 30, color: Colors.red),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: NumberGeneratorScreen(),
  ));
}
