import 'package:flutter/material.dart';
import 'dart:math';

/// 底部弧度Cliper
class BottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height - 50);

    var p1 = Offset(size.width / 2, size.height);
    var p2 = Offset(size.width, size.height - 50);
    path.quadraticBezierTo(p1.dx, p1.dy, p2.dx, p2.dy);
    path.lineTo(size.width, size.height - 50);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}

/// 五角星Cliper
class StarCliper extends CustomClipper<Path>{

  /// 五角星半径
  final double radius;

  StarCliper({@required this.radius});

  /// 角度转弧度公式
  double degree2Radian(int degree) {
    return (pi * degree / 180);
  }

  @override
  Path getClip(Size size) {
    double radius = this.radius;
    Path path = new Path();
    double radian = degree2Radian(36);// 36为五角星的角度
    double radius_in = (radius * sin(radian / 2) / cos(radian)); // 中间五边形的半径

    path.moveTo((radius * cos(radian / 2)), 0.0);// 此点为多边形的起点
    path.lineTo((radius * cos(radian / 2) + radius_in
        * sin(radian)),
        (radius - radius * sin(radian / 2)));
    path.lineTo((radius * cos(radian / 2) * 2),
        (radius - radius * sin(radian / 2)));
    path.lineTo((radius * cos(radian / 2) + radius_in
        * cos(radian / 2)),
        (radius + radius_in * sin(radian / 2)));
    path.lineTo(
        (radius * cos(radian / 2) + radius
            * sin(radian)), (radius + radius
        * cos(radian)));
    path.lineTo((radius * cos(radian / 2)),
        (radius + radius_in));
    path.lineTo(
        (radius * cos(radian / 2) - radius
            * sin(radian)), (radius + radius
        * cos(radian)));
    path.lineTo((radius * cos(radian / 2) - radius_in
        * cos(radian / 2)),
        (radius + radius_in * sin(radian / 2)));
    path.lineTo(0.0, (radius - radius * sin(radian / 2)));
    path.lineTo((radius * cos(radian / 2) - radius_in
        * sin(radian)),
        (radius - radius * sin(radian / 2)));

    path.close();// 使这些点构成封闭的多边形

    return path;
  }

  @override
  bool shouldReclip(StarCliper oldClipper) {
    return this.radius != oldClipper.radius;
  }

}