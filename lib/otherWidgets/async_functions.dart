import 'package:firebase_auth/firebase_auth.dart';
import '../chat/message_model.dart';
import '../chat/chat_service.dart';


class AsyncFunctions {

  //Returns username
  Future<String?> getUserName() async {
    final user = FirebaseAuth.instance.currentUser;
    await user?.reload(); // Ensures the latest user data
    return user?.displayName ?? 'No display name set';
  }

  Future<void> sendMessage(messageController,uid,name) async {
    if (messageController.text.trim().isEmpty) return;
    ChatService chatService = ChatService();
    

    final message = Message(
      id: '', // Firestore generates this
      senderId: uid,
      senderName: name ?? 'Anonymous',
      messageText: messageController.text.trim(),
      timestamp: DateTime.now(),
    );

    await chatService.sendMessage(message);
  }

}