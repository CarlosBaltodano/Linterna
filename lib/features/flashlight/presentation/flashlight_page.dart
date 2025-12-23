import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:linterna/features/flashlight/flashlight_provider.dart';
import 'package:linterna/features/flashlight/widgets/flash_button.dart';
import 'package:linterna/features/flashlight/widgets/status_text.dart';

class FlashlightPage extends ConsumerWidget {
  const FlashlightPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(flashlightProvider);
    final controller = ref.read(flashlightProvider.notifier);

    return Scaffold(
      body: AnimatedContainer(
        width: MediaQuery.of(context).size.width,
        height:  MediaQuery.of(context).size.height,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          gradient: state.isOn
              ? const RadialGradient(
                  colors: [Color(0xFFFFF3B0), Color(0xFFFFC107)],
                  radius: 1.2,
                )
              : const LinearGradient(
                  colors: [Color(0xFF0F2027), Color(0xFF203A43)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StatusText(isOn: state.isOn),
              const SizedBox(height: 40),
              FlashButton(
                isOn: state.isOn,
                onTap: () {
                  HapticFeedback.mediumImpact();
                  controller.toggle();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}