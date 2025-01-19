//TODO: make the change profile picture operational



import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;

import 'package:flutter/material.dart';
import './otherWidgets/editUserInfo.dart';
import './otherWidgets/AsyncFunctions.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String? displayName;
  
  @override
  void initState() {
    super.initState();
    // Fetch the initial display name
    displayName = FirebaseAuth.instance.currentUser?.displayName ?? 'No name set';
  }

  
  
  
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
            Navigator.pop(context);
        },
      ),
      
       title: Text(
        'Profile',
        style: TextStyle(
          color: Colors.white,
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
      ),
        ),

      body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40.0, bottom: 20),
                child: Image.network('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                      width: 120,
                ),
              ),
              
              ElevatedButton(
                onPressed: () async{
      
                   }, 
              child:  Text('Change profile picture')
              ),

              SizedBox(height: 80,),

              Column(
                children: [

                  //ROW 1
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  Column(
                    children: [
                      SizedBox(height: 20,),
                      Text('Account Name '),
                    ],
                  ),

                   Column(
                    children: [
                      SizedBox(height: 20,),
                      FutureBuilder(future: AsyncFunctions().getUserName(), 
                      builder: (context,snapshot){
                         if (snapshot.connectionState == ConnectionState.waiting) {
                            return CircularProgressIndicator(); // Show a loading spinner
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else if (snapshot.hasData) {
                            return Text(snapshot.data ?? '--');
                          } else {
                            return Text('--');
                      }}
                      )
                    ],
                  ),

                   IconButton(
                    icon: Icon(Icons.change_circle),
                    onPressed: (){

                      dialogBuilder(context, (){
                        
                        setState(() {
                          displayName = FirebaseAuth.instance.currentUser?.displayName;
                        });
                      });
                    },
                  ),
                ],
                ),

                SizedBox(height: 50,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  Column(
                    children: [
                      SizedBox(height: 20,),
                      Text('Account email'),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(height: 20,),
                      Text(FirebaseAuth.instance.currentUser?.email ?? 'Test'),
                    ],
                  ),

                  
                ],
                )
                
                
                ],
              )
            ],
          
            ),
    
    );
  }
}