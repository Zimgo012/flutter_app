import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Login>
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
    
    final ColorScheme colors = Theme.of(context).colorScheme;


    return Material(
      color: colors.surface,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text('Hello'),
                ElevatedButton(onPressed: (){}, child: Text('Login'),
                )
                ],
            )
          ],
        ),
      ),
    );
  }
}
