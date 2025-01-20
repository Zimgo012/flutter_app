import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../otherWidgets/async_functions.dart';
import './chat_service.dart';
import 'message_model.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Chat> {

  final TextEditingController _messageController = TextEditingController();
  final ChatService _chatService = ChatService();
  final User? currentUser = FirebaseAuth.instance.currentUser;

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back), // Icon on the left side
        tooltip: 'Menu',
        onPressed: () {
            Navigator.pop(context);
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
          Expanded(
            child: StreamBuilder<List<Message>>(
              stream: _chatService.getMessage(),
              builder: (context, snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  return const Center(child: CircularProgressIndicator());
                }
                if(!snapshot.hasData || snapshot.data!.isEmpty){
                  return const Center(child: Text("No messages yet!"));
                }

                final messages = snapshot.data!;

                return ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (context, index){
                    final message = messages[index];
                    final isMe = message.senderId == currentUser?.uid;

                    return Align(
                      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: isMe? Colors.green : Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              message.senderName,
                              style:  const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                              ),
                            ),
                            Text(
                              message.messageText,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      )
                    );
                  },
                );

              },
            ))
        ],
      ),


      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 30, right: 30, left: 30),
        child: Row(
          children: [
            // Input field
            Expanded(
              child: TextField(
                controller: _messageController,
                decoration: const InputDecoration(
                  labelText: 'Send a message',
                  border: OutlineInputBorder(), // Optional: Adds a border
                ),

              
              ),
            ),
            const SizedBox(width: 10), // Spacing between input and button
            // Send button
            ElevatedButton(
              onPressed: () {
                AsyncFunctions().sendMessage(_messageController,currentUser!.uid,currentUser?.displayName);
                _messageController.clear();
              },
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              ),
              child: const Text('Send'),
            ),
          ],
        ),
      ),
    );
  }
}

