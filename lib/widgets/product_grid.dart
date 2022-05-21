import 'package:flutter/material.dart';
import 'package:latihan_provider/providers/all_products.dart';
import 'package:latihan_provider/widgets/product_item.dart';
import 'package:provider/provider.dart';

class ProductGrid extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // !Harus dipasang pada home terlebih dahulu
   final productData = Provider.of<Products>(context);

   final all_product = productData.allproduct;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: all_product.length,
      // ? i = index
      //  Todo jika provider dalam suatu widget maka buat dengan ChangeNotifierProvider.value()
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: all_product[i],
        child: ProductItem(),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
