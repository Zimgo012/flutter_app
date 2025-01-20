import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import './todo_model.dart';
import './todo_service.dart';
import '../otherWidgets/edit_user_info.dart';


class Todolist extends StatefulWidget {
  const Todolist({super.key});

  @override
  State<Todolist> createState() => _TodolistState();
}

class _TodolistState extends State<Todolist>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  final TodoService _todoService = TodoService();
  final String userId = FirebaseAuth.instance.currentUser!.uid;

   List<TodoModel> todos = [];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  Future<void> _loadTodos() async {
    final userTodos = await _todoService.getTodos(userId);
    setState(() {
      todos = userTodos;
    });
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
            Navigator.pop(context);
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


    body: todos.isEmpty
          ? const Center(child: Text('No todos yet!'))
          : ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];
                return ListTile(
                  title: Text(todo.title),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () async {
                      await _todoService.deleteTodo(userId, todo.id);
                      _loadTodos();
                    },
                  ),
                );
              },
            ),


     floatingActionButton: FloatingActionButton(
        onPressed: () {
          dialogBuilderToDoList(context, _loadTodos, userId, _todoService);
        },
        child: const Icon(Icons.add),
      ),
  );
}

}
