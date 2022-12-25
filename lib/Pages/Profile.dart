import 'package:flutter/material.dart';
import 'package:vinted_like/home_page.dart';
import 'package:vinted_like/bottom_bar.dart';


class ProfilePage extends StatefulWidget {
 _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  int _isPressed=0;
void  _onTap() {
    setState(() {
      if(_isPressed == 1){

      }
      else if(_isPressed == 2){

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
                   '  HI, ' + 'username',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
               ),
               subtitle: Text(
                   '  user@mail.com ',
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


