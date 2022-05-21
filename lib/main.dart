import 'package:flutter/material.dart';
import 'package:latihan_provider/providers/all_products.dart';
import 'package:provider/provider.dart';

import './screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Products(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.amber,
          fontFamily: 'Lato',
        ),
        home: ProductsOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
        },
      ),
    );
  }
}

// class ScreenSementara extends StatelessWidget {

//   List<Text> myList = List.generate(20,
//    (index) => Text('${index + 1}', style: TextStyle(
//      fontSize: 35,
//      fontWeight: FontWeight.w500
//    ),));

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         leading: Icon(Icons.arrow_back),
//         centerTitle: true,
//         title: Text('Sementara'),
//       ),
//       body: ListView(
//         children: [
//           Container(
//             width: double.infinity,
//             height: 50,
//             color: Colors.greenAccent,
//           ),
//           ...myList,
//           Container(
//             width: double.infinity,
//             height: 50,
//             color: Colors.redAccent,
//           ),
//         ],
//       ),
//     );
//   }
// }