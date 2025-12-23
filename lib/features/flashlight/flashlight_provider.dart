import 'package:flutter_riverpod/legacy.dart';
import 'package:linterna/core/permissions/permission_service.dart';
import 'package:linterna/features/flashlight/data/flashlight_service.dart';
import 'package:linterna/features/flashlight/presentation/flashlight_controller.dart';
import 'package:linterna/features/flashlight/presentation/flashlight_state.dart';

final flashlightProvider =
    StateNotifierProvider<FlashlightController, FlashlightState>(
  (ref) {
    final flashlightService = FlashlightService();
    final permissionService = PermissionService();

    final controller = FlashlightController(
      flashlightService,
      permissionService,
    );

    // inicializamos permisos al crear el provider
    controller.init();

    return controller;
  },
);