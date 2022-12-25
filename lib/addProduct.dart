import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({Key? key}) : super(key: key);

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}


  /*FirebaseFirestore.instance.collection('products').add({
    'name': 'name',
    'description': 'description',
    'price': 0,
    'size': 'size',
    'color': 'color',
    'category': 'category',
    'image': 'image',
  });*/


class _AddProductPageState extends State<AddProductPage> {

  final nameController = TextEditingController();
  final brandController = TextEditingController();
  final priceController = TextEditingController();
  final sizeController = TextEditingController();
  final imageController = TextEditingController();

 /* List<String> Sizes = [];
  List<String> Categories= [];*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product', style: TextStyle(color: Colors.lightGreen)),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
      ),
        body: Column(
          children: [
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
                side: const BorderSide(color: Colors.grey, width: 1),
              ),
              title: Row(
                children:  [
                  Text('Name: '),
                  Expanded(
                    child: TextField(
                      decoration:  InputDecoration(
                        border: InputBorder.none,
                      ),
                      controller: nameController,
                    ),
                  ),
                ],
              ),

            ),

            const SizedBox(height: 20),

            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
                side: const BorderSide(color: Colors.grey, width: 1),
              ),
              title: Row(
                children:  [
                  Text('brand: '),
                  Expanded(
                    child: TextField(
                      decoration:  InputDecoration(
                        border: InputBorder.none,
                      ),
                      controller: brandController,
                    ),
                  ),
                ],
              ),

            ),

            const SizedBox(height: 20),

            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
                side: const BorderSide(color: Colors.grey, width: 1),
              ),
              title: Row(
                children:  [
                  Text('Price: '),
                  Expanded(
                    child: TextField(
                      decoration:  InputDecoration(
                        border: InputBorder.none,
                      ),
                      controller: priceController,
                    ),
                  ),
                ],
              ),

            ),

            const SizedBox(height: 20),

            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
                side: const BorderSide(color: Colors.grey, width: 1),
              ),
              title: Row(
                children:  [
                  Text('size: '),
                  Expanded(
                    child: TextField(
                      decoration:  InputDecoration(
                        border: InputBorder.none,
                      ),
                      controller: sizeController,
                    ),
                  ),
                ],
              ),

            ),

            const SizedBox(height: 20),

            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
                side: const BorderSide(color: Colors.grey, width: 1),
              ),
              title: Row(
                children:  [
                  Text('image link: '),
                  Expanded(
                    child: TextField(
                      decoration:  InputDecoration(
                        border: InputBorder.none,
                      ),
                      controller: imageController,
                    ),
                  ),
                ],
              ),

            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                FirebaseFirestore.instance.collection('vêtements').add({
                  'titre': nameController.text,
                  'brand': brandController.text,
                  'prix': priceController.text,
                  'size': sizeController.text,
                  'image': imageController.text,
                });
                Navigator.pop(context);
                print("ajout success!");
              },
              child: const Text('Add Product'),

            ),
          ],
        ),
    );
  }
}

