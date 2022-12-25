import 'package:vinted_like/home_page.dart';
import 'package:vinted_like/Pages/Panier.dart';
import 'package:vinted_like/Pages/Profile.dart';
import 'package:vinted_like/Pages/Store.dart';
import 'package:flutter/material.dart';

class BottomBarPage extends StatefulWidget {
  const BottomBarPage({Key? key}) : super(key: key);

  @override
  State<BottomBarPage> createState() => _BottomBarPageState();
}

class _BottomBarPageState extends State<BottomBarPage> {

  int _selectedIndex = 0;
  final List<Map<String, dynamic>> _pages  = [
    {
      'page': const HomePage(),
      'title': 'Home',
    },
    {
      'page': const StorePage(),
      'title': 'Store',
    },
    {
      'page': const PanierPage(),
      'title': 'Panier',
    },
    {
      'page':  ProfilePage(),
      'title': 'Profile',
    },

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title:  Text(_pages[_selectedIndex]['title'], style: TextStyle(color: Colors.black)),

        centerTitle: true,
        backgroundColor: Colors.red[300],
      ),
      body: _pages[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.brown[100],
        //showSelectedLabels: false,
        //showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: 'Store',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Panier',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
