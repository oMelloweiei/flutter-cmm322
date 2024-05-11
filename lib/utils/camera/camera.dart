import 'package:camera/camera.dart';

class CameraInitializer {
  Future<CameraController> initCamera() async {
    final cameras = await availableCameras();

    if (cameras.isEmpty) {
      // No cameras found
      print('No cameras found');
      throw Exception('No cameras found');
    }

    // Initialize the first camera
    final firstCamera = cameras.first;
    return CameraController(
      firstCamera,
      ResolutionPreset.medium,
      enableAudio: false,
    );
  }
}
