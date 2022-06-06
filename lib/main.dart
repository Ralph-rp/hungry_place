import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text('Demo Title!'),
        ),
        body: Center(
          child: Container(
            margin: const EdgeInsets.all(100),
            padding: const EdgeInsets.all(10),
            color: Colors.red,
            height: 100,
            width: 100,
            child: const Text('Hello there'),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              print('pressed');
            }),
        bottomNavigationBar: BottomNavigationBar(items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.food_bank),
            label: 'Food',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'business',
          ),
        ]),
        drawer: const Drawer(
          child: Text('Yo!'),
        ),
      ),
    );
  }
}
