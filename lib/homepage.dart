import 'package:app_for_practice/chat.dart';
import 'package:app_for_practice/profile.dart';
import 'package:app_for_practice/todolist.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

      // -- some state here --
    final ColorScheme colors = Theme.of(context).colorScheme;

    return Material(

          
          child: Padding(
            padding: const EdgeInsets.only(top: 70),
            child: Column(
            children: [
              Container(
                color: colors.primary,
                margin: const EdgeInsets.all(10.0),
                width: 300.0,
                height: 120.0,
                alignment: Alignment.center,
                child: Text(
                  'Welcome user, ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold
                  ) 
                  )
              ),

              SizedBox(height: 80,),

              Column(
                children: [

                  //ROW 1
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    // -- Chat --
                  Column(
                    children: [
                        GestureDetector(
                          onTap: () {
                            // Code to execute when the icon is clicked
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Chat()),
                            );
                          },
                          child: Icon(
                            Icons.message,
                            color: colors.primary,
                            size: 40,
                          ),
                        ),
                        SizedBox(height: 20),
                        Text('Chat'),
                      ],
                  ),
                  
                  // -- To do List -- 
                  Column(
                    children: [
                        GestureDetector(
                          onTap: () {
                            // Code to execute when the icon is clicked
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Todolist()),
                            );
                          },
                          child: Icon(
                            Icons.checklist,
                            color: colors.primary,
                            size: 40,
                          ),
                        ),
                        SizedBox(height: 20),
                        Text('To-Do-List'),
                      ],
                  ),
                ],
                ),

                SizedBox(height: 50,),
                
                //Row 2
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  
                  // -- Profile Button --
                   Column(
                    children: [
                        GestureDetector(
                          onTap: () {
                            // Code to execute when the icon is clicked
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Profile()),
                            );
                          },
                          child: Icon(
                            Icons.account_circle,
                            color: colors.primary,
                            size: 40,
                          ),
                        ),
                        SizedBox(height: 20),
                        Text('Profile'),
                      ],
                  ),

                  // -- Log out button --
                   Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Code to execute when the icon is clicked
                            Navigator.pop(context);
                            //Insert clear token here
                          },
                          child: Icon(
                            Icons.logout,
                            color: colors.primary,
                            size: 40,
                          ),
                        ),
                        SizedBox(height: 20),
                        Text('Logout'),
                      ],
                  ),
                ],
                )
                ],
              )
            ],
          
            ),
          ),

    );
  }
}


