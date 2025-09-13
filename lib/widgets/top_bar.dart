import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  final String title;
  final List<Widget>? rightActions;
  final bool showCloseButton;

  const TopBar({
    super.key,
    required this.title,
    this.rightActions,
    this.showCloseButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Row(
            children: [
              if (rightActions != null) ...rightActions!,
              if (showCloseButton)
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.close,
                    color: Color(0xFF7B1FA2),
                    size: 24,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

