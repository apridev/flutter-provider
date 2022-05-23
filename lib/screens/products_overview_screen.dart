
import 'package:flutter/material.dart';
import 'package:latihan_provider/providers/cart.dart';
import 'package:latihan_provider/widgets/badge.dart';
import 'package:latihan_provider/widgets/product_grid.dart';
import 'package:provider/provider.dart';

import '../models/product.dart';
import '../widgets/product_grid.dart';

class ProductsOverviewScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('MyShop'),
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
      body: ProductGrid(),
    );
  }
}