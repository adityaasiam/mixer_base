// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'dart:math' as math;  // Added for cos, sin, pi

class MixerSpiralPainter extends CustomPainter {
  final bool isSelected;

  MixerSpiralPainter(this.isSelected);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 4;  // Inner radius
    final paint = Paint()
      ..color = isSelected ? const Color(0xFF7B1FA2) : Colors.grey
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    // Draw spiral path (approximating pixel art spiral)
    final path = Path();
    double angle = 0;
    double r = 2;
    for (int i = 0; i < 360 * 3; i += 5) {  // 3 full turns
      final x = center.dx + r * math.cos(angle);
      final y = center.dy + r * math.sin(angle);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
      angle += 5 * math.pi / 180;
      r += 0.5;  // Archimedean spiral growth
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class ProfileSilhouettePainter extends CustomPainter {
  final bool isSelected;

  ProfileSilhouettePainter(this.isSelected);

  @override
  void paint(Canvas canvas, Size size) {
    final outerPaint = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final innerPaint = Paint()
      ..color = isSelected ? const Color(0xFF7B1FA2) : Colors.grey
      ..style = PaintingStyle.fill;

    // Draw octagon frame (pixel art style)
    final octagonPath = Path();
    final octagonVertices = [
      Offset(8, 0), Offset(42, 0), Offset(50, 8), Offset(50, 42),
      Offset(42, 50), Offset(8, 50), Offset(0, 42), Offset(0, 8),
    ];
    octagonPath.addPolygon(octagonVertices.map((v) => v + const Offset(0, 0)).toList(), true);
    canvas.drawPath(octagonPath, outerPaint);

    // Draw person silhouette inside (simple head + body)
    final head = Path()..addOval(Rect.fromCircle(center: Offset(25, 15), radius: 8));
    canvas.drawPath(head, innerPaint);

    final body = Path()
      ..moveTo(25, 23)
      ..lineTo(25, 40)
      ..lineTo(18, 45)
      ..lineTo(32, 45)
      ..close();
    canvas.drawPath(body, innerPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}