import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: ShoppingPage(),
    );
  }
}

class ShoppingPage extends StatefulWidget {
  @override
  _ShoppingPageState createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  List<Task> todayTasks = [
    Task(name: 'Buy milk', isCompleted: false),
    Task(name: 'Get bread', isCompleted: false),
  ];

  List<Task> tomorrowTasks = [
    Task(name: 'Purchase eggs', isCompleted: false),
    Task(name: 'Pick up vegetables', isCompleted: false),
  ];

  List<Task> laterTasks = [
    Task(name: 'Buy fruits', isCompleted: false),
    Task(name: 'Get snacks', isCompleted: false),
    Task(name: 'Purchase toiletries', isCompleted: false),
    Task(name: 'Buy cleaning supplies', isCompleted: false),
    Task(name: 'Get pet food', isCompleted: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Tasks'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          buildTaskSection('Today', todayTasks),
          buildTaskSection('Tomorrow', tomorrowTasks),
          buildTaskSection('Later', laterTasks),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add new task functionality
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget buildTaskSection(String title, List<Task> tasks) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        ...tasks.map((task) {
          return CheckboxListTile(
            title: Text(
              task.name,
              style: TextStyle(
                decoration:
                    task.isCompleted ? TextDecoration.lineThrough : null,
              ),
            ),
            value: task.isCompleted,
            onChanged: (bool? value) {
              setState(() {
                task.isCompleted = value!;
              });
            },
          );
        }).toList(),
        SizedBox(height: 20),
      ],
    );
  }
}

class Task {
  String name;
  bool isCompleted;

  Task({required this.name, this.isCompleted = false});
}
