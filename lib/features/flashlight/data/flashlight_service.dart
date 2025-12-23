import 'package:torch_light/torch_light.dart';

class FlashlightService {
  Future<void> turnOn() async {
    await TorchLight.enableTorch();
  }

  Future<void> turnOff() async {
    await TorchLight.disableTorch();
  }
}