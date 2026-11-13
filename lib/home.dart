import 'package:flutter/material.dart';
import 'package:tutorials/counter.dart';
import 'package:tutorials/form.dart';
import 'package:tutorials/input.dart';
import 'package:tutorials/shopping.dart';
import 'package:tutorials/stawberry.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home)),
              Tab(icon: Icon(Icons.menu)),
              Tab(icon: Icon(Icons.assignment)),
              Tab(icon: Icon(Icons.calculate)),
              Tab(icon: Icon(Icons.shopping_cart)),
            ],
          ),
          title: Text('Tabs Demo'),
        ),
        body: TabBarView(
          children: [
            PavlovaCard(),
            InputApp(),
            MyForm(),
            MyApp(),
            MyShoppingApp(),
          ],
        ),
      ),
    );
  }
}
