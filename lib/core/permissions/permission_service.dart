import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  Future<bool> requestFlashPermission() async {
    final status = await Permission.camera.request();
    return status.isGranted;
  }
}