import 'package:flutter/material.dart';

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final transactions = [
      {"method": "Master Card", "date": "Dec 12 2021 at 10:00 pm", "amount": "\$89"},
      {"method": "Visa", "date": "Dec 12 2021 at 10:00 pm", "amount": "\$109"},
      {"method": "Paypal", "date": "Dec 12 2021 at 10:00 pm", "amount": "\$567"},
      {"method": "Paypal", "date": "Dec 12 2021 at 10:00 pm", "amount": "\$567"},
      {"method": "Master Card", "date": "Dec 12 2021 at 10:00 pm", "amount": "\$109"},
      {"method": "Master Card", "date": "Dec 12 2021 at 10:00 pm", "amount": "\$89"},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Transactions",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          final t = transactions[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                // Payment Logo
                _buildPaymentLogo(t["method"]!),
                const SizedBox(width: 16),
                // Transaction Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        t["method"]!,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        t["date"]!,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
                // Amount
                Text(
                  t["amount"]!,
                  style: const TextStyle(
                    color: Color(0xFF4CAF50),
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  /// Build payment logo berdasarkan metode pembayaran
  Widget _buildPaymentLogo(String method) {
    switch (method) {
      case "Master Card":
        return Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: const Color(0xFFFFF3E0),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  left: 11,
                  child: Container(
                    width: 18,
                    height: 18,
                    decoration: const BoxDecoration(
                      color: Color(0xFFEB001B),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Positioned(
                  right: 11,
                  child: Container(
                    width: 18,
                    height: 18,
                    decoration: const BoxDecoration(
                      color: Color(0xFFF79E1B),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );

      case "Visa":
        return Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: const Color(0xFFE3F2FD),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              "VISA",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontStyle: FontStyle.italic,
                color: Colors.blue.shade700,
                fontSize: 14,
                letterSpacing: 0.5,
              ),
            ),
          ),
        );

      case "Paypal":
        return Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: const Color(0xFFE3F2FD),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Stack(
              children: [
                // Letter P (top-left, darker blue)
                Positioned(
                  left: 12,
                  top: 8,
                  child: Text(
                    "P",
                    style: TextStyle(
                      color: const Color(0xFF003087),
                      fontWeight: FontWeight.w900,
                      fontSize: 24,
                      height: 1,
                    ),
                  ),
                ),
                // Letter P (bottom-right, lighter blue)
                Positioned(
                  right: 10,
                  bottom: 8,
                  child: Text(
                    "P",
                    style: TextStyle(
                      color: const Color(0xFF009CDE),
                      fontWeight: FontWeight.w900,
                      fontSize: 20,
                      height: 1,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );

      default:
        return Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(Icons.payment, color: Colors.grey),
        );
    }
  }
}