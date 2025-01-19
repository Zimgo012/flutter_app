import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AsyncFunctions {

  //Returns username
  Future<String?> getUserName() async {
    final user = FirebaseAuth.instance.currentUser;
    await user?.reload(); // Ensures the latest user data
    return user?.displayName ?? 'No display name set';
  }


}