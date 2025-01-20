import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;

import '../todolist/todo_model.dart';
import '../todolist/todo_service.dart';



//Pop-up Text Field
Future<void> dialogBuilder(BuildContext context, VoidCallback onUpdate) {
    String? newName;

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Change name'),
          content: TextFormField(
          decoration: const InputDecoration(
            hintText: 'What do people call you?',
            labelText: 'Name *',
          ),
          onChanged: (String? value) {
            newName = value;
          },
          validator: (String? value) {
            return (value != null && value.contains('@'))
                ? 'Do not use the @ char.'
                : null;
          },
        ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Save'),
              onPressed: () async {
                if (newName != null && newName!.isNotEmpty) {
                await FirebaseAuth.instance.currentUser?.updateDisplayName(newName);
                await FirebaseAuth.instance.currentUser?.reload();
                onUpdate(); 
                Navigator.of(context).pop();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Name cannot be empty!')),
                );
              }
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Never mind'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

Future<void> dialogBuilderToDoList(
  BuildContext context,
  VoidCallback onUpdate,
  String userId,
  TodoService todoService,
) {
  String? todoTitle;

  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Add Todo'),
        content: TextFormField(
          decoration: const InputDecoration(
            hintText: 'What are you going to do?',
            labelText: 'Todo',
          ),
          onChanged: (String? value) {
            todoTitle = value;
          },
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Save'),
            onPressed: () async {
              if (todoTitle != null && todoTitle!.trim().isNotEmpty) {
                // Create and add the todo
                final newTodo = TodoModel(
                  id: DateTime.now().millisecondsSinceEpoch.toString(),
                  title: todoTitle!,
                  description: '', // Empty description
                  timestamp: DateTime.now(),
                );
                await todoService.addTodo(userId, newTodo);

                // Call onUpdate to reload the UI
                onUpdate();
                Navigator.of(context).pop();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Todo cannot be empty!')),
                );
              }
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Never mind'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
