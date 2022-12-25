import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:provider/provider.dart';
import 'package:vinted_like/home_page.dart';
import 'package:vinted_like/bottom_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:vinted_like/firebase/firebaseConfig.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vinted_like/Auth/login.dart';


class ProfilePage extends StatefulWidget {
 _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? _email;

  final _nameTextController = TextEditingController();

    @override
    void initState() {
      getUser();
      super.initState();
    }
  void signOut()  async{
    await FirebaseAuth.instance.signOut();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const LoginPage())
    );
}

  Future<void> getUser() async {
    final User? user = FirebaseAuth.instance.currentUser;
    try {
      String _uid = user!.uid;
        _nameTextController.text = user.displayName!;
    } catch (error) {
      print(error);
    } finally {
      setState(() {
        _email = user!.email;
      });
    }
  }


  int isPressed=0;
void  _onTap() {
    setState(() {
      if(isPressed == 1){

      }
      else if(isPressed == 2){

         signOut();
         print("deconecterr");
      }
      else{
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BottomBarPage()),
        );
        print("test");
      }

    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(  //use singleChildScrollView for scrolling
         child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children:
           <Widget>[
             ListTile(
               //need to make it onPressed on Icon// onTap: () {},
               title:  Text(
                   '  HI, ',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
               ),
               subtitle: Text(
                   '$_email',
                   style: TextStyle(
                     fontSize: 15,
                     fontWeight: FontWeight.bold,

                   ),

               ),
               leading: Icon(
                 Icons.handshake_outlined,
                 color: Colors.black,
                 size: 40,

               ),
               trailing: IconButton(
                 onPressed: _onTap,
                 icon: Icon(
                   Icons.home,
                   color: Colors.black,
                   size: 40,
                 ),

               ),

             ),
             ListTile(
               title: Text(
                 '  MON PROFIL ',
                 style: TextStyle(
                   fontSize: 15,
                   fontWeight: FontWeight.bold,
                 ),
               ),
               subtitle: Text(
                 '  show profile informations ',
                 style: TextStyle(
                   fontSize: 15,
                   fontWeight: FontWeight.bold,
                 ),
               ),
               leading: Icon(
                 Icons.person,
                 color: Colors.black,
                 size: 40,
               ),
               trailing: IconButton(
                 onPressed: _onTap,
                 icon: Icon(
                   Icons.arrow_forward_ios,
                   color: Colors.black,
                   size: 40,
                 ),

               ),


             ),
             ListTile(
               title: Text(
                 '  Deconnexion ',
                 style: TextStyle(
                   fontSize: 15,
                   fontWeight: FontWeight.bold,
                 ),
               ),
               subtitle: Text(
                 '  or switch account ',
                 style: TextStyle(
                   fontSize: 15,
                   fontWeight: FontWeight.bold,
                 ),
               ),
               leading: Icon(
                 Icons.logout,
                 color: Colors.black,
                 size: 40,
               ),
               trailing: IconButton(
                 onPressed: _onTap,
                 icon: Icon(
                   Icons.output_outlined,
                   color: Colors.black,
                   size: 40,
                 ),

               ),

             ),
           ],
         )
        ),
          );

  }
}


