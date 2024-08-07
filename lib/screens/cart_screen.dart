import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/providers/providers_shop.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final providers = Provider.of<ShopList>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: Center(
          child: Text('Total Cart Items: ${providers.cartItemCount}'),
        ),
      ),
      body: providers.cartItemCount == 0
          ? Center(
              child: Text(
                'No Items in cart',
                style: TextStyle(
                  color: Colors.blueGrey.shade400.withOpacity(0.5),
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          : ListView.builder(
              itemCount: providers.cartItems.length,
              itemBuilder: (context, index) => ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(providers.cartItems[index].image),
                    ),
                  ),
                ),
                title: Text(
                  providers.cartItems[index].name,
                  style: const TextStyle(fontSize: 18),
                ),
                trailing: SizedBox(
                  width: 110,
                  child: Row(
                    children: [
                      IconButton(
                        color: Colors.blue.shade900,
                        onPressed: () {
                          providers.addToCart(providers.cartItems[index]);
                        },
                        icon: const Icon(Icons.add_circle),
                      ),
                      Text(
                        '${providers.cartItems[index].count}',
                        style: const TextStyle(fontSize: 18),
                      ),
                      IconButton(
                        color: Colors.blue.shade900,
                        onPressed: providers.cartItems[index].count == 0
                            ? null
                            : () {
                                providers
                                    .removeFromCart(providers.cartItems[index]);
                              },
                        icon: const Icon(Icons.remove_circle),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
