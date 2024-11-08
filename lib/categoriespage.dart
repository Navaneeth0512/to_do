import 'package:flutter/material.dart';
import 'package:to_do/elearningpage.dart';
import 'package:to_do/foodpage.dart';
import 'package:to_do/homepage.dart';
import 'package:to_do/homeworkpage.dart';
import 'package:to_do/settingspage.dart';
import 'package:to_do/shoppingpage.dart';
import 'package:to_do/sportspage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(
                      'assets/avatar.png'), // Replace with your avatar image
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SettingsPage()));
                    },
                    child: const Text(
                      'Sunny Kuttan',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  CategoryCard(
                    title: 'Home',
                    tasks: 10,
                    icon: Icons.home,
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Home()));
                    },
                  ),
                  CategoryCard(
                    title: 'Sport',
                    tasks: 5,
                    icon: Icons.sports_soccer,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SportsPage()));
                    },
                  ),
                  CategoryCard(
                    title: 'Homework',
                    tasks: 13,
                    icon: Icons.book,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeworkPage()));
                    },
                  ),
                  CategoryCard(
                    title: 'E-learning',
                    tasks: 4,
                    icon: Icons.computer,
                    onTap: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ELearningPage()))
                    },
                  ),
                  CategoryCard(
                    title: 'Shopping',
                    tasks: 9,
                    icon: Icons.shopping_cart,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ShoppingPage()));
                    },
                  ),
                  CategoryCard(
                    title: 'Food',
                    tasks: 1,
                    icon: Icons.fastfood,
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => FoodPage()));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void navigateTo(BuildContext context, String category) {
    // Implement navigation or functionality here
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final int tasks;
  final IconData icon;
  final VoidCallback onTap;

  const CategoryCard({
    super.key,
    required this.title,
    required this.tasks,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40),
              const SizedBox(height: 10),
              Text(title, style: const TextStyle(fontSize: 18)),
              const SizedBox(height: 5),
              Text('$tasks tasks', style: const TextStyle(color: Colors.grey)),
            ],
          ),
        ),
      ),
    );
  }
}
