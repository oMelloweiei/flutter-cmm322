import 'dart:async';
import 'package:binny_application/widgets/class/Color.dart';
import 'package:binny_application/pages/scan/scanpagelist.dart';
import 'package:binny_application/theme/color.dart';
import 'package:binny_application/utils/camera/camera.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:binny_application/theme/text.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage>
    with SingleTickerProviderStateMixin {
  late CameraController? cameraController;
  late Future<void> cameraInitialization;
  late TabController _tabController;
  late Timer _timer;
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
    _timer.cancel();
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

    return Scaffold(
        appBar: AppBar(bottom: Tabbar(context, _tabController)),
        body: FutureBuilder<void>(
          future: cameraInitialization,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return buildCameraPreview();
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ));
  }

  Widget buildCameraPreview() {
    if (cameraController == null) {
      return Center(child: Text('No camera available'));
    }

    return TabBarView(
      controller: _tabController,
      children: [
        Stack(alignment: Alignment.center, children: [
          Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              height: MediaQuery.of(context).size.height * 0.8,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: CameraPreview(cameraController!))),
          Container(
            padding: EdgeInsets.all(20),
            child: Center(
                child: Image.asset(
              'assets/scanpage/scannerScope.png',
              scale: 1.2,
            )),
          )
        ]),
        Container(
            child: TrashList(
                textThemeThai: buildTextTHI(Theme.of(context).textTheme)))
      ],
    );
  }
}

PreferredSizeWidget Tabbar(BuildContext context, TabController tabController) {
  final size = MediaQuery.of(context).size;
  TextTheme textThemeThai = buildTextTHI(Theme.of(context).textTheme);
  return PreferredSize(
    preferredSize: Size.fromHeight(12),
    child: Row(
      children: [
        Expanded(
          flex: 1,
          child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.close,
                size: 40,
              )),
        ),
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.only(
              right: size.width * 0.18,
              top: size.height * 0.005,
            ),
            child: TabBar(
              indicator: BoxDecoration(
                  color: Ticolor.greenMain3,
                  borderRadius: BorderRadius.circular(24)),
              labelPadding: EdgeInsets.zero,
              controller: tabController,
              labelColor: Ticolor.whiteMain1,
              labelStyle: textThemeThai.titleLarge!
                  .copyWith(fontWeight: FontWeight.bold),
              unselectedLabelStyle:
                  textThemeThai.bodyLarge!.copyWith(fontSize: 14),
              unselectedLabelColor: Ticolor.greenMain3,
              indicatorSize: TabBarIndicatorSize.tab,
              dividerColor: Color.fromRGBO(0, 0, 0, 0),
              tabs: [
                Tab(
                  text: 'บาร์โค้ด',
                ),
                Tab(
                  text: 'รหัสบาร์โค้ด',
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
