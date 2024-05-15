import 'package:binny_application/bindings/general_bindings.dart';
import 'package:binny_application/data/repositories/authentication_repository.dart';
import 'package:binny_application/features/authentication/screens/login/login.dart';
import 'package:binny_application/features/authentication/screens/signup/widgets/signup.dart';
import 'package:binny_application/firebase_options.dart';
import 'package:binny_application/pages/comment.dart';
import 'package:binny_application/pages/donationpage.dart';
import 'package:binny_application/pages/homepage.dart';
import 'package:binny_application/pages/howto.dart';
import 'package:binny_application/pages/myGarden.dart';
import 'package:binny_application/pages/pointpage.dart';
import 'package:binny_application/pages/profile.dart';
import 'package:binny_application/pages/raklok.dart';
import 'package:binny_application/pages/scan/scanpage.dart';
import 'package:binny_application/pages/selltrash/sell.dart';
import 'package:binny_application/welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:binny_application/widgets/class/Color.dart';
import 'package:google_fonts/google_fonts.dart';

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
      theme: ThemeData(
        textTheme: GoogleFonts.ibmPlexSansThaiTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      getPages: [
        GetPage(name: '/welcome', page: () => WelcomePage()),
        GetPage(name: '/login', page: () => LoginForm()),
        GetPage(name: '/signup', page: () => SignupForm()),
        GetPage(name: '/home', page: () => HomePage()),
        GetPage(name: '/scan', page: () => ScanPage()),
        GetPage(name: '/point', page: () => PointPage()),
        GetPage(name: '/profile', page: () => profilePage()),
        GetPage(name: '/raklok', page: () => RaklokPage()),
        GetPage(name: '/mygarden', page: () => MyGarden()),
        GetPage(name: '/donation', page: () => Donation()),
        GetPage(name: '/katoo', page: () => katooPage()),
        GetPage(name: '/sell', page: () => SellPage()),
        GetPage(name: '/howto', page: () => HowtoPage()),
      ],
      initialBinding: GeneralBindings(),
      home: const Scaffold(
          backgroundColor: Ticolor.addon1,
          body: Center(
              child: CircularProgressIndicator(
            color: Ticolor.addon,
          ))),
      debugShowCheckedModeBanner: false,
    );
  }
}
