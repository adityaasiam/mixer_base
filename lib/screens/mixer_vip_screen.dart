import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/top_bar.dart';
import '../widgets/plan_card.dart';
import '../services/subscription_service.dart';

class MixerVipScreen extends StatefulWidget {
  const MixerVipScreen({super.key});

  @override
  State<MixerVipScreen> createState() => _MixerVipScreenState();
}

class _MixerVipScreenState extends State<MixerVipScreen> {
  bool isVipSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFF8E1F5),
              Colors.white,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const TopBar(
                title: 'Mixer',
                showCloseButton: true,
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      const Text(
                        'Level Up Your Mixer Experience',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Select a plan',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          PlanCard(
                            title: 'Mixer',
                            price: '\$24.99',
                            description: 'All of the below',
                            icon: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [Colors.pink, Colors.purple, Colors.blue],
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.favorite,
                                color: Colors.white,
                                size: 15,
                              ),
                            ),
                            isSelected: !isVipSelected,
                            onTap: () => setState(() => isVipSelected = false),
                          ),
                          PlanCard(
                            title: 'Mixer VIP',
                            price: '\$99.99',
                            description: 'Mixer + VIP seating, food & beverages',
                            icon: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: const Color(0xFFF1C40F),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.psychology,
                                color: Colors.white,
                                size: 16,
                              ),
                            ),
                            isSelected: isVipSelected,
                            onTap: () => setState(() => isVipSelected = true),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
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
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: const Color(0xFFF8E1F5),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Text(
                                'Included with Mixer VIP',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            _buildFeatureItem('Unlimited Likes'),
                            _buildFeatureItem('See who liked you'),
                            _buildFeatureItem('Find people with wide range'),
                            _buildFeatureItem('Access to events'),
                            _buildFeatureItem('VIP seating, food & beverages'),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),
                      Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xFF7B1FA2),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            final subscriptionService = Provider.of<SubscriptionService>(context, listen: false);
                            final selectedProduct = isVipSelected 
                                ? subscriptionService.products[1] // Mixer VIP
                                : subscriptionService.products[0]; // Mixer
                            subscriptionService.buyVipSubscription(selectedProduct);
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.favorite,
                                color: Colors.white,
                                size: 20,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Continue - \$${isVipSelected ? '99.99' : '24.99'} total',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'By continuing, you agree to be charged, with auto-renewal until canceled in App Store settings, under Mixer\'s Terms.',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: const BoxDecoration(
              color: Color(0xFF7B1FA2),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.check,
              color: Colors.white,
              size: 12,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

