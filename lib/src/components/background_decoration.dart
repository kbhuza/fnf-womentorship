import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class BackgroundDecoration extends StatelessWidget {
  final Widget child;
  final bool showGradient;
  const BackgroundDecoration({super.key, required this.child,  this.showGradient = false});

  @override
  Widget build(BuildContext context) {
    return  Stack(children: [
      Positioned.fill(
        child: Container(decoration: BoxDecoration(color: Theme.of(context).primaryColor), 
        child: CustomPaint(painter: BackgroundPainter()),)),
      Positioned(child: child)
    ],);
  }
}

class BackgroundPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint =  Paint().. color = Colors.white.withOpacity(0.1);
    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width * 0.2, 0);
    path.lineTo(0, size.height* 0.4);
    path.close();

    final path1 = Path();
    path1.moveTo(size.width, 0);
    path1.lineTo(size.width * 0.8, 0);
    path1.lineTo(size.width * 0.2, size.height);
    path1.lineTo(size.width, size.height);
    path1.close();

    canvas.drawPath(path, paint);
    canvas.drawPath(path1, paint);



  }
      @override
    bool shouldRepaint(covariant CustomPainter oldDelegate){
      return false;
    }
}