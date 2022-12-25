import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:vinted_like/info_product.dart';
import 'package:vinted_like/addProduct.dart';



class StorePage extends StatelessWidget {
  const StorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: ProductInformation(),
      appBar: AppBar(
      leading:  IconButton(
        icon: Icon(Icons.add),
        /*color: Colors.grey,
        highlightColor: Colors.red,*/
        tooltip: 'Add Product',
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddProductPage()),
          );
        },
      ),
      ),
    );


      /*body: Column(
        children: [
          const Center(
              child: Text('THIS IS THE STORE PAGE')
          ),
          Expanded(
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return Image.network(
                  "https://picsum.photos/id/$index/500/300",
                  fit: BoxFit.fill,
                );
              },
              itemCount: 3,
              pagination: SwiperPagination(),
              control: SwiperControl(),
            ),
          ),
        ],
      ),*/
  }
}
