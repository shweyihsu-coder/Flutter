import 'package:flutter/material.dart';
import 'package:tutorials/input.dart';

class MyPage2 extends StatefulWidget {
  //final int age;
  final String email;

  const MyPage2({super.key, required this.email});

  @override
  State<MyPage2> createState() => _MyPage2State();
}

class _MyPage2State extends State<MyPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Your email is:"),
          Text(widget.email),

          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const InputApp()),
              );
            },
            child: const Text('Go to First Screen'),
          ),
        ],
      ),
    );
  }
}
