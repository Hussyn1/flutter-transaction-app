import 'package:flutter/material.dart';

class TransactionTile extends StatelessWidget {
  final String logoAssetPath;
  final String name;
  final String time;
  final String amountPaid;
  final String amountSaved;

  const TransactionTile({
    super.key,
    required this.logoAssetPath,
    required this.name,
    required this.time,
    required this.amountPaid,
    required this.amountSaved,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Logo in circular container
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.grey.shade200,
            backgroundImage: AssetImage(logoAssetPath),
          ),
          const SizedBox(width: 16),

          // Name and time
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  time,
                  style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
                ),
              ],
            ),
          ),

          // Amounts
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "-$amountPaid",
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.redAccent,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                "+$amountSaved",
                style: const TextStyle(fontSize: 13, color: Colors.green),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
