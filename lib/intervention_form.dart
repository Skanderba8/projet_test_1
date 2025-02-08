import 'package:flutter/material.dart';

class InterventionForm extends StatefulWidget {
  final Function(String) onSave;

  const InterventionForm({super.key, required this.onSave});

  @override
  State<InterventionForm> createState() => _InterventionFormState();
}

class _InterventionFormState extends State<InterventionForm> {
  final _formKey = GlobalKey<FormState>();
  String _cableType = '';

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      widget.onSave(_cableType); // Pass data back to the main screen
      Navigator.pop(context); // Close this screen
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("New Intervention")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: "Cable Type"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a cable type";
                  }
                  return null;
                },
                onSaved: (value) => _cableType = value!,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text("Save Intervention"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
