import 'package:flutter/material.dart';


class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Chat> {
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
        'Chat',
        style: TextStyle(
          color: Colors.white,
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
      ),
        ),

      body: Column(
  children: [
    // Message 1 aligned to the left
    Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.blue, // Background color for message 1
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          "message 1",
          style: TextStyle(color: Colors.white), // Text color for contrast
        ),
      ),
    ),
    // Message 2 aligned to the right
    Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.green, // Background color for message 2
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          "message 2",
          style: TextStyle(color: Colors.white), // Text color for contrast
        ),
      ),
    ),
  ],
),


      bottomNavigationBar: Padding(
  padding: const EdgeInsets.only(bottom: 30, right: 30, left: 30),
  child: Row(
    children: [
      // Input field
      Expanded(
        child: TextFormField(
          decoration: const InputDecoration(
            labelText: 'Send a message',
            border: OutlineInputBorder(), // Optional: Adds a border
          ),
          onSaved: (String? value) {
            // Handle saving the input
          },
          validator: (String? value) {
            return (value != null && value.length > 250)
                ? 'The string length should not exceed 250 characters.'
                : null;
          },
        ),
      ),
      const SizedBox(width: 10), // Spacing between input and button
      // Send button
      ElevatedButton(
        onPressed: () {
          // Handle sending the message
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        ),
        child: const Text('Send'),
      ),
    ],
  ),
),
    );
  }
}