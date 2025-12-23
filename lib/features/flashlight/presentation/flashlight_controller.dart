import 'package:flutter_riverpod/legacy.dart';
import 'package:linterna/core/permissions/permission_service.dart';
import 'package:linterna/features/flashlight/data/flashlight_service.dart';
import 'package:linterna/features/flashlight/presentation/flashlight_state.dart';

class FlashlightController extends StateNotifier<FlashlightState> {
  FlashlightController(
    this._service,
    this._permissionService,
  ) : super(FlashlightState(isOn: false, hasPermission: false));

  final FlashlightService _service;
  final PermissionService _permissionService;

  Future<void> init() async {
    final granted = await _permissionService.requestFlashPermission();
    state = state.copyWith(hasPermission: granted);
  }

  Future<void> toggle() async {
    if (!state.hasPermission) return;

    if (state.isOn) {
      await _service.turnOff();
    } else {
      await _service.turnOn();
    }

    state = state.copyWith(isOn: !state.isOn);
  }
}