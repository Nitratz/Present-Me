import 'dart:math';

import 'package:flutter/material.dart';

const NAME = "Maxime LIEGE";
const PICTURE_URL = "https://media.licdn.com/dms/image/C5603AQGe8X6ZomNg6Q/profile-displayphoto-shrink_200_200/0?e=1559779200&v=beta&t=mV6zLjzz2vCKN9f5Ja94Ve5hxwoC5QBuhpXVIc9S1kg";
const TITLE = "Mobile Developer";
const HEADLINE = "Mostly Android Developer";
const RESUME = "Mainly developing on Android but focusing more and more on emergent technologies (like Flutter) but I keep believing in native languages ! (Long live to Kotlin)";
const LINKEDIN_PROFILE = "https://www.linkedin.com/in/maxime-liege-568817a7/";
const GITHUB_PROFILE = "https://github.com/Nitratz";
const EXPERIENCES_URL = "https://us-central1-present-me-a7b9b.cloudfunctions.net/getExperiences";

const LIGHT_BLUE = Color.fromARGB(220, 137, 247, 254);
const DARK_BLUE = Color.fromARGB(120, 102, 166, 255);

const HERO_PROFILE_PIC = "profile_pic";

class CircleClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: min(size.width, size.height) / 2);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}

class DrawLine extends CustomPainter {
  Paint _paint;
  double start;
  double end;

  DrawLine({this.start = -180.0, this.end = 180.0}) {
    _paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 1
      ..strokeCap = StrokeCap.round;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(Offset(start, 0.0), Offset(end, 0.0), _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
