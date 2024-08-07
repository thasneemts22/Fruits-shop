import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/providers/providers_shop.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final providers = Provider.of<ShopList>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: const Text('Shopping list'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/shopList');
            },
            icon: providers.cartCount == 0
                ? const Icon(Icons.add_shopping_cart_outlined)
                : Stack(
                    children: [
                      const Icon(Icons.add_shopping_cart_outlined, size: 30),
                      Positioned(
                        right: 0,
                        child: CircleAvatar(
                          radius: 8,
                          backgroundColor: Colors.red,
                          child: Text(
                            '${providers.cartCount}',
                            style: const TextStyle(
                                fontSize: 10, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: providers.items.length,
        itemBuilder: (context, index) => ListTile(
          leading: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(providers.items[index].image),
              ),
            ),
          ),
          title: Text(
            providers.items[index].name,
            style: const TextStyle(fontSize: 18),
          ),
          trailing: SizedBox(
            width: 110,
            child: Row(
              children: [
                IconButton(
                  color: Colors.blue.shade900,
                  onPressed: () {
                    providers.addToCart(providers.items[index]);
                  },
                  icon: const Icon(Icons.add_circle),
                ),
                Text(
                  '${providers.items[index].count}',
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                IconButton(
                  color: Colors.blue.shade900,
                  onPressed: providers.items[index].count == 0
                      ? null
                      : () {
                          providers.removeFromCart(providers.items[index]);
                        },
                  icon: const Icon(Icons.remove_circle),
                ),
              ],
            ),
          ),
        ),
        separatorBuilder: (context, index) => const Divider(thickness: 2),
      ),
    );
  }
}
