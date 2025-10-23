import 'package:flutter/material.dart';
import 'order_success_page.dart'; // Pastikan file ini ada

class PaymentMethodPage extends StatefulWidget {
  const PaymentMethodPage({super.key});

  @override
  State<PaymentMethodPage> createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends State<PaymentMethodPage> {
  String selectedMethod = "Credit Card";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back, color: Colors.black)),
        title: const Text('Payment Method', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Step Bar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                _StepIndicator(step: "DELIVERY", isActive: true),
                _StepIndicator(step: "ADDRESS", isActive: true),
                _StepIndicator(step: "PAYMENT", isActive: true),
              ],
            ),
            const SizedBox(height: 25),

            // Payment Options
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _paymentOption("Paypal", Icons.payment, "Paypal"),
                _paymentOption("Credit Card", Icons.credit_card, "Credit Card"),
                _paymentOption("Apple Pay", Icons.phone_iphone, "Apple Pay"),
              ],
            ),
            const SizedBox(height: 25),

            // Updated Card Preview
            _buildStyledCard(),
            const SizedBox(height: 20),

            // Form Dummy
            _formField(Icons.person, "Name on the card"),
            _formField(Icons.credit_card, "Card number"),
            Row(
              children: [
                Expanded(child: _formField(Icons.calendar_month, "Month / Year")),
                const SizedBox(width: 10),
                Expanded(child: _formField(Icons.lock, "CVV")),
              ],
            ),
            const SizedBox(height: 10),

            // Save Switch
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Save this card"),
                Switch(value: true, onChanged: (value) {}),
              ],
            ),

            const Spacer(),

            // Make a Payment Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const OrderSuccessPage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text("Make a payment",
                    style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Card builder (SESUAI GAMBAR)
  Widget _buildStyledCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFa4e75b), Color(0xFF5fcf53)],
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Positioned(
            right: -10,
            top: -10,
            child: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            right: 20,
            bottom: -5,
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            child: Row(
              children: [
                Container(
                  height: 25,
                  width: 25,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.orange,
                  ),
                ),
                const SizedBox(width: 5),
                Container(
                  height: 25,
                  width: 25,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SizedBox(height: 25),
              Text(
                "XXXX  XXXX  XXXX  8790",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("CARD HOLDER\nDaniel Paulus",
                      style: TextStyle(color: Colors.white, fontSize: 12)),
                  Text("EXPIRES\n01 / 22",
                      style: TextStyle(color: Colors.white, fontSize: 12)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _paymentOption(String label, IconData icon, String value) {
    return GestureDetector(
      onTap: () => setState(() => selectedMethod = value),
      child: Container(
        width: 90,
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          border: Border.all(
            color: selectedMethod == value ? Colors.green : Colors.grey.shade300,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Icon(icon,
                color: selectedMethod == value ? Colors.green : Colors.grey),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                color: selectedMethod == value ? Colors.green : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _formField(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey),
          const SizedBox(width: 10),
          Text(label, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}

class _StepIndicator extends StatelessWidget {
  final String step;
  final bool isActive;

  const _StepIndicator({required this.step, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(Icons.check_circle,
            color: isActive ? Colors.green : Colors.grey),
        Text(step,
            style: TextStyle(
                fontSize: 12,
                color: isActive ? Colors.green : Colors.grey)),
      ],
    );
  }
}
