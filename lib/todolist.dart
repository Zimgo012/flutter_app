import 'package:flutter/material.dart';

class Todolist extends StatefulWidget {
  const Todolist({super.key});

  @override
  State<Todolist> createState() => _TodolistState();
}

class _TodolistState extends State<Todolist>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      actions: [
        IconButton(
          icon: Icon(Icons.save), // Icon for the action
          tooltip: 'Settings', // Tooltip when hovered or long-pressed
          onPressed: () {
          
          },
          alignment: Alignment.topLeft,
        ),
      ],

        leading: IconButton(
        icon: Icon(Icons.arrow_back), // Icon on the left side
        tooltip: 'Menu',
        onPressed: () {
    
        },
      ),


      title: Text(
        'To-Do-List',
        style: TextStyle(
          color: Colors.white,
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    body: ListView(
      padding: const EdgeInsets.all(20),
      children: <Widget>[
        Container(
          height: 50,
          color: Colors.amber[600],
          child: const Center(child: Text('Entry A')),
        ),
        SizedBox(height: 20),
        Container(
          height: 50,
          color: Colors.amber[500],
          child: const Center(child: Text('Entry B')),
        ),
        SizedBox(height: 20),
        Container(
          height: 50,
          color: Colors.amber[100],
          child: const Center(child: Text('Entry C')),
        ),
      ],
    ),
    floatingActionButton: Align(
      alignment: Alignment.bottomRight,
      child: FloatingActionButton(
        onPressed: () {
        },
        child: Icon(Icons.add),
      ),
    ),
  );
}

}
