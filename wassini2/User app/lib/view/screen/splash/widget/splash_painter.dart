import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_sixvalley_ecommerce/utill/color_resources.dart';
import 'dart:math' as Math;

class SplashPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = ColorResources.YELLOAC.withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 50.0;
    num degToRad(num deg) => deg * (Math.pi / 180.0);
    var path = Path();

    path.moveTo(0, size.height * 0.7);

    path.quadraticBezierTo(
        size.width * 0.5, size.height, size.width, size.height * 0.5);
    path.addArc(Rect.fromLTWH(0, size.height * 0.1, size.width, size.height),
        degToRad(180), degToRad(90));
    path.arcTo(
        Rect.fromLTWH(size.width * 0.3, size.height * 0.1, size.width * 0.3,
            size.height * 0.1),
        degToRad(-90),
        degToRad(180),
        true);
    path.lineTo(size.width * 0.2, size.height * 0.23);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class HomeOnePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.lightBlueAccent
      ..style = PaintingStyle.stroke
      ..strokeWidth = 200.0;
    num degToRad(num deg) => deg * (Math.pi / 180.0);
    var path = Path();

    // path.moveTo(0, size.height * 0.7);

    // path.quadraticBezierTo(
    //     size.width * 0.5, size.height, size.width, size.height * 0.5);
    // path.addArc(Rect.fromLTWH(0, size.height * 0.1, size.width, size.height),
    //     degToRad(180), degToRad(90));
    path.arcTo(
        Rect.fromLTWH(size.width * 0.0, size.height * 0.1, size.width * 0.1,
            size.height * 0.3),
        degToRad(-90),
        degToRad(180),
        true);
    // path.lineTo(size.width * 0.2, size.height * 0.23);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
