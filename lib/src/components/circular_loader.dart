import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RotatingLoader extends StatefulWidget {
  const RotatingLoader({super.key});

  @override
  _RotatingLoaderState createState() => _RotatingLoaderState();
}

class _RotatingLoaderState extends State<RotatingLoader>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    // Create an AnimationController that rotates the widget continuously.
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(); // repeat the animation indefinitely.
  }

  @override
  void dispose() {
    // Dispose the controller to free up resources.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      // The controller drives the rotation.
      turns: _controller,
      child: SvgPicture.asset(
        'assets/svgs/loader.svg',
        width: 40,
        height: 40,
      ),
    );
  }
}
