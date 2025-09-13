import 'package:flutter/material.dart';

class PlanCard extends StatelessWidget {
  final String title;
  final String price;
  final String description;
  final Widget icon;
  final bool isSelected;
  final VoidCallback onTap;

  const PlanCard({
    super.key,
    required this.title,
    required this.price,
    required this.description,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? const Color(0xFF7B1FA2) : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                icon,
              ],
            ),
            const SizedBox(height: 8),
            Text(
              price,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: title == 'Mixer VIP' ? const Color(0xFFF1C40F) : const Color(0xFF7B1FA2),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              description,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

