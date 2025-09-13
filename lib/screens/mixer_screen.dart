import 'package:flutter/material.dart';

class MixerScreen extends StatefulWidget {
  const MixerScreen({super.key});

  @override
  State<MixerScreen> createState() => _MixerScreenState();
}

class _MixerScreenState extends State<MixerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // top icons
          Padding(
            padding: const EdgeInsets.only(top: 60, left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Icon(Icons.auto_awesome, color: Color(0xFF7B1FA2), size: 24),
                SizedBox(width: 16),
                Icon(Icons.notifications_outlined, color: Color(0xFF7B1FA2), size: 24),
                SizedBox(width: 16),
              ],
            ),
          ),

          const SizedBox(height: 16),

          // filter row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF7B1FA2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.tune, color: Colors.white, size: 16),
                      SizedBox(width: 8),
                      Text(
                        'Filters',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Row(
                    children: [
                      _buildDropdownButton('Age ▼'),
                      const SizedBox(width: 8),
                      _buildDropdownButton('Height ▼'),
                      const SizedBox(width: 8),
                      _buildDropdownButton('Habits ▼'),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // centered content
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildAvatar('assets/profile_photos/Avatar (1).png', Colors.pink),
                        const SizedBox(width: 24),
                        _buildAvatar('assets/profile_photos/Avatar (2).png', Color(0xFF7B1FA2)),
                        const SizedBox(width: 24),
                        _buildAvatar('assets/profile_photos/Avatar (3).png', Colors.orange),
                      ],
                    ),
                    const SizedBox(height: 32),
                    const Text(
                      'You\'ve seen them all',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 32),
                      child: Text(
                        'No more profiles match your filters. Update your preferences to find more people.',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 32),
                    SizedBox(
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
                        child: const Text(
                          'Adjust Location',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildDropdownButton(String text) {
    return Flexible(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.grey, fontSize: 12),
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  static Widget _buildAvatar(String imagePath, Color borderColor) {
    return ClipOval(
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: borderColor,
          border: Border.all(color: borderColor, width: 2),
        ),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            debugPrint('Error loading: $imagePath');
            return Container(
              color: Colors.grey.shade200,
              child: Icon(Icons.person, color: Colors.grey.shade400, size: 40),
            );
          },
        ),
      ),
    );
  }
}
