
import 'package:flutter/material.dart';
import 'package:tutorials/page1.dart';
import 'package:tutorials/page2.dart';

class MyPage2 extends StatefulWidget {
  final int age;
  final String users_name;

  const new({super.key, required this.age, required this.users_name});
  

  @override
  State<MyPage2> createState() => _MyPage2State();
}

class _MyPage2State extends State<MyPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(children: [
      Text("Second Page"),
       Text(widget.users_name),
        Text(widget.age.toString()),
      ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const MyPage1(),
      ),
    );
  },
  child: const Text('Go to First Screen'),
)

    ],),);
  }
}