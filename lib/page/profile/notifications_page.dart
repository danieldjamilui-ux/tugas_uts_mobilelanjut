import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  bool allowNotifications = true;
  bool emailNotifications = false;
  bool orderNotifications = false;
  bool generalNotifications = true;

  @override
  Widget build(BuildContext context) {
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
          "Notifications",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _buildNotificationCard(
                  title: "Allow Notifications",
                  description: "Lorem ipsum dolor sit amet, consectetur sadipscing elitr, sed diam nonumyn",
                  value: allowNotifications,
                  onChanged: (val) {
                    setState(() {
                      allowNotifications = val;
                    });
                  },
                ),
                const SizedBox(height: 16),
                _buildNotificationCard(
                  title: "Email Notifications",
                  description: "Lorem ipsum dolor sit amet, consectetur sadipscing elitr, sed diam nonumyn",
                  value: emailNotifications,
                  onChanged: (val) {
                    setState(() {
                      emailNotifications = val;
                    });
                  },
                ),
                const SizedBox(height: 16),
                _buildNotificationCard(
                  title: "Order Notifications",
                  description: "Lorem ipsum dolor sit amet, consectetur sadipscing elitr, sed diam nonumyn",
                  value: orderNotifications,
                  onChanged: (val) {
                    setState(() {
                      orderNotifications = val;
                    });
                  },
                ),
                const SizedBox(height: 16),
                _buildNotificationCard(
                  title: "General Notifications",
                  description: "Lorem ipsum dolor sit amet, consectetur sadipscing elitr, sed diam nonumyn",
                  value: generalNotifications,
                  onChanged: (val) {
                    setState(() {
                      generalNotifications = val;
                    });
                  },
                ),
              ],
            ),
          ),
          // Bottom Button
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  // Handle save settings
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Settings saved successfully!'),
                      backgroundColor: Color.fromARGB(255, 41, 109, 234),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 146, 255, 30),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Save settings",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationCard({
    required String title,
    required String description,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
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
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade600,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Transform.scale(
            scale: 0.85,
            child: Switch(
              value: value,
              onChanged: onChanged,
              activeThumbColor: const Color.fromARGB(255, 146, 255, 30),
              activeTrackColor: const Color.fromARGB(255, 146, 255, 30).withValues(alpha: 0.5),
              inactiveThumbColor: Colors.grey.shade400,
              inactiveTrackColor: Colors.grey.shade300,
            ),
          ),
        ],
      ),
    );
  }
}