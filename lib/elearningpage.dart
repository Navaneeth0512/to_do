import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: ELearningPage(),
    );
  }
}

class ELearningPage extends StatefulWidget {
  @override
  _ELearningPageState createState() => _ELearningPageState();
}

class _ELearningPageState extends State<ELearningPage> {
  List<Task> todayTasks = [
    Task(name: 'Complete Flutter tutorial', isCompleted: false),
    Task(name: 'Watch Dart programming video', isCompleted: false),
  ];

  List<Task> tomorrowTasks = [
    Task(name: 'Read about state management', isCompleted: false),
    Task(name: 'Practice coding exercises', isCompleted: false),
  ];

  List<Task> laterTasks = [
    Task(name: 'Join online study group', isCompleted: false),
    Task(name: 'Submit project assignment', isCompleted: false),
    Task(name: 'Review course materials', isCompleted: false),
    Task(name: 'Take quiz on recent topics', isCompleted: false),
    Task(name: 'Attend live webinar', isCompleted: false),
    Task(name: 'Update learning journal', isCompleted: false),
    Task(name: 'Explore new e-learning platforms', isCompleted: false),
    Task(name: 'Participate in discussion forums', isCompleted: false),
    Task(name: 'Schedule study sessions', isCompleted: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('E-Learning Tasks'),
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
