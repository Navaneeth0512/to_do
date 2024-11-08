import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: HomeworkPage(),
    );
  }
}

class HomeworkPage extends StatefulWidget {
  @override
  _HomeworkPageState createState() => _HomeworkPageState();
}

class _HomeworkPageState extends State<HomeworkPage> {
  List<Task> todayTasks = [
    Task(name: 'Math homework', isCompleted: false),
    Task(name: 'Science project', isCompleted: false),
  ];

  List<Task> tomorrowTasks = [
    Task(name: 'History essay', isCompleted: false),
    Task(name: 'Read literature book', isCompleted: false),
  ];

  List<Task> laterTasks = [
    Task(name: 'Geography assignment', isCompleted: false),
    Task(name: 'Biology lab report', isCompleted: false),
    Task(name: 'Chemistry experiment', isCompleted: false),
    Task(name: 'Physics problems', isCompleted: false),
    Task(name: 'Art project', isCompleted: false),
    Task(name: 'Music practice', isCompleted: false),
    Task(name: 'Physical education log', isCompleted: false),
    Task(name: 'Computer science coding', isCompleted: false),
    Task(name: 'Foreign language practice', isCompleted: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homework Tasks'),
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
