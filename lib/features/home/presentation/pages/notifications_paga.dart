import 'package:flutter/material.dart';

class NotificationOrdersPage extends StatelessWidget {
  const NotificationOrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Notification"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            "Current",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),

          // Current Order
          _buildOrderItem(
            image: "assets/images/book1.png",
            title: "Carrie Fisher",
            status: "On the way",
            statusColor: Colors.blue,
            items: "1 items",
          ),
          const SizedBox(height: 20),

          const Text(
            "October 2021",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),

          // Past Orders
          _buildOrderItem(
            image: "assets/images/book2.png",
            title: "The Da vinci Code",
            status: "Delivered",
            statusColor: Colors.green,
            items: "1 items",
          ),
          _buildOrderItem(
            image: "assets/images/book3.png",
            title: "Carrie Fisher",
            status: "Delivered",
            statusColor: Colors.green,
            items: "5 items",
          ),
          _buildOrderItem(
            image: "assets/images/book4.png",
            title: "The Waiting",
            status: "Cancelled",
            statusColor: Colors.red,
            items: "2 items",
          ),
        ],
      ),
    );
  }

  Widget _buildOrderItem({
    required String image,
    required String title,
    required String status,
    required Color statusColor,
    required String items,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(image, width: 50, height: 50, fit: BoxFit.cover),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Row(
          children: [
            Text(
              status,
              style: TextStyle(color: statusColor, fontWeight: FontWeight.w500),
            ),
            const SizedBox(width: 6),
            const Text("•"),
            const SizedBox(width: 6),
            Text(items, style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
