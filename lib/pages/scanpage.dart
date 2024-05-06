import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScanPage extends StatefulWidget {
  final List<CameraDescription> cameras;
  const ScanPage({super.key, required this.cameras});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  late CameraController cameraController;
  late Future<void> cameraValue;
  int _page = 1;
  void startCamera(int camera) {
    cameraController = CameraController(
        widget.cameras[camera], ResolutionPreset.medium,
        enableAudio: false);
    cameraValue = cameraController.initialize();
  }

  @override
  void initState() {
    startCamera(0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {
                    setState(() {
                      _page = 1;
                    });
                  },
                  child: Text('first')),
              TextButton(
                  onPressed: () {
                    setState(() {
                      _page = 2;
                    });
                  },
                  child: Text('Second')),
            ],
          ),
        ),
        body: Column(
          children: [
            _page == 1
                ? Container(
                    height: 678,
                    child: Stack(alignment: Alignment.center, children: [
                      FutureBuilder(
                          future: cameraValue,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              return Padding(
                                padding: const EdgeInsets.all(40),
                                child: SizedBox(
                                  width: size.width,
                                  height: size.height,
                                  child: FittedBox(
                                    fit: BoxFit.fitHeight,
                                    child: SizedBox(
                                      width: 100,
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(2),
                                          child:
                                              CameraPreview(cameraController)),
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              return Center(child: CircularProgressIndicator());
                            }
                          }),
                      Container(
                        width: 350,
                        child: Image.asset('assets/scanner/scannerScope.png'),
                      )
                    ]),
                  )
                : Container(
                    width: size.width,
                    height: 800,
                    child: Center(child: Text('Mark\'s page')),
                  )
          ],
        ));
  }
}
