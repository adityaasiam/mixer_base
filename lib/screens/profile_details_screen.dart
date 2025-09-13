// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileDetailsScreen extends StatefulWidget {
  const ProfileDetailsScreen({super.key});

  @override
  State<ProfileDetailsScreen> createState() => _ProfileDetailsScreenState();
}

class _ProfileDetailsScreenState extends State<ProfileDetailsScreen> {
  int _selectedPhoto = -1;
  final List<String> _photoPaths = [
    'assets/profile_photos/photo1.jpg',
    'assets/profile_photos/photo2.jpg',
    'assets/profile_photos/photo3.jpg',
    'assets/profile_photos/photo4.jpg',
    'assets/profile_photos/photo5.jpg',
    'assets/profile_photos/photo6.jpg',
  ];

  final List<ProfileDetailItem> _profileDetails = [
    ProfileDetailItem(
      icon: Icons.person_outline,
      title: 'About me (Bio)',
    ),
    ProfileDetailItem(
      icon: Icons.favorite_border,
      title: 'What are you looking for?',
    ),
    ProfileDetailItem(
      icon: Icons.female,
      title: 'Gender',
    ),
    ProfileDetailItem(
      icon: Icons.cake_outlined,
      title: 'Birthday (Age)',
    ),
    ProfileDetailItem(
      icon: Icons.straighten,
      title: 'Height',
    ),
    ProfileDetailItem(
      icon: Icons.chat_bubble_outline,
      title: 'Interested in?',
    ),
    ProfileDetailItem(
      icon: Icons.female,
      title: 'Sexuality',
    ),
    ProfileDetailItem(
      icon: Icons.link,
      title: 'Relationship',
    ),
    ProfileDetailItem(
      icon: Icons.public,
      title: 'Ethnicity',
    ),
    ProfileDetailItem(
      icon: Icons.sentiment_satisfied_outlined,
      title: 'Kids',
    ),
    ProfileDetailItem(
      icon: Icons.local_drink_outlined,
      title: 'Drinking',
    ),
    ProfileDetailItem(
      icon: Icons.smoking_rooms,
      title: 'Smoking',
    ),
    ProfileDetailItem(
      icon: Icons.eco,
      title: 'Marijuana',
    ),
    ProfileDetailItem(
      icon: Icons.temple_buddhist,
      title: 'Religious Beliefs',
    ),
    ProfileDetailItem(
      icon: Icons.flag_outlined,
      title: 'Political Views',
    ),
    ProfileDetailItem(
      icon: Icons.star_outline,
      title: 'Interest and Hobbies',
    ),
    ProfileDetailItem(
      icon: Icons.diamond_outlined,
      title: 'Values & Lifestyle',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 60, left: 16, right: 16, bottom: 80),
        child: Column(
          children: [
            const Text(
              'Your details',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
            // Photo Grid Section
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
              crossAxisCount: 2,
              childAspectRatio: 1,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(6, (index) {
                return _buildPhotoSlot(index);
              }),
            ),
            
            const SizedBox(height: 24),
            
            // Profile Details List
            ...List.generate(_profileDetails.length, (index) {
              final item = _profileDetails[index];
              return Column(
                children: [
                  _buildDetailItem(item),
                  if (index < _profileDetails.length - 1)
                    const SizedBox(height: 12),
                ],
              );
            }),
            
            const SizedBox(height: 24),
            
            // Discover your Perfect Match Card
            _buildPerfectMatchCard(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailItem(ProfileDetailItem item) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
            leading: Icon(
              item.icon,
              color: Colors.grey.shade700,
              size: 24,
            ),
            title: Text(
              item.title,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
            trailing: Icon(
              Icons.chevron_right,
              color: Colors.grey.shade400,
              size: 20,
            ),
            onTap: () {
              ('Tapped ${item.title}');
              // Navigate to edit screen or show modal
            },
          ),
          Divider(
            height: 1,
            thickness: 1,
            color: Colors.grey.shade200,
          ),
        ],
      ),
    );
  }

  Widget _buildPerfectMatchCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF3E5F5), // Light purple background
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.purple.shade100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            'Discover your Perfect Match',
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF7B1FA2),
            ),
          ),
          
          const SizedBox(height: 16),
          
          // User Avatars Row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildAvatar(Colors.pink.shade200, Icons.person, 'User 1'),
              const SizedBox(width: 12),
              _buildAvatar(Colors.cyan.shade200, Icons.person, 'User 2'),
              const SizedBox(width: 12),
              _buildAvatar(Colors.yellow.shade200, Icons.person, 'User 3'),
            ],
          ),
          
          const SizedBox(height: 16),
          
          // Take the quiz again button
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: () {
                print('Take the quiz again pressed');
                // Navigate to quiz screen
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF7B1FA2),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                elevation: 0,
              ),
              child: Text(
                'Take the quiz again',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAvatar(Color backgroundColor, IconData icon, String name) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: backgroundColor,
      child: Icon(
        icon,
        color: Colors.grey.shade600,
        size: 24,
      ),
    );
  }

  Widget _buildPhotoSlot(int index) {
    final isSelected = _selectedPhoto == index;
    final hasPhoto = _photoExists(_photoPaths[index]);
    
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPhoto = isSelected ? -1 : index;
        });
        print('Photo $index tapped, selected: ${_selectedPhoto == index}');
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? const Color(0xFF7B1FA2) : Colors.grey.shade300,
            width: isSelected ? 3 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: hasPhoto
              ? Image.asset(
                  _photoPaths[index],
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return _buildPlaceholder(index);
                  },
                )
              : _buildPlaceholder(index),
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

  bool _photoExists(String path) {
    // In a real app, you would check if the asset exists
    // For now, we'll simulate by checking if it's a valid path
    return path.isNotEmpty;
  }
}

class ProfileDetailItem {
  final IconData icon;
  final String title;

  ProfileDetailItem({
    required this.icon,
    required this.title,
  });
}
