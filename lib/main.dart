// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:vinted_like/home_page.dart';
import 'package:vinted_like/bottom_bar.dart';
import 'package:vinted_like/Auth/login.dart';
import 'package:vinted_like/Auth/register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vinted_like/firebase/firebaseConfig.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // Replace with actual values
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter vinted like debut',
      home: LoginPage(),
    );
  }
}

/*void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  _State createState() => new _State();
}

final Future<FirebaseApp> _firebaseInitialization = Firebase.initializeApp();

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const  MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter vinted like debut',
    home:  LoginPage(),*//*BottomBarPage(),*//*//HomePage(),// RegisterPage(), //  BottomBarPage(),
    );
  }
}


class _State extends State<MyApp> {
  @override
  Widget build(BuildContext context) => Scaffold(

    body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot){

        return const LoginPage();

        *//*if(snapshot.hasData)
          {
            return const BottomBarPage();
          }
        else
          {
            return const LoginPage();
          }*//*
      }
    )
  );
}*/
    /*return FutureBuilder(
      future: _firebaseInitialization,
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.waiting) {
          return const MaterialApp(
            home: Scaffold(
              body: Center(
                child: CircularProgressIndicator(), //loading
              ),
            ),
          );
        }
        else if(snapshot.hasError) {
          return const MaterialApp(
            home: Scaffold(
              body: Center(
                child: Text('an Error occured!!'), //error
              ),
            ),
          );
        }
         else{
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter vinted like debut',
          home: LoginPage(),//HomePage(),// RegisterPage(), //  BottomBarPage(),
        );
         }

      }
    );*/

//--

/*
 class loginInformation extends StatefulWidget {
   const loginInformation({Key? key}) : super(key: key);

   @override
   State<loginInformation> createState() => _loginInformationState();
 }

 class _loginInformationState extends State<loginInformation> {
   final Stream<QuerySnapshot> LoginStream =
   FirebaseFirestore.instance.collection('users').snapshots();
   @override
   Widget build(BuildContext context) {
     return StreamBuilder(
       stream: LoginStream,
       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
         if (snapshot.hasError) {
           return Text('Something went wrong');
         }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
         }

        return  ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
             Map<String, dynamic> data =
             document.data()! as Map<String, dynamic>;
            return  ListTile(
               title:  Text(data['mail']),
               subtitle:  Text(data['password']),
             );
           }).toList(),
        );
       },
     );
 }

 }
*/

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
/*

else {
          return MaterialApp(
            title: 'Vinted Like',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: HomePage(),
            routes: <String, WidgetBuilder>{
              '/home': (BuildContext context) => new HomePage(),
              '/login': (BuildContext context) => new LoginPage(),
              '/register': (BuildContext context) => new RegisterPage(),
            },
          );
        }

*/