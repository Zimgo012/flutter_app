import 'package:cloud_firestore/cloud_firestore.dart';

class TodoModel {
  final String id;
  final String title;
  final String description;
  final DateTime timestamp;

  TodoModel({
    required this.id,
    required this.title,
    required this.description,
    required this.timestamp,
  });

  //Convert firestore doc to message object
  factory TodoModel.fromFirestore(Map<String, dynamic> data) {
    return TodoModel(
      id: data['id'],
      title: data['title'],
      description: data['description'],
      timestamp: (data['timestamp'] as Timestamp).toDate(),
    );
  }
  //Convert objects to firestore docs
  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'timestamp': timestamp,
    };
  }
}
