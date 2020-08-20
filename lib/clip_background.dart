import 'package:flutter/material.dart';

class ClipBackground extends CustomClipper<Path>{
  var radius=10.0;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height-60);
    path.quadraticBezierTo(
        size.width / 2, size.height - 100, size.width, size.height-60);
    path.lineTo(size.width, 0);

    return path;


  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}