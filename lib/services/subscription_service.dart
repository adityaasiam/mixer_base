import 'package:flutter/material.dart';

class SubscriptionProduct {
  final String id;
  final String title;
  final String price;

  SubscriptionProduct({
    required this.id,
    required this.title,
    required this.price,
  });
}

class SubscriptionService extends ChangeNotifier {
  bool _isVip = false;
  
  bool get isVip => _isVip;
  
  List<SubscriptionProduct> get products => [
    SubscriptionProduct(
      id: 'mixer',
      title: 'Mixer',
      price: '\$1.99/month',
    ),
    SubscriptionProduct(
      id: 'mixer_vip',
      title: 'Mixer VIP',
      price: '\$4.99/month',
    ),
  ];

  void buyVipSubscription(SubscriptionProduct product) {
    print('Subscribing to ${product.title} - ${product.price}');
    // In a real app, this would handle the actual subscription purchase
    _isVip = true;
    notifyListeners();
  }

  void restorePurchases() {
    print('Restoring purchases...');
    // In a real app, this would restore previous purchases
  }

  void setVipStatus(bool status) {
    _isVip = status;
    notifyListeners();
  }
}

