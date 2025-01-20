import 'package:cloud_firestore/cloud_firestore.dart';



class Message {
  final String id;
  final String senderId;
  final String senderName;
  final String messageText;
  final DateTime timestamp;

  //consrtuctor
  Message({
    required this.id,
    required this.senderId,
    required this.senderName,
    required this.messageText,
    required this.timestamp,
  });

  //Convert firestore doc to message object
  factory Message.fromFirestore(String id, Map<String, dynamic> data) {
    return Message(
      id: id,
      senderId: data['senderId'],
      senderName: data['senderName'],
      messageText: data['messageText'],
      timestamp: (data['timestamp'] as Timestamp).toDate(),
    );
  }


  // Convert Message object to Firestore document
  Map<String, dynamic> toFirestore() {
    return {
      'senderId': senderId,
      'senderName': senderName,
      'messageText': messageText,
      'timestamp': timestamp,
    };
  }

}