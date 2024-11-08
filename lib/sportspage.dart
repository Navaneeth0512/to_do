import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: SportsPage(),
    );
  }
}

class SportsPage extends StatefulWidget {
  @override
  _SportsPageState createState() => _SportsPageState();
}

class _SportsPageState extends State<SportsPage> {
  List<Task> todayTasks = [
    Task(name: '10 min Rope Skipping', isCompleted: false),
    Task(name: '10 Push ups', isCompleted: false),
  ];

  List<Task> tomorrowTasks = [
    Task(name: '20 Pull ups', isCompleted: false),
    Task(name: '30 Jumps', isCompleted: false),
  ];

  List<Task> futureTasks = [
    Task(name: 'Lose 20 Kg', isCompleted: false, date: 'Fri, Oct 04, 2019'),
    Task(name: 'Reach 50 Push ups', isCompleted: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sport'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          buildTaskSection('Today', todayTasks),
          buildTaskSection('Tomorrow', tomorrowTasks),
          buildTaskSection('Fri, Oct 04, 2019', futureTasks),
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
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
            subtitle: task.date != null ? Text(task.date!) : null,
            value: task.isCompleted,
            onChanged: (bool? value) {
              setState(() {
                task.isCompleted = value!;
              });
            },
          );
        }).toList(),
        const SizedBox(height: 20),
      ],
    );
  }
}

class Task {
  String name;
  bool isCompleted;
  String? date;

  Task({required this.name, this.isCompleted = false, this.date});
}
