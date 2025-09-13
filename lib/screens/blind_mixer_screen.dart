// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import '../widgets/top_bar.dart';

class BlindMixerScreen extends StatefulWidget {
  const BlindMixerScreen({super.key});

  @override
  State<BlindMixerScreen> createState() => _BlindMixerScreenState();
}

class _BlindMixerScreenState extends State<BlindMixerScreen> {
  bool _isApplied = false;

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
                title: 'Blind Mixer',
                rightActions: [
                  Icon(
                    Icons.auto_awesome,
                    color: Color(0xFF7B1FA2),
                    size: 24,
                  ),
                  SizedBox(width: 16),
                  Icon(
                    Icons.notifications_outlined,
                    color: Colors.black,
                    size: 24,
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      _buildBlindDateIllustration(),
                      const SizedBox(height: 32),
                      const Text(
                        'Upcoming Blind Date',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF7B1FA2),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Let Mixer surprise you with a match.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      _buildCalendarContainer(),
                      const SizedBox(height: 24),
                      _buildNavigationTabs(),
                      const SizedBox(height: 32),
                      if (!_isApplied) _buildSignUpButton(),
                      if (_isApplied) _buildAppliedStatus(),
                      const SizedBox(height: 20),
                      _buildToggleSection(),
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

  Widget _buildBlindDateIllustration() {
    final screenHeight = MediaQuery.of(context).size.height;
    final imageHeight = screenHeight < 600 ? 250.0 : 300.0;
    
    return SizedBox(
      height: imageHeight,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            Image.asset(
              'assets/images/blind_date_scene.png',
              width: double.infinity,
              height: imageHeight,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                // Fallback to a placeholder if image is not found
                return Container(
                  width: double.infinity,
                  height: imageHeight,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.image_not_supported,
                        size: 48,
                        color: Colors.grey.shade400,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Blind Date Scene',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Add blind_date_scene.png to assets/images/',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade500,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
            // Subtle purple overlay to blend with gradient
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF7B1FA2).withOpacity(0.05),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCalendarContainer() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFF7B1FA2), width: 1),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.calendar_today,
            color: Color(0xFF7B1FA2),
            size: 20,
          ),
          const SizedBox(width: 8),
          const Text(
            'September 28 - 10 PM',
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF7B1FA2),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationTabs() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildTab('Sign Up', false),
        const SizedBox(width: 16),
        _buildTab('Smart Match', false),
        const SizedBox(width: 16),
        _buildTab('Blind Date', true),
      ],
    );
  }

  Widget _buildTab(String text, bool isActive) {
    return Column(
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 14,
            color: isActive ? const Color(0xFF7B1FA2) : Colors.grey,
            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        if (isActive)
          Container(
            margin: const EdgeInsets.only(top: 4),
            height: 2,
            width: 40,
            decoration: const BoxDecoration(
              color: Color(0xFF7B1FA2),
              borderRadius: BorderRadius.all(Radius.circular(1)),
            ),
          ),
      ],
    );
  }

  Widget _buildSignUpButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF7B1FA2),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          elevation: 0,
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.description,
              color: Colors.white,
              size: 20,
            ),
            SizedBox(width: 8),
            Text(
              'Fill out the Form',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppliedStatus() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFF7B1FA2), width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
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
          const Text(
            'Applied for Blind Mixer',
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF7B1FA2),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildToggleSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Toggle Variant: ',
          style: TextStyle(
            fontSize: 14,
            color: Colors.black,
          ),
        ),
        Switch(
          value: _isApplied,
          onChanged: (value) {
            setState(() {
              _isApplied = value;
            });
          },
          activeColor: const Color(0xFF7B1FA2),
        ),
        const Text(
          'Applied',
          style: TextStyle(
            fontSize: 14,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}