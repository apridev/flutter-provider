import 'package:flutter/material.dart';
import 'package:latihan_provider/models/cart_item.dart';

class Cart with ChangeNotifier{
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => _items;

  int get jumlah {
    return _items.length;
  }

  double get totalHarga {
    var total = 0.0;
    _items.forEach((key, CartItem) {
        total += CartItem.qty * CartItem.price;
     });
     return total;
  }

  void addCart(String productId, String title, double price){
    // Pengkondisian
    if(_items.containsKey(productId)){
      // Ketika sudah tesedia key product id
      _items.update(productId, (value) => CartItem(
        id: value.id, 
        title: value.title, 
        price: value.price, 
        qty: value.qty + 1),
      );
    } else{
      // Tambah product id baru
      _items.putIfAbsent(productId, () => CartItem(
        id: DateTime.now().toString(), 
        price: price, 
        qty: 1,
        title: title),
      );
    }
    notifyListeners();
  }
}