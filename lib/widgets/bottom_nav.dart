import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(0, 'Mixer'),
              _buildNavItem(1, 'Your Mix'),
              _buildNavItem(2, 'Event'),
              _buildNavItem(3, 'Blind Mix'),
              _buildNavItem(4, 'Profile'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, String label) {
    final isSelected = currentIndex == index;
    final color = isSelected ? const Color(0xFF7B1FA2) : Colors.grey;

    return GestureDetector(
      onTap: () => onTap(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 24,
              height: 24,
              child: _buildCustomAsset(index, isSelected, color, label),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                color: color,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomAsset(int index, bool isSelected, Color color, String label) {
    print('Rendering asset for $index');
    
    String assetPath;
    switch (index) {
      case 0: // Mixer
        assetPath = 'assets/icons/mixer.png';
        break;
      case 1: // Your Mix
        assetPath = 'assets/icons/your_mix.png';
        break;
      case 2: // Event
        assetPath = 'assets/icons/event.png';
        break;
      case 3: // Blind Mix
        assetPath = 'assets/icons/Blind-Mix.png';
        break;
      case 4: // Profile
        assetPath = 'assets/icons/Profile.png';
        break;
      default:
        throw Exception('Invalid navigation index: $index');
    }

    return ClipOval(
      child: Image.asset(
        assetPath,
        width: 24,
        height: 24,
        color: color,
        colorBlendMode: BlendMode.srcIn,
        errorBuilder: (context, error, stackTrace) {
          print('ERROR: Failed to load asset $assetPath: $error');
          return Icon(
            Icons.error,
            color: Colors.red,
            size: 24,
          );
        },
      ),
    );
  }
}