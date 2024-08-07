import 'package:flutter/material.dart';
import 'package:shopping_cart/model/model.dart';

class ShopList extends ChangeNotifier {
  final List<Item> items = [
    Item(name: 'Banana', image: 'images/banana.png', count: 0),
    Item(name: 'Blueberry', image: 'images/blueberry.jpg', count: 0),
    Item(name: 'Guava', image: 'images/guava.jpg', count: 0),
    Item(name: 'Grapes', image: 'images/grapes.png', count: 0),
    Item(name: 'Orange', image: 'images/orange.png', count: 0),
    Item(name: 'Mango', image: 'images/mango.png', count: 0),
    Item(name: 'Strawberry', image: 'images/strawberry.png', count: 0),
    Item(name: 'Watermelon', image: 'images/watermelon.png', count: 0),
    Item(name: 'Lemon', image: 'images/lemon.jpg', count: 0),
    Item(name: 'Cherry', image: 'images/Cherry.png', count: 0),
  ];

  List<Item> cartItem = [];

  int cartCount = 0;

  List<Item> get itemList => items;
  List<Item> get cartItems => cartItem;
  int get itemCount => items.length;
  int get cartItemCount => cartItem.length;
  int get cartCounts => cartCount <= 0 ? 0 : cartCount;

  void addToCart(Item item) {
    final int itemIndex = items.indexOf(item);

    if (cartItem.contains(item)) {
      final int cartIndex = cartItem.indexOf(item);
      cartItem[cartIndex].count++;
    } else {
      cartItem.add(item);
      final int cartIndex = cartItem.indexOf(item);
      cartItem[cartIndex].count = 1;
      items[itemIndex].count = 1;
    }
    cartCount++;
    notifyListeners();
  }

  void removeFromCart(Item item) {
    final int itemIndex = items.indexOf(item);

    if (cartItem.contains(item)) {
      final int cartIndex = cartItem.indexOf(item);
      if (cartItem[cartIndex].count == 1) {
        items[itemIndex].count = 0;
        cartItem.removeAt(cartIndex);
      } else {
        cartItem[cartIndex].count--;
      }
      cartCount--;
    }
    notifyListeners();
  }
}
