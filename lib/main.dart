// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:vinted_like/home_page.dart';
import 'package:vinted_like/bottom_bar.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter vinted like debut',
      home: BottomBarPage(), //HomePage(),
    );
  }
}

      /* Scaffold(
        appBar: AppBar(
          title: const Text('Welcome to MIAGED', style: TextStyle(color: Colors.lightGreen)),
          centerTitle: true,
          backgroundColor: Colors.grey[900],
        ),

        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const Text('A unique marketplace for clothes!', style:
                 TextStyle(color: Colors.black87, fontSize: 20.0, fontWeight: FontWeight.bold)),
            const Text('Buy and sell clothes with other users', style:
                 TextStyle(color: Colors.black87, fontSize: 20.0, fontWeight: FontWeight.bold)),

            Row(
              children: [
                Container(
                  margin: const EdgeInsets.
                  child: const Image(image:AssetImage('assets/airforceWhite&Black.PNG')) ,
                  ),

                Container(
                  margin: const EdgeInsets.only(left: 10.0),
                    child: const Image(image:AssetImage('assets/messi_boots.PNG')) ,
                  ),
              ],
            ),



                Row(
            children: <Widget>[

                Expanded(
                  flex: 4,
                  child: Container(
                    color: Colors.grey[900],
                    child: Center(child: const Text('GET STARTED?', style: TextStyle(fontSize: 30.0, color: Colors.white),)),
                    padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
                    margin: const EdgeInsets.all(10.0),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: const Text('Here we go!!', style: TextStyle(fontSize: 30.0, color: Colors.black)
                  ),
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
}  */