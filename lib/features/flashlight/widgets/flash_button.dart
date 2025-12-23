import 'package:flutter/material.dart';

class FlashButton extends StatelessWidget {
  const FlashButton({
    required this.isOn,
    required this.onTap,
  });

  final bool isOn;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      duration: const Duration(milliseconds: 200),
      scale: isOn ? 1.1 : 1.0,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 160,
          height: 160,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isOn ? Colors.white : Colors.black,
            boxShadow: [
              if (isOn)
                BoxShadow(
                  color: Colors.amber.withOpacity(0.8),
                  blurRadius: 40,
                  spreadRadius: 10,
                ),
            ],
          ),
          child: Icon(
            isOn ? Icons.flash_on_rounded : Icons.flash_off_rounded,
            size: 80,
            color: isOn ? Colors.orange : Colors.white,
          ),
        ),
      ),
    );
  }
}