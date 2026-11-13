/* 
import 'package:flutter/material.dart';
import 'package:tutorials/page2.dart';

class MyPage1 extends StatefulWidget {
  const new({super.key});

  @override
  State<MyPage1> createState() => _MyPage1State();
}

class _MyPage1State extends State<MyPage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(children: [
      Text("First Page"),
      ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const MyPage2(age: 20, users_name: 'Hsu',),
      ),
    );
  },
  child: const Text('Go to Second Screen'),
)

    ],),);
  }
} */
