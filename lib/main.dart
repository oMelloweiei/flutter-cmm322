import 'package:binny_application/bindings/general_bindings.dart';
import 'package:binny_application/data/repositories/authentication_repository.dart';
import 'package:binny_application/firebase_options.dart';
import 'package:binny_application/pages/homepage.dart';
import 'package:binny_application/pages/pointpage.dart';
import 'package:binny_application/pages/profile.dart';
import 'package:binny_application/pages/scan/scanpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  //Widget Binding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  //Init Local Storage
  await GetStorage.init();

  //Await splash until other items load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  //Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((FirebaseApp value) => Get.put(AuthenticationRepository()));

  runApp(const MainApp());
}

//ควยแม่ง build นานจังวะ

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        GetPage(name: '/home', page: () => HomePage()),
        GetPage(name: '/scan', page: () => ScanPage()),
        GetPage(name: '/point', page: () => PointPage()),
        GetPage(name: '/profile', page: () => profilePage()),
      ],
      initialBinding: GeneralBindings(),
      home: const Scaffold(
          backgroundColor: Color.fromARGB(183, 31, 188, 0),
          body: Center(
              child: CircularProgressIndicator(
            color: Color.fromARGB(255, 255, 255, 255),
          ))),
      debugShowCheckedModeBanner: false,
    );
  }
}
