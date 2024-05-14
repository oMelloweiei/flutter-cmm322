import 'package:binny_application/features/authentication/screens/login/login.dart';
import 'package:binny_application/features/authentication/screens/signup/widgets/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:binny_application/widgets/class/Color.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Ticolor.blueSup5,
                    Ticolor.blueSup4,
                    Ticolor.blueSup3,
                    Ticolor.greenMain6,
                    Ticolor.greenMain5,
                    Ticolor.greenMain4,
                  ],
                ),
              ),
            ),
          ),
          cloud(100, 60),
          cloud(180, -30),
          Positioned.fill(child: WelcomeContent()),
        ],
      ),
    );
  }

  Widget cloud(double _top, double _right) {
    return Positioned(
      top: _top,
      right: _right,
      child: Image.asset(
        'assets/garden/cloud.png',
        fit: BoxFit.cover,
        width: 111,
        height: 48,
      ),
    );
  }
}

class WelcomeContent extends StatelessWidget {
  const WelcomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 100, horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.275),
          Image.asset(
            'assets/icons/binny-100px.png',
            color: Ticolor.whiteMain1,
            fit: BoxFit.cover,
            height: 97,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.275),
          OverflowBar(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: TextButton(
                  onPressed: () => Get.toNamed('/login'),
                  style: TextButton.styleFrom(
                    backgroundColor: Ticolor.blackMain3,
                    textStyle: TextStyle(fontSize: 16),
                    fixedSize: Size(120, 50),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Ticolor.whiteMain1,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: TextButton(
                  onPressed: () => Get.toNamed('/signup'),
                  style: TextButton.styleFrom(
                    backgroundColor: Ticolor.whiteMain1,
                    textStyle: TextStyle(fontSize: 16),
                    fixedSize: Size(120, 50),
                  ),
                  child: Text(
                    'Sign up',
                    style: TextStyle(
                      color: Ticolor.blackMain3,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
