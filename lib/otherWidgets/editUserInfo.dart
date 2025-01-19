import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;




//Pop-up Setting Name for User
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
