import 'package:flutter/material.dart';
import 'categories_page.dart';
import 'Featured_Products/product_detail_page.dart';
import 'profile/profile.dart';
import 'wishlist.dart';
import 'filter_page.dart'; // ✅ Halaman filter

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {'icon': Icons.eco, 'label': 'Vegetables', 'color': Colors.green},
      {'icon': Icons.apple, 'label': 'Fruits', 'color': Colors.red},
      {'icon': Icons.local_drink, 'label': 'Beverages', 'color': Colors.blue},
      {'icon': Icons.shopping_bag, 'label': 'Grocery', 'color': Colors.orange},
      {'icon': Icons.oil_barrel, 'label': 'Edible oil', 'color': Colors.brown},
      {'icon': Icons.cleaning_services, 'label': 'Household', 'color': Colors.purple},
      {'icon': Icons.child_care, 'label': 'Babycare', 'color': Colors.lightBlue},
    ];

    final products = [
      {
        'name': 'Fresh Peach',
        'price': '\$8.00',
        'unit': 'dozen',
        'image': 'assets/images/persik.png',
        'isNew': false,
        'discount': null,
      },
      {
        'name': 'Avocado',
        'price': '\$7.00',
        'unit': '2.0 lbs',
        'image': 'assets/images/alpukat.png',
        'isNew': true,
        'discount': null,
      },
      {
        'name': 'Pineapple',
        'price': '\$9.90',
        'unit': '1.50 lbs',
        'image': 'assets/images/nanas.png',
        'isNew': false,
        'discount': null,
      },
      {
        'name': 'Black Grapes',
        'price': '\$7.05',
        'unit': '5.0 lbs',
        'image': 'assets/images/anggur.png',
        'isNew': false,
        'discount': '-16%',
      },
      {
        'name': 'Pomegranate',
        'price': '\$2.09',
        'unit': '1.50 lbs',
        'image': 'assets/images/delima.png',
        'isNew': true,
        'discount': null,
      },
      {
        'name': 'Fresh Broccoli',
        'price': '\$3.00',
        'unit': '1 kg',
        'image': 'assets/images/brokoli.png',
        'isNew': false,
        'discount': null,
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔍 Search Bar dengan ikon filter di dalamnya
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search keywords..',
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.tune, color: Colors.black87),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const FilterPage()),
                        );
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.grey[100],
                  ),
                ),
              ),

              // 🥗 Promo Banner
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/images/banner.jpg',
                        height: 210,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        left: 16,
                        bottom: 16,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          color: Colors.white.withValues(alpha: 0.7),
                          child: const Text(
                            '20% off on your first purchase',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // 🧩 Categories
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Categories',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      icon: const Icon(Icons.arrow_forward_ios, size: 16),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const CategoriesPage()),
                        );
                      },
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 80,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemBuilder: (context, index) {
                    final item = categories[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: (item['color'] as Color).withValues(alpha: 0.2),
                            child: Icon(item['icon'] as IconData, color: item['color'] as Color),
                          ),
                          const SizedBox(height: 5),
                          Text(item['label'] as String, style: const TextStyle(fontSize: 12)),
                        ],
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 16),

              // 🛒 Featured Products
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Featured Products',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 12),

              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.72,
                ),
                itemBuilder: (context, index) {
                  final item = products[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailPage(product: item),
                        ),
                      );
                    },
                    child: _buildProductCard(context, item),
                  );
                },
              ),
              const SizedBox(height: 70),
            ],
          ),
        ),
      ),

      // 🧭 Bottom Navigation
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 8,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(icon: const Icon(Icons.home_outlined, color: Colors.black), onPressed: () {}),
              IconButton(
                icon: const Icon(Icons.person_outline, color: Colors.grey),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ProfilePage()),
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.favorite_border, color: Colors.grey),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const WishlistPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),

      // 🛍 Floating Action Button
      floatingActionButton: Transform.translate(
        offset: const Offset(0, -10),
        child: FloatingActionButton(
          backgroundColor: Colors.green,
          elevation: 10,
          onPressed: () {},
          child: const Icon(Icons.shopping_bag_outlined, color: Colors.white),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }

  Widget _buildProductCard(BuildContext context, Map<String, dynamic> item) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 5,
            spreadRadius: 1,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(item['image'], height: 80),
              ),
              Positioned(
                top: 70,
                right: -3,
                child: IconButton(
                  icon: const Icon(Icons.favorite_border, color: Colors.grey, size: 20),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailPage(product: item),
                      ),
                    );
                  },
                ),
              ),
              if (item['isNew'] == true)
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.orange.shade100,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Text(
                      'NEW',
                      style: TextStyle(fontSize: 10, color: Colors.orange, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              if (item['discount'] != null)
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.red.shade100,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      item['discount'],
                      style: const TextStyle(fontSize: 10, color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
            ],
          ),
          Text(item['price'], style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
          Text(item['name'], style: const TextStyle(fontWeight: FontWeight.w600)),
          Text(item['unit'], style: const TextStyle(color: Colors.grey, fontSize: 12)),
          const Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailPage(product: item),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.symmetric(vertical: 6),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Text(
                  'Add to cart',
                  style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 13),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
