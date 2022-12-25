import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context){
    return Scaffold(
    appBar: AppBar(
      automaticallyImplyLeading: false,
    title: const Text('Welcome to MIAGED', style: TextStyle(color: Colors.lightGreen)),
    centerTitle: true,
    backgroundColor: Colors.grey[900],
    ),
      body: const Center(
          child: Text('THIS IS THE HOME PAGE')
            ),
          );
  }
}