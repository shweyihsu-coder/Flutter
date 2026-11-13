import 'package:flutter/material.dart';

class MyShoppingApp extends StatelessWidget {
  const MyShoppingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ShoppingPage(),
    );
  }
}

class ShoppingPage extends StatefulWidget {
  const ShoppingPage({super.key});

  @override
  State<ShoppingPage> createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  List<Map<String, dynamic>> products = [
    {'name': 'Apple', 'price': 2.0},
    {'name': 'Banana', 'price': 1.5},
    {'name': 'Orange', 'price': 3.0},
    {'name': 'Mango', 'price': 4.0},
  ];

  List<Map<String, dynamic>> cart = [];

  void addToCart(Map<String, dynamic> product) {
    setState(() {
      int index = cart.indexWhere((item) => item['name'] == product['name']);

      if (index != -1) {
        cart[index]['quantity']++;
      } else {
        cart.add({
          'name': product['name'],
          'price': product['price'],
          'quantity': 1,
        });
      }
    });
  }

  void removeFromCart(int index) {
    setState(() {
      cart.removeAt(index);
    });
  }

  void changeQuantity(int index, int amount) {
    setState(() {
      cart[index]['quantity'] += amount;

      if (cart[index]['quantity'] <= 0) {
        cart.removeAt(index);
      }
    });
  }

  double get totalPrice {
    double total = 0;

    for (var item in cart) {
      total += item['price'] * item['quantity'];
    }

    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(
                    cart: cart,
                    total: totalPrice,
                    onRemove: removeFromCart,
                    onQuantityChange: changeQuantity,
                  ),
                ),
              ).then((_) {
                setState(() {});
              });
            },
          ),
        ],
      ),

      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          var product = products[index];

          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: const Icon(
                Icons.shopping_bag,
                color: Colors.blue,
                size: 35,
              ),
              title: Text(product['name']),
              subtitle: Text('\$${product['price']}'),
              trailing: ElevatedButton(
                onPressed: () => addToCart(product),
                child: const Text('Add'),
              ),
            ),
          );
        },
      ),
    );
  }
}

// CART PAGE

class CartPage extends StatefulWidget {
  final List<Map<String, dynamic>> cart;
  final double total;
  final Function(int) onRemove;
  final Function(int, int) onQuantityChange;

  const CartPage({
    super.key,
    required this.cart,
    required this.total,
    required this.onRemove,
    required this.onQuantityChange,
  });

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    double total = widget.cart.fold(
      0,
      (sum, item) => sum + item['price'] * item['quantity'],
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: Column(
        children: [
          Expanded(
            child: widget.cart.isEmpty
                ? const Center(child: Text('Your cart is empty'))
                : ListView.builder(
                    itemCount: widget.cart.length,
                    itemBuilder: (context, index) {
                      var item = widget.cart[index];

                      return Card(
                        child: ListTile(
                          title: Text(item['name']),
                          subtitle: Text(
                            '\$${item['price']} x ${item['quantity']}',
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    widget.onQuantityChange(index, -1);
                                  });
                                },
                                icon: const Icon(Icons.remove),
                              ),
                              Text('${item['quantity']}'),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    widget.onQuantityChange(index, 1);
                                  });
                                },
                                icon: const Icon(Icons.add),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    widget.onRemove(index);
                                  });
                                },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  'Total: \$${total.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: widget.cart.isEmpty
                      ? null
                      : () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Order placed!')),
                          );
                        },
                  child: const Text('Checkout'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
