import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final RxBool isLoading;
  final Size size;

  const LoadingButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.isLoading, required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() =>              InkWell(
                          onTap: isLoading.value ? null : onPressed,
                          child: Container(
                            alignment: Alignment.center,
                            height: size.height / 13,
                            width: size.width * 0.8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: const Color(0xFF004AA1),
                              boxShadow: [
                                BoxShadow(
                  color: const Color(0xFF4C2E84).withOpacity(0.2),
                  offset: const Offset(0, 15.0),
                  blurRadius: 60.0,
                                ),
                              ],
                            ),
                            child: isLoading.value
              ? const CircularProgressIndicator(color: Colors.white)
              : Text(
                  text,
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
                          ),
                              ),
        

        );
  }
}
