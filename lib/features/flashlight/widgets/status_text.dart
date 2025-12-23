import 'package:flutter/material.dart';

class StatusText extends StatelessWidget {
  const StatusText({super.key, required this.isOn});

  final bool isOn;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: Text(
        isOn ? 'Linterna encendida' : 'Linterna apagada',
        key: ValueKey(isOn),
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: isOn ? Colors.black : Colors.white70,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
