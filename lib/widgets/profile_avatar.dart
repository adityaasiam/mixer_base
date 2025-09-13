import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final Color borderColor;
  final String? imageUrl;
  final double size;

  const ProfileAvatar({
    super.key,
    required this.borderColor,
    this.imageUrl,
    this.size = 60,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: borderColor, width: 3),
      ),
      child: CircleAvatar(
        radius: (size - 6) / 2,
        backgroundColor: Colors.grey.shade200,
        backgroundImage: imageUrl != null ? NetworkImage(imageUrl!) : null,
        child: imageUrl == null
            ? Icon(
                Icons.person,
                color: Colors.grey.shade400,
                size: size * 0.5,
              )
            : null,
      ),
    );
  }
}

