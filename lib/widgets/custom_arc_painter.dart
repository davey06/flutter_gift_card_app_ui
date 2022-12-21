import 'dart:math' as math;

import 'package:flutter/material.dart';

class CustomArcLines extends StatelessWidget {
  final double screenWidth;
  final int arcCount;
  const CustomArcLines(
      {required this.screenWidth, this.arcCount = 20, Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final diameter = screenWidth / arcCount;

    return SizedBox(
      width: screenWidth,
      child: Row(
        children: List.generate(
            arcCount.floor(),
            (_) => CustomArc(
                  diameter: diameter,
                )),
      ),
    );
  }
}

class CustomArc extends StatelessWidget {
  final double diameter;
  const CustomArc({this.diameter = 20, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ArcPainter(),
      size: Size(diameter, diameter),
    );
  }
}

class ArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.white;
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.height / 2, size.width / 2),
        height: size.height,
        width: size.width,
      ),
      math.pi,
      math.pi,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
