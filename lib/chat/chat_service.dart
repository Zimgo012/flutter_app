import 'package:cloud_firestore/cloud_firestore.dart';
import './message_model.dart';


class ChatService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //Fetching message from firestore
  Stream<List<Message>> getMessage() {

    return _firestore
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots()
        .map((snapshots) => snapshots.docs
            .map((doc) => Message.fromFirestore(doc.id, doc.data()))
            .toList());
  }

  //Add new message to firestore database
  Future<void> sendMessage(Message message) async {
    await _firestore.collection('messages').add(message.toFirestore());

  }
}