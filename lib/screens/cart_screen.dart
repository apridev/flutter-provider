import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:latihan_provider/providers/cart.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {

    final cartData = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
        centerTitle: true,
        title: Text('Cart'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Total harga : \$ ${cartData.totalHarga}',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          )
        ],
      ),
    );
  }
}
