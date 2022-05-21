import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:latihan_provider/models/product.dart';
import 'package:latihan_provider/providers/all_products.dart';
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
    final product = Provider.of<Products>(context).allproduct.firstWhere((prodId) => prodId.id == productId);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Product Details'),
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
          const
           SizedBox(
            height: 30,
          ),
          Text('${product.title}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
          const SizedBox(
            height: 20,
          ),
          Text('\$${product.price}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
          const SizedBox(
            height: 20,
          ),
          Text('${product.description}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),)
        ],
      ),
    );
  }
}
