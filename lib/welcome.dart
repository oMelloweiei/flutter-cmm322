import 'package:binny_application/features/authentication/screens/signup/widgets/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to Binny Application!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                SignupScreen();
              },
              child: Text('Get Started'),
            ),
          ],
        ),
      ),
    );
  }
}


// class WelcomePage extends StatefulWidget {
//   const WelcomePage({super.key});

//   @override
//   State<WelcomePage> createState() => _WelcomePageState();
// }

// class _WelcomePageState extends State<WelcomePage>
//     with TickerProviderStateMixin {
//   late PageController _pageViewController;
//   int currentPageIndex = 0; // Variable to store the current page index

//   @override
//   void initState() {
//     super.initState();
//     _pageViewController = PageController();
//     _pageViewController
//         .addListener(_pageChangeListener); // Add listener for page changes
//   }

//   @override
//   void dispose() {
//     _pageViewController.removeListener(
//         _pageChangeListener); // Remove listener before disposing
//     _pageViewController.dispose();
//     super.dispose();
//   }

//   // Function to handle page changes
//   void _pageChangeListener() {
//     setState(() {
//       currentPageIndex =
//           _pageViewController.page!.round(); // Update current page index
//     });
//   }

//   void navigateToSignUpPage() {
//     if (_pageViewController.hasClients) {
//       _pageViewController.animateToPage(
//         1,
//         duration: Duration(milliseconds: 500),
//         curve: Curves.ease,
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Positioned.fill(
//             child: Container(
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                   colors: [
//                     Color(0xFF4795DD),
//                     Color(0xFF4DC5DD),
//                     Color(0xFF52D3DB),
//                     Color(0xFF3AB589),
//                     Color(0xFF42BD6C),
//                     Color(0xFF5AD255),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           if (currentPageIndex != 0)
//             Positioned(
//                 top: 100,
//                 right: 60,
//                 child: Image.asset('assets/garden/cloud.png',
//                     fit: BoxFit.cover, width: 111, height: 48)),
//           if (currentPageIndex != 0)
//             Positioned(
//                 top: 180,
//                 right: -30,
//                 child: Image.asset('assets/garden/cloud.png',
//                     fit: BoxFit.cover, width: 111, height: 48)),
//           PageView(
//             controller: _pageViewController,
//             onPageChanged: (int page) {
//               setState(() {
//                 currentPageIndex =
//                     page; // Update current page index when page changes
//               });
//             },
//             children: <Widget>[
//               Intro(onSignUpPressed: navigateToSignUpPage),
//               SignupScreen(),
//               SignupScreen(),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }

// class Intro extends StatelessWidget {
//   final VoidCallback onSignUpPressed;
//   const Intro({Key? key, required this.onSignUpPressed}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 100, horizontal: 20),
//       width: MediaQuery.of(context).size.width,
//       height: MediaQuery.of(context).size.height,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           Image.asset(
//             'assets/icons/binny-100px.png',
//             color: Colors.white,
//             fit: BoxFit.cover,
//             height: 97,
//           ),
//           SizedBox(
//             height: MediaQuery.of(context).size.height * 0.275,
//           ),
//           OverflowBar(
//             children: [
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 16),
//                 child: TextButton(
//                   onPressed: () {},
//                   style: TextButton.styleFrom(
//                     backgroundColor: Colors.black,
//                     textStyle: TextStyle(fontSize: 16),
//                     fixedSize: Size(120, 50),
//                   ),
//                   child: Text(
//                     'Login',
//                     style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 20,
//                         fontWeight: FontWeight.w700),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 16),
//                 child: TextButton(
//                   onPressed: onSignUpPressed,
//                   style: TextButton.styleFrom(
//                     backgroundColor: Colors.white,
//                     textStyle: TextStyle(fontSize: 16),
//                     fixedSize: Size(120, 50),
//                   ),
//                   child: Text(
//                     'Sign up',
//                     style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 20,
//                         fontWeight: FontWeight.w700),
//                   ),
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
