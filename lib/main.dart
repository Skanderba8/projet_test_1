import 'package:flutter/material.dart';
import 'package:projet_test_1/intervention_form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: const Text("KONY App")),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Counter: $_counter"),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _incrementCounter,
                  child: const Text("Increment"),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InterventionForm(
                          onSave: (cableType) {
                            print("Saved cable type: $cableType");
                          },
                        ),
                      ),
                    );
                  },
                  child: const Text("Start New Intervention"),
                )
              ],
            ),
          )),
    );
  }
}
