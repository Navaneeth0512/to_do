import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Task> todayTasks = [
    Task(name: 'Clean the house', isCompleted: false),
    Task(name: 'Do the laundry', isCompleted: false),
  ];

  List<Task> tomorrowTasks = [
    Task(name: 'Buy groceries', isCompleted: false),
    Task(name: 'Cook dinner', isCompleted: false),
  ];

  List<Task> laterTasks = [
    Task(name: 'Water the plants', isCompleted: false),
    Task(name: 'Pay bills', isCompleted: false),
    Task(name: 'Read a book', isCompleted: false),
    Task(name: 'Exercise', isCompleted: false),
    Task(name: 'Call family', isCompleted: false),
    Task(name: 'Plan the week', isCompleted: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Tasks'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
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
        child: Icon(Icons.add),
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
