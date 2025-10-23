import 'package:flutter/material.dart';
import 'add_address_page.dart';

class ShippingMethodPage extends StatelessWidget {
  const ShippingMethodPage({super.key});

  final List<Map<String, dynamic>> shippingOptions = const [
    {
      'title': 'Standard Delivery',
      'description':
          'Order will be delivered between 3 - 4 business days straight to your doorstep.',
      'price': 3,
    },
    {
      'title': 'Next Day Delivery',
      'description':
          'Get your order delivered by tomorrow afternoon at your doorstep.',
      'price': 5,
    },
    {
      'title': 'Nominated Delivery',
      'description':
          'Pick a specific day delivery that suits your schedule best.',
      'price': 3,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Shipping Method',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          _buildProgressIndicator(),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: shippingOptions.length,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, index) {
                final option = shippingOptions[index];
                return _buildShippingCard(
                  title: option['title'],
                  description: option['description'],
                  price: option['price'],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddAddressPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildProgressIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildStepIndicator(true),
        _buildLine(),
        _buildStepIndicator(false),
        _buildLine(),
        _buildStepIndicator(false),
      ],
    );
  }

  Widget _buildStepIndicator(bool isActive) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: isActive ? Colors.green : Colors.grey.shade300,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: isActive
            ? const Icon(Icons.check, color: Colors.white, size: 18)
            : const Icon(Icons.circle, size: 8, color: Colors.white),
      ),
    );
  }

  Widget _buildLine() => Container(
        width: 40,
        height: 2,
        color: Colors.green,
      );

  Widget _buildShippingCard({
    required String title,
    required String description,
    required int price,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold)),
              Text('\$$price',
                  style: const TextStyle(
                      fontSize: 16,
                      color: Colors.green,
                      fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            description,
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
