import 'package:firebase_auth/firebase_auth.dart';


import '../chat/message_model.dart';
import '../chat/chat_service.dart';
import '../todolist/todo_model.dart';


class AsyncFunctions {

  //Returns name to show in profile page
  Future<String?> getUserName() async {
    final user = FirebaseAuth.instance.currentUser;
    await user?.reload(); // Ensures the latest user data
    return user?.displayName ?? 'No display name set';
  }


    // --- MESSAGING -- //

  //Sending message
  Future<void> sendMessage(messageController,uid,name) async {
    if (messageController.text.trim().isEmpty) return;
    final ChatService chatService = ChatService();
    

    final message = Message(
      id: '', // Firestore generates this
      senderId: uid,
      senderName: name ?? 'Anonymous',
      messageText: messageController.text.trim(),
      timestamp: DateTime.now(),
    );

    await chatService.sendMessage(message);
  }

  // -- TO-DO-LIST -- //



  //Adding Todo
  Future<void> addTodo(titleController, descriptionController, todoService, userId ) async {
    if (titleController.text.trim().isEmpty || descriptionController.text.trim().isEmpty) {
      return;
    }



    final newTodo = TodoModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: titleController.text.trim(),
      description: descriptionController.text.trim(),
      timestamp: DateTime.now(),
    );

    await todoService.addTodo(userId, newTodo);

  }


   //Deleting Todo
   Future<void> deleteTodo(todoService, userId, String todoId) async {
    await todoService.deleteTodo(userId, todoId);

  }


}

