import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
              
              ElevatedButton(onPressed: (){}, 
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
                ],
                ),

                SizedBox(height: 50,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  Column(
                    children: [
                      SizedBox(height: 20,),
                      Text('Account info'),
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