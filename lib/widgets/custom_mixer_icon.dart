import 'package:flutter/material.dart';
import 'dart:math' as math;

class CustomMixerIcon extends StatelessWidget {
  final double size;
  final Color color;
  final bool isSelected;

  const CustomMixerIcon({
    super.key,
    this.size = 24.0,
    this.color = Colors.grey,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: MixerIconPainter(
          color: isSelected ? const Color(0xFF7B1FA2) : color,
        ),
      ),
    );
  }
}

class MixerIconPainter extends CustomPainter {
  final Color color;

  MixerIconPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = color;

    final strokePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5
      ..color = color;

    final purplePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..color = const Color(0xFF7B1FA2);

    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width * 0.35;

    // Draw octagonal frame
    _drawOctagon(canvas, center, radius, strokePaint);

    // Draw person silhouette
    _drawPersonSilhouette(canvas, center, radius * 0.6, paint);

    // Draw purple spiral (always purple regardless of selection)
    _drawSpiral(canvas, center, radius * 0.4, purplePaint);
  }

  void _drawOctagon(Canvas canvas, Offset center, double radius, Paint paint) {
    final path = Path();
    final angle = 2 * 3.14159 / 8; // 45 degrees in radians

    for (int i = 0; i < 8; i++) {
      final x = center.dx + radius * cos(i * angle - 3.14159 / 8);
      final y = center.dy + radius * sin(i * angle - 3.14159 / 8);
      
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();

    canvas.drawPath(path, paint);
  }

  void _drawPersonSilhouette(Canvas canvas, Offset center, double radius, Paint paint) {
    // Draw head (circle)
    canvas.drawCircle(
      Offset(center.dx, center.dy - radius * 0.3),
      radius * 0.25,
      paint,
    );

    // Draw body (trapezoid-like shape)
    final bodyPath = Path();
    final bodyTop = center.dy - radius * 0.1;
    final bodyBottom = center.dy + radius * 0.4;
    final bodyWidth = radius * 0.4;

    bodyPath.moveTo(center.dx - bodyWidth * 0.6, bodyTop);
    bodyPath.lineTo(center.dx + bodyWidth * 0.6, bodyTop);
    bodyPath.lineTo(center.dx + bodyWidth * 0.8, bodyBottom);
    bodyPath.lineTo(center.dx - bodyWidth * 0.8, bodyBottom);
    bodyPath.close();

    canvas.drawPath(bodyPath, paint);
  }

  void _drawSpiral(Canvas canvas, Offset center, double radius, Paint paint) {
    final path = Path();
    final spiralCenter = Offset(
      center.dx + radius * 0.3,
      center.dy + radius * 0.3,
    );

    // Create a spiral using cubic bezier curves
    final numTurns = 2.5;
    final numPoints = 20;
    
    for (int i = 0; i < numPoints; i++) {
      final t = i / (numPoints - 1);
      final angle = t * numTurns * 2 * 3.14159;
      final spiralRadius = radius * 0.3 * (1 - t * 0.7); // Spiral inward
      
      final x = spiralCenter.dx + spiralRadius * cos(angle);
      final y = spiralCenter.dy + spiralRadius * sin(angle);
      
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate is MixerIconPainter && oldDelegate.color != color;
  }
}

// Helper functions for trigonometry
double cos(double angle) => math.cos(angle);
double sin(double angle) => math.sin(angle);
