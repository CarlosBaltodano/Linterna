class FlashlightState {
  final bool isOn;
  final bool hasPermission;

  FlashlightState({
    required this.isOn,
    required this.hasPermission,
  });

  FlashlightState copyWith({
    bool? isOn,
    bool? hasPermission,
  }) {
    return FlashlightState(
      isOn: isOn ?? this.isOn,
      hasPermission: hasPermission ?? this.hasPermission,
    );
  }
}