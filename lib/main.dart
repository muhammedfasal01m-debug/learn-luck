import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('my app')),
        body: Center(
          child: Column(
            children: [
              Text('welcome'),
              Container(child: const Text('Flutterbasics')),
              const SizedBox(height: 19),
              Container(child: Text('Day 3 Task')),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (dialogcontext) {
                      return AlertDialog(
                        title: const Text('Add taskk'),
                        content: const Text('Add a new taskk?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(dialogcontext);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Task added')),
                              );
                            },
                            child: const Text('ok'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text('Add Taskk'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
