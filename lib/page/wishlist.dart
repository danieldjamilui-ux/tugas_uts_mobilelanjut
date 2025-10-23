import 'package:flutter/material.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  final List<Map<String, dynamic>> favorites = [
    {
      'name': 'Black Grapes',
      'price': '\$2.22 x 4',
      'weight': '5.0 lbs',
      'image': 'assets/images/delima.png',
      'qty': 5,
    },
    {
      'name': 'Avacoda',
      'price': '\$2.22 x 4',
      'weight': '1.50 lbs',
      'image': 'assets/images/alpukat.png',
      'qty': 5,
    },
    {
      'name': 'Pineapple',
      'price': '\$2.22 x 4',
      'weight': 'dozen',
      'image': 'assets/images/nanas.png',
      'qty': 5,
    },
  ];

  void increaseQty(int index) {
    setState(() {
      favorites[index]['qty']++;
    });
  }

  void decreaseQty(int index) {
    setState(() {
      if (favorites[index]['qty'] > 1) favorites[index]['qty']--;
    });
  }

  void deleteItem(int index) {
    setState(() {
      favorites.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Favorites',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          final item = favorites[index];

          return Dismissible(
            key: Key(item['name']),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) => deleteItem(index),
            background: Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              color: Colors.redAccent,
              child: const Icon(Icons.delete, color: Colors.white, size: 28),
            ),
            child: Container(
              margin: const EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.1),
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    // 🥦 Gambar produk dari aset lokal
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        item['image'],
                        width: 85,
                        height: 65,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 32),

                    // 📄 Detail produk
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['price'],
                            style: const TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            item['name'],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            item['weight'],
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // ➕➖ Tombol di kanan (horizontal)
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Tombol +
                        GestureDetector(
                          onTap: () => increaseQty(index),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 0, 255, 51).withValues(alpha: 0.1),
                              shape: BoxShape.circle,
                            ),
                            padding: const EdgeInsets.all(6),
                            child: const Icon(Icons.add,
                                size: 18, color: Colors.green),
                          ),
                        ),
                        const SizedBox(width: 10),

                        // Jumlah
                        Text(
                          item['qty'].toString(),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 10),

                        // Tombol -
                        GestureDetector(
                          onTap: () => decreaseQty(index),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.withValues(alpha: 0.1),
                              shape: BoxShape.circle,
                            ),
                            padding: const EdgeInsets.all(6),
                            child: const Icon(Icons.remove,
                                size: 18, color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
