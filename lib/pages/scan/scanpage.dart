import 'package:binny_application/pages/scan/scanpagelist.dart';
import 'package:binny_application/theme/color.dart';
import 'package:binny_application/utils/camera/camera.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:binny_application/theme/text.dart';

class ScanPage extends StatefulWidget {
  // final List<CameraDescription> cameras;
  // final PageController pageController;

  const ScanPage({
    Key? key,
    // required this.cameras,
    // required this.pageController,
  }) : super(key: key);

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage>
    with SingleTickerProviderStateMixin {
  late CameraController? cameraController;
  late Future<void> cameraInitialization;
  late TabController _tabController;
  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'Tab1'),
    Tab(text: 'Tab2'),
  ];

  @override
  void initState() {
    super.initState();
    initializeCamera();
    _tabController = TabController(length: myTabs.length, vsync: this);
  }

  @override
  void dispose() {
    cameraController?.dispose();
    super.dispose();
  }

  Future<void> initializeCamera() async {
    final initializer = CameraInitializer();
    cameraController = await initializer.initCamera();
    if (cameraController != null) {
      cameraInitialization = cameraController!.initialize();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    if (cameraController == null || cameraInitialization == null) {
      return Center(child: CircularProgressIndicator());
    }

    return FutureBuilder<void>(
      future: cameraInitialization,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return buildCameraPreview();
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget buildCameraPreview() {
    if (cameraController == null) {
      return Center(child: Text('No camera available'));
    }

    return Column(
      children: [
        TabBar(
          controller: _tabController,
          tabs: myTabs,
        ),
        Container(
            height: MediaQuery.of(context).size.height,
            child: CameraPreview(cameraController!))
      ],
    );
  }
}


// class ScanPage extends StatefulWidget {
//   final List<CameraDescription> cameras;
//   final PageController pageController;

//   const ScanPage(
//       {Key? key, required this.cameras, required this.pageController})
//       : super(key: key);

//   @override
//   State<ScanPage> createState() => _ScanPageState();
// }

// class _ScanPageState extends State<ScanPage> {
//   late CameraController cameraController;
//   late Future<void> cameraValue;
//   late TabController tabController;
//   // late PageController _pageController;

//   void startCamera(int camera) {
//     cameraController = CameraController(
//       widget.cameras[camera],
//       ResolutionPreset.medium,
//       enableAudio: false,
//     );
//     cameraValue = cameraController.initialize();
//   }

//   @override
//   void initState() {
//     startCamera(0);
//     super.initState();
//     // tabController = TabController(length: 2, vsync: this);
//   }

//   @override
//   void dispose() {
//     cameraController.dispose();
//     tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Scan Page'),
//         bottom: TabBar(
//           controller: tabController,
//           tabs: [
//             Tab(text: 'Tab 1'),
//             Tab(text: 'Tab 2'),
//           ],
//         ),
//       ),
//       body: TabBarView(
//         controller: tabController,
//         children: [
//           FutureBuilder<void>(
//             future: cameraValue,
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.done) {
//                 return Center(
//                   child: CameraPreview(cameraController),
//                 );
//               } else {
//                 return Center(child: CircularProgressIndicator());
//               }
//             },
//           ),
//           Center(child: Text('Second Tab')),
//         ],
//       ),
//     );
//   }

  // @override
  // Widget build(BuildContext context) {
  //   final size = MediaQuery.of(context).size;

  //   TextTheme textThemeThai = buildTextTHI(Theme.of(context).textTheme);
  //   return Container(
  //     width: size.width,
  //     height: size.height,
  //     child: Column(
  //       children: [
  //         Stack(children: [
  //           Padding(
  //             padding: EdgeInsets.only(
  //                 top: size.height * 0.05,
  //                 left: size.width * 0.18,
  //                 right: size.width * 0.18),
  //             child: PreferredSize(
  //               preferredSize: Size.fromHeight(20),
  //               child: TabBar(
  //                 indicator: BoxDecoration(
  //                     color: greenMain3,
  //                     borderRadius: BorderRadius.circular(24)),
  //                 labelPadding: EdgeInsets.zero,
  //                 controller: tabController, // Pass the TabController
  //                 labelColor: Colors.white,
  //                 labelStyle: textThemeThai.titleLarge!
  //                     .copyWith(fontWeight: FontWeight.bold),

  //                 unselectedLabelStyle:
  //                     textThemeThai.bodyLarge!.copyWith(fontSize: 14),
  //                 unselectedLabelColor: greenMain3,
  //                 indicatorSize: TabBarIndicatorSize.tab,
  //                 dividerColor: Color.fromRGBO(0, 0, 0, 0),
  //                 tabs: [
  //                   Tab(
  //                     text: 'บาร์โค้ด', // Change the tab labels as needed
  //                   ),
  //                   Tab(
  //                     text: 'รหัสบาร์โค้ด',
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ),
  //           Positioned(
  //             bottom: 0,
  //             left: 10,
  //             child: IconButton(
  //                 onPressed: () {
  //                   widget.pageController.previousPage(
  //                       duration: Duration.zero, curve: Curves.easeIn);
  //                 },
  //                 icon: Icon(
  //                   Icons.close,
  //                   size: 40,
  //                 )),
  //           )
  //         ]),
  //         Expanded(
  //           child: TabBarView(
  //             controller: tabController, // Pass the TabController
  //             children: [
  //               Container(
  //                 width: size.width * 0.9,
  //                 height: size.height * 0.8,
  //                 child: Stack(
  //                   alignment: Alignment.center,
  //                   children: [
  //                     SizedBox(
  //                       width: size.width * 0.9,
  //                       height: size.height * 0.8,
  //                       child: ClipRRect(
  //                         borderRadius: BorderRadius.circular(10),
  //                         child: FutureBuilder<void>(
  //                           future: cameraValue,
  //                           builder: (context, snapshot) {
  //                             if (snapshot.connectionState ==
  //                                 ConnectionState.done) {
  //                               return CameraPreview(cameraController);
  //                               // return Container();
  //                             } else {
  //                               return Center(
  //                                 child: CircularProgressIndicator(),
  //                               );
  //                             }
  //                           },
  //                         ),
  //                       ),
  //                     ),
  //                     Container(
  //                       width: 350,
  //                       child: Image.asset(
  //                         'assets/scanpage/scannerScope.png',
  //                       ),
  //                     )
  //                   ],
  //                 ),
  //               ),
  //               Widget130(),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
//}
