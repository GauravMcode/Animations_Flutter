import 'package:flutter/material.dart';
import 'dart:math' show pi;
import 'dart:ui';

Path pathOfCircle(Size size) {
  final path = Path();
  path.moveTo(size.width / 2, 0);
  path.arcToPoint(
    Offset(size.width / 2, size.height),
    radius: Radius.circular(size.width / 2),
    clockwise: true,
  );
  path.arcToPoint(
    Offset(size.width / 2, 0),
    radius: Radius.circular(size.width / 2),
    clockwise: true,
  );
  return path;
}

Path pathOfSymbol(Size size) {
  final path = Path();
  path.moveTo(size.width / 3, size.height / 4);
  path.lineTo(2 * size.width / 3, size.height / 4);

  return path;
}

class CircleCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) => pathOfCircle(size);

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

class SymbolCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint ruppe = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.yellowAccent
      ..strokeCap = StrokeCap.square
      ..strokeWidth = 20;

    Rect rect = Rect.fromCenter(center: Offset(size.width * 0.4, size.height * 0.35), width: size.width * 0.3, height: size.height * 0.3);

    // canvas.drawCircle(Offset(2 * size.width / 3, size.height / 4), 10, ruppe);
    canvas.drawPoints(PointMode.lines, [Offset(size.width / 3, size.height / 4), Offset(2 * size.width / 3, size.height / 4)], ruppe);
    canvas.drawPoints(PointMode.lines, [Offset(size.width / 3, size.height * 0.36), Offset(2 * size.width / 3, size.height * 0.36)], ruppe);
    canvas.drawArc(rect, 1.85 * pi, pi * 0.80, false, ruppe);
    canvas.drawPoints(PointMode.lines, [Offset(size.width / 3, size.height / 2), Offset(size.width * 0.6, size.height * 0.8)], ruppe);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
