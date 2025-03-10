import 'package:fnf_womentorship/configs/themes/ui_parameters.dart';
import 'package:flutter/material.dart';

class ContentArea extends StatelessWidget {
  final bool addPadding;
  final Widget child;
  const ContentArea({super.key,  this.addPadding = true, required this.child});

  @override
  Widget build(BuildContext context) {
    return  Material(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      clipBehavior: Clip.hardEdge,
      type: MaterialType.transparency,
      child: Ink(
        decoration: const BoxDecoration( color: Color.fromARGB(255, 240, 237, 255)),
        padding: addPadding ?  EdgeInsets.only(
          top: mobileScreenPadding,
        ) : EdgeInsets.zero,
        child: child,
      ),
    );
  }
}