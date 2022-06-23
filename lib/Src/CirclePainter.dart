import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';

class CirclePainter extends CustomPainter{
  final Color color;
  final double progress;
  final double angle;
  final double sweepAngle;
  final Offset center;

  CirclePainter({
   Key? key,
   required this.color,
   required this.angle,
   required this.progress,
   required this.center,
   required this.sweepAngle
});

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    final paint = Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = size.height;
    var path = Path();
    double degToRad(double deg) => deg * (pi/180);
    path.arcTo(
      Rect.fromCenter(
        center: center,
        height: 140,
        width: 140
      ),
      degToRad(angle),
      degToRad(sweepAngle),
      false
    );

    PathMetrics pathMetric = path.computeMetrics();
    for(PathMetric pathMetric in pathMetric){
      Path extraPath = pathMetric.extractPath(
        0.0,
        pathMetric.length * progress,
      );
      canvas.drawPath(extraPath, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    //throw UnimplementedError();
    return false;
  }

}