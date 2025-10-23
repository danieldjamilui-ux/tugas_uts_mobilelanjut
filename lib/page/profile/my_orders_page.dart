import 'package:flutter/material.dart';

class MyOrdersPage extends StatelessWidget {
  const MyOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'My Order',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.tune, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildOrderCard(
            orderId: '#90897',
            date: 'October 19 2021',
            items: 10,
            price: 16.90,
            statusSteps: const [
              {'label': 'Order placed', 'date': 'Oct 19 2021', 'done': true},
              {'label': 'Order confirmed', 'date': 'Oct 20 2021', 'done': true},
              {'label': 'Order shipped', 'date': 'Oct 20 2021', 'done': true},
              {'label': 'Out for delivery', 'date': 'pending', 'done': false},
              {'label': 'Order delivered', 'date': 'pending', 'done': false},
            ],
          ),
          const SizedBox(height: 24),
          _buildSimpleOrderCard('#90897', 'October 19 2021', 10, 16.90, false),
          const SizedBox(height: 16),
          _buildSimpleOrderCard('#90897', 'October 19 2021', 10, 16.90, true),
          const SizedBox(height: 16),
          _buildSimpleOrderCard('#90897', 'October 19 2021', 10, 16.90, true),
          const SizedBox(height: 40), // agar tidak kosong di bawah
        ],
      ),
    );
  }

  Widget _buildOrderCard({
    required String orderId,
    required String date,
    required int items,
    required double price,
    required List<Map<String, dynamic>> statusSteps,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 28,
                backgroundColor: Color(0xFFEAFBE7),
                child: Icon(Icons.inventory_2_outlined,
                    color: Colors.green, size: 28),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Order $orderId',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                    Text(
                      'Placed on $date',
                      style: const TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    Text(
                      'Items: $items     Total: \$${price.toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.keyboard_arrow_down_rounded,
                  color: Colors.black54, size: 28),
            ],
          ),
          const SizedBox(height: 16),
          Column(
            children: statusSteps
                .map((step) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.circle,
                                  size: 12,
                                  color: step['done']
                                      ? Colors.green
                                      : Colors.grey),
                              const SizedBox(width: 10),
                              Text(step['label'],
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: step['done']
                                        ? Colors.black
                                        : Colors.grey,
                                  )),
                            ],
                          ),
                          Text(
                            step['date'],
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 13),
                          ),
                        ],
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildSimpleOrderCard(
      String orderId, String date, int items, double price, bool delivered) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 28,
                backgroundColor: Color(0xFFEAFBE7),
                child: Icon(Icons.inventory_2_outlined,
                    color: Colors.green, size: 28),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Order $orderId',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                    Text(
                      'Placed on $date',
                      style: const TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    Text(
                      'Items: $items     Total: \$${price.toStringAsFixed(2)}',
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.keyboard_arrow_right_rounded,
                  color: Colors.black54, size: 28),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Icon(
                Icons.check_circle,
                color: delivered ? Colors.green : Colors.grey,
                size: 22,
              ),
              const SizedBox(width: 8),
              Text(
                delivered ? 'Order Delivered' : 'Pending',
                style: TextStyle(
                    fontSize: 15,
                    color: delivered ? Colors.green : Colors.grey,
                    fontWeight:
                        delivered ? FontWeight.bold : FontWeight.normal),
              ),
              const Spacer(),
              Text(
                delivered ? 'Aug 29 2021' : '',
                style: const TextStyle(color: Colors.grey, fontSize: 13),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
