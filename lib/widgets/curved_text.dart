import 'package:cooper/utils/app_colors.dart';
import 'package:cooper/utils/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CurvedLineAndTextPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.curve
      ..strokeWidth = Dimensions.width50
      ..style = PaintingStyle.stroke;

    final path = Path();
  
    path.moveTo(-40, size.height-60); //start path with this if you are making at bottom
      
      var firstStart = Offset(size.width / 8, size.height/7); //Offset(size.width / 5, size.height); 
      var firstEnd = Offset(size.width / 2.25, size.height - 150.0);
      path.quadraticBezierTo(firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

      var secondStart = Offset(size.width-50, size.height - 50); 
      var secondEnd = Offset(size.width+40, size.height - 170);
      path.quadraticBezierTo(secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);

      path.lineTo(size.width+40, 0);

    canvas.drawPath(path, paint);

    drawTextAlongPath(canvas, path, 'fully unlimited features with cooper+');
  }

  void drawTextAlongPath(Canvas canvas, Path path, String text) {
    final textStyle = TextStyle(
      fontSize: Dimensions.txt25,
      color: AppColors.darkBlack,
    );

    final textPainter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    final pathMetrics = path.computeMetrics();
    double startOffset = 80;

    for (final metric in pathMetrics) {
      final length = metric.length;
      for (int i = 0; i < text.length; i++) {
        final char = text[i];
        final textSpan = TextSpan(
          text: char,
          style: textStyle,
        );

        textPainter.text = textSpan;
        textPainter.layout();

        if (startOffset + textPainter.width / 2 > length) {
          break;
        }

        final position = metric.getTangentForOffset(startOffset + textPainter.width/2 );
        if (position == null) continue;

        canvas.save();
        canvas.translate(position.position.dx+15, position.position.dy+15);
        canvas.rotate(-(position.angle));
        textPainter.paint(canvas, Offset(-textPainter.width / 2, -textPainter.height));
        canvas.restore();

        startOffset += textPainter.width;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}