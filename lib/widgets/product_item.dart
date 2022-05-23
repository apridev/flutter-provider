import 'package:flutter/material.dart';
import 'package:latihan_provider/models/product.dart';
import 'package:latihan_provider/providers/cart.dart';
import 'package:provider/provider.dart';

import '../screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    // print("Widget Rebuild");
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: productData.id,
            );
          },
          child: Image.network(
            productData.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Product>(
            builder: (context, value, child) => IconButton(
              icon: (productData.isFavorite)
                  ? Icon(
                      Icons.favorite_outlined,
                      color: Colors.amber,
                    )
                  : Icon(
                      Icons.favorite_border_outlined,
                      color: Colors.amber,
                    ),
              color: Theme.of(context).accentColor,
              onPressed: () {
                productData.statusFav();
              },
            ),
          ),
          title: Text(
            productData.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {
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
                  productData.id, productData.title, productData.price);
            },
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
    );
  }
}
