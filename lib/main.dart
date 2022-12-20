// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter vinted like debut',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to MIAGED', style: TextStyle(color: Colors.lightGreen)),
          backgroundColor: Colors.red  ,
        ),

        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const Text('A unique marketplace for clothes!', style:
                 TextStyle(color: Colors.black87, fontSize: 20.0, fontWeight: FontWeight.bold)),
            const Text('Buy and sell clothes with other users', style:
                 TextStyle(color: Colors.black87, fontSize: 20.0, fontWeight: FontWeight.bold)),
            Container(
            color: Colors.red,
            child: const Image(image:AssetImage('assets/airforceWhite&Black.PNG')) ,
            ),
              Row(
            children: <Widget>[

              Container(
                color: Colors.amberAccent,
                child: const Text('GET STARTED?', style: TextStyle(fontSize: 30.0, color: Colors.white),),
                padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
                margin: const EdgeInsets.all(10.0),
              ),
              const Text('Here we go!!', style: TextStyle(fontSize: 30.0, color: Colors.black)
              ),
            ],
          ),
          ]
        ),






        /* const Center(
          child: Text('Get started!',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 30,
            fontWeight: FontWeight.bold,
                          ),
                     ),*/
/*
 Image(
              image: AssetImage('assets/messi_boots.PNG')
                      image.assets('assets/messi_boots.PNG')
          ),
 */
        /*Icon (Icons.shopping_cart, color: Colors.orangeAccent, size: 50,),*/





        floatingActionButton: FloatingActionButton(
          onPressed: () {  },
          child: const Text('next', style: TextStyle(color: Colors.cyanAccent, fontSize: 15, fontWeight: FontWeight.bold,)),
          backgroundColor: Colors.redAccent,
        ),
    ),
    );
  }
}