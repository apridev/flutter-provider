import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:latihan_provider/models/cart_item.dart';
import 'package:latihan_provider/models/product.dart';
import 'package:latihan_provider/providers/all_products.dart';
import 'package:latihan_provider/providers/cart.dart';
import 'package:latihan_provider/widgets/badge.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  // final String title;
  // final double price;

  // ProductDetailScreen(this.title, this.price);
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId =
        ModalRoute.of(context).settings.arguments as String; // is the id!
    final product = Provider.of<Products>(context)
        .allproduct
        .firstWhere((prodId) => prodId.id == productId);
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Product Details'),
        actions: [
          Consumer<Cart>(
            builder: (context, value, ch) {
              return Badge(
              child: ch,
              value: value.jumlah.toString()
            );
            },
            child: IconButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/cart');
                }, 
                icon: Icon(Icons.shopping_cart)
              ),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 300,
            child: Image.network(
              '${product.imageUrl}',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            '${product.title}',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            '\$${product.price}',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            '${product.description}',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton(
            onPressed: (){
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Berhasil Menambah Produk'),
                  duration: Duration(
                    milliseconds: 800
                  ),
              )
              );
              // productData diambil dari variabel productData diatas yang mana id, 
              // title dan price di ambil dari data Product
              cart.addCart(
                  product.id, product.title, product.price);
            }, 
            child: Text('Add to cart'),
          ),
        ],
      ),
    );
  }
}
