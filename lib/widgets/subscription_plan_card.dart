import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/subscription_service.dart';

class SubscriptionPlanCard extends StatelessWidget {
  final SubscriptionProduct product;

  const SubscriptionPlanCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                product.price,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF7B1FA2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              minimumSize: const Size(120, 50),
            ),
            onPressed: () {
              if (product.id == 'mixer') {
                print('Mixer subscribed');
              } else {
                // Get SubscriptionService from context
                final subscriptionService = Provider.of<SubscriptionService>(context, listen: false);
                subscriptionService.buyVipSubscription(product);
              }
            },
            child: const Text(
              'Subscribe',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
