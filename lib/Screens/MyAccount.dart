import 'package:flutter/material.dart';

class AlertDemo extends StatelessWidget {
  const AlertDemo({super.key});

  void _showMyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("My Account"),
          content: Column(
            children: [
              const Text("This is a simple alert dialog."),
            ],
          ),
          actions: [
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop(); // dismiss dialog
              },
            ),
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                // Add your logic here
                Navigator.of(context).pop(); // dismiss dialog
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Alert Box Example")),
      body: Center(
        child: ElevatedButton(
          child: const Text("Show Alert"),
          onPressed: () => _showMyDialog(context),
        ),
      ),
    );
  }
}