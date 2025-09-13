import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedPhoto = -1;
  final List<String> _photoPaths = [
    'assets/profile_photos/Avatar (1).png',
    'assets/profile_photos/Avatar (2).png',
    'assets/profile_photos/Avatar (3).png',
    'assets/profile_photos/Avatar (1).png',
    'assets/profile_photos/Avatar (2).png',
    'assets/profile_photos/Avatar (3).png',
  ];
  
  final List<Color> _borderColors = [
    Colors.orange,
    Colors.pink,
    Colors.purple,
    Colors.orange,
    Colors.pink,
    Colors.purple,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 60, left: 16, right: 16, bottom: 80),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'My Profile',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    print('Edit profile pressed');
                  },
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
            // Photo Grid Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Profile Photos',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16),
                  GridView.count(
                    crossAxisCount: 3,
                    childAspectRatio: 1,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: List.generate(6, (index) {
                      return _buildPhotoSlot(index);
                    }),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Action Buttons Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  _buildActionButton(
                    'Edit Profile',
                    const Color(0xFF7B1FA2),
                    () {
                      print('Edit Profile pressed');
                    },
                  ),
                  const SizedBox(height: 12),
                  _buildActionButton(
                    'Settings',
                    const Color(0xFF7B1FA2),
                    () {
                      print('Settings pressed');
                    },
                  ),
                  const SizedBox(height: 12),
                  _buildActionButton(
                    'Logout',
                    Colors.red,
                    () {
                      _showLogoutDialog(context);
                    },
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPhotoSlot(int index) {
    final isSelected = _selectedPhoto == index;
    final borderColor = _borderColors[index];
    
    print('Loading avatar(${index % 3 + 1}): ${_photoPaths[index]}');
    
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPhoto = isSelected ? -1 : index;
        });
        print('Photo $index tapped, selected: ${_selectedPhoto == index}');
      },
      child: ClipOval(
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: borderColor,
            border: Border.all(
              color: isSelected ? const Color(0xFF7B1FA2) : Colors.grey,
              width: isSelected ? 3 : 2,
            ),
          ),
          child: Image.asset(
            _photoPaths[index],
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              print('Loading asset: ${_photoPaths[index]}');
              print('Error loading avatar(${index % 3 + 1}): ${_photoPaths[index]} - $error');
              return _buildPlaceholder(index);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildPlaceholder(int index) {
    return Container(
      color: Colors.grey.shade100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.camera_alt,
            size: 32,
            color: Colors.grey.shade400,
          ),
          const SizedBox(height: 8),
          Text(
            'Add Photo ${index + 1}',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade500,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(String text, Color color, VoidCallback onPressed) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          elevation: 2,
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure you want to logout?'),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                print('User logged out');
                // Add actual logout logic here
              },
              child: const Text(
                'Logout',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }
}
