import 'package:binny_application/features/authentication/screens/login/login.dart';
import 'package:binny_application/features/authentication/screens/signup/widgets/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  late PageController _pageController;
  int _currentPageIndex = 1;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _handlePageChange(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  void _navigateToPage(int index) {
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: _currentPageIndex != 1
              ? IconButton(
                  onPressed: () {
                    _pageController.animateToPage(
                      1,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 40,
                    color: Colors.white,
                  ),
                )
              : SizedBox()),
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF4795DD),
                    Color(0xFF4DC5DD),
                    Color(0xFF52D3DB),
                    Color(0xFF3AB589),
                    Color(0xFF42BD6C),
                    Color(0xFF5AD255),
                  ],
                ),
              ),
            ),
          ),
          cloud(100, 60, _currentPageIndex),
          cloud(180, -30, _currentPageIndex),
          SingleChildScrollView(
              child: SizedBox(
            height: MediaQuery.of(context).size.height + 150,
            child: PageView(
              controller: _pageController,
              onPageChanged: _handlePageChange,
              children: <Widget>[
                LoginForm(pageController: _pageController),
                WelcomeContent(
                  onSignUpPressed: (index) => _navigateToPage(index),
                ),
                SignupForm(pageController: _pageController),
              ],
            ),
          )),
        ],
      ),
    );
  }

  Widget cloud(double _top, double _right, int index) {
    if (index != 1) {
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
    return SizedBox();
  }
}

class WelcomeContent extends StatelessWidget {
  final void Function(int) onSignUpPressed;

  const WelcomeContent({Key? key, required this.onSignUpPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 100, horizontal: 20),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icons/binny-100px.png',
            color: Colors.white,
            fit: BoxFit.cover,
            height: 97,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.275),
          OverflowBar(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: TextButton(
                  onPressed: () => onSignUpPressed(0),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.black,
                    textStyle: TextStyle(fontSize: 16),
                    fixedSize: Size(120, 50),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: TextButton(
                  onPressed: () => onSignUpPressed(2),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    textStyle: TextStyle(fontSize: 16),
                    fixedSize: Size(120, 50),
                  ),
                  child: Text(
                    'Sign up',
                    style: TextStyle(
                      color: Colors.black,
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
