import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/physics.dart';
import 'package:binny_application/widgets/class/Color.dart';

class MyGarden extends StatefulWidget {
  const MyGarden({Key? key}) : super(key: key);
  @override
  State<MyGarden> createState() => _MyGardenState();
}

class _MyGardenState extends State<MyGarden>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);

    final spring = SpringDescription(
      mass: 1,
      stiffness: 100,
      damping: 10,
    );

    final simulation = SpringSimulation(spring, 0, 1, -0.5);
    _controller.animateWith(simulation);

    _controller.addListener(() {
      if (_controller.status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (_controller.status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
  }

  late Animation<Offset> _animationvertical = _controller.drive(
    Tween<Offset>(
      begin: Offset(0.0, 0.0),
      end: Offset(0.0, 0.1),
    ),
  );

  @override
  void dispose() {
    _controller.dispose(); // Dispose the controller when not needed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double myHeight = MediaQuery.of(context).size.height;
    final double myWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Stack(
            children: [
              Positioned.fill(
                  child: Container(
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                begin: Alignment(0.00, -1.00),
                end: Alignment(0, 1),
                colors: [Ticolor.blueSup5, Ticolor.blueSup4, Ticolor.blueSup3],
              )))),
              Positioned.fill(
                left: 0,
                top: myHeight / 2,
                child: Container(
                  height: myHeight / 2,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(0.00, -1.00),
                      end: Alignment(0, 1),
                      colors: [
                        Ticolor.greenMain6,
                        Ticolor.greenMain5,
                        Ticolor.greenMain4
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(top: 70, left: (myWidth - 330) / 2, child: myAppbar()),
              Positioned(
                  top: 170,
                  child: SizedBox(
                      width: myWidth,
                      height: 250,
                      // color: Colors.blue,
                      child: Stack(
                        children: [
                          Positioned(
                              left: myWidth - 180,
                              child: Image.asset('assets/garden/cloud.png')),
                          Positioned(
                              right: -40,
                              bottom: 50,
                              child: Image.asset(
                                'assets/garden/cloud.png',
                                fit: BoxFit.cover,
                                width: 150,
                              )),
                          Positioned(
                              left: -70,
                              top: 50,
                              child: Image.asset('assets/garden/cloud.png',
                                  fit: BoxFit.cover, width: 220)),
                        ],
                      ))),
              Positioned(
                top: (myHeight - 390) / 2,
                child: Container(
                    width: myWidth, height: 300, child: interactGlowningTree()),
              ),
              Positioned(
                  top: 130, left: (myWidth - 200) / 2, child: co2Container()),
              fingertouch(myHeight, myWidth),
              Positioned(
                  top: ((myHeight - 80) / 1.3),
                  left: (myWidth - 200) / 2,
                  child: touchDetail()),
              Positioned(
                  bottom: 0,
                  left: (myWidth - 375) / 2,
                  child: bottomContainer(375))
            ],
          ),
        ));
  }

  Widget myAppbar() {
    return Container(
      width: 330,
      // color: Colors.amber,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 40,
                color: Ticolor.whiteMain1,
              )),
          Container(
            padding: EdgeInsets.all(10),
            child: const Text(
              'Binny',
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  color: Ticolor.whiteMain1),
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.download_outlined,
                  size: 40, color: Ticolor.whiteMain1))
        ],
      ),
    );
  }

  Widget co2Container() {
    return Container(
      width: 200,
      alignment: Alignment.center,
      child: const Column(
        children: [
          Text(
            'ทุกคนช่วยลด CO2 ไปแล้ว',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Ticolor.whiteMain1),
          ),
          SizedBox(height: 2),
          Text(
            '120,562',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Ticolor.whiteMain1),
          ),
        ],
      ),
    );
  }

  Widget fingertouch(double myHeight, double myWidth) {
    return Stack(
      children: [
        Positioned(
            bottom: ((myHeight / 2) - 90) * 0.75,
            left: (myWidth - 90) / 2,
            child: Container(
                width: 90,
                height: 90,
                child: Image.asset('assets/garden/finger.png',
                    fit: BoxFit.cover, color: Ticolor.whiteMain1))),
        Positioned(
            bottom: ((myHeight / 2) - 90) * 0.75,
            left: (myWidth - 90) / 2,
            child: SlideTransition(
                position: _animationvertical,
                child: FadeTransition(
                    opacity: _controller.drive(Tween(begin: 1.0, end: 0.0)),
                    child: Container(
                        width: 90,
                        height: 90,
                        child: Image.asset('assets/garden/fingertouch.png',
                            fit: BoxFit.cover, color: Ticolor.whiteMain1))))),
      ],
    );
  }

  Widget touchDetail() {
    return Container(
      // color: Colors.amber,
      width: 200,
      height: 80,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'กดที่ต้นไม้เพื่อใช้แต้ม',
            style: TextStyle(
                fontSize: 20,
                color: Ticolor.whiteMain1,
                fontWeight: FontWeight.w800),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 2),
              decoration: const BoxDecoration(
                  color: Ticolor.whiteMain1,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Text(
                '-20',
                style: TextStyle(color: Ticolor.blackMain3, fontSize: 24),
              ))
        ],
      ),
    );
  }

  Widget bottomContainer(double myWidth) {
    return Container(
      padding: EdgeInsets.all(20),
      alignment: Alignment.topLeft,
      // color: Colors.red,
      width: myWidth,
      height: 190,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
                color: Ticolor.whiteMain1,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Text('Level. 01'),
          ),
          SizedBox(height: 7),
          const Row(
            children: [
              Text(
                'Binary Garden',
                style: TextStyle(
                    fontSize: 30,
                    color: Ticolor.whiteMain1,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                width: 8,
              ),
              Icon(
                Icons.edit_note,
                size: 35,
                color: Ticolor.whiteMain1,
              ),
            ],
          ),
          const Divider(
            height: 2,
            color: Ticolor.whiteMain1,
          )
        ],
      ),
    );
  }
}

class interactGlowningTree extends StatefulWidget {
  const interactGlowningTree({super.key});

  @override
  State<interactGlowningTree> createState() => _interactGlowningTreeState();
}

class _interactGlowningTreeState extends State<interactGlowningTree>
    with TickerProviderStateMixin {
  final List<double> pos_xy = [50, 10];
  late AnimationController _controller;
  late Animation<double> _animation;
  late AnimationController
      _imageController; // New AnimationController for image change
  late Animation<double>
      _imageAnimation; // New Animation for controlling image opacity

  late double myWidth;
  late double myHeight;

  bool firsttap = false;
  bool secondtap = false;
  bool thirdtap = false;
  bool fourthtap = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);

    _imageController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000), // Change duration as needed
    );
    _imageAnimation = Tween<double>(begin: 0, end: 1).animate(_imageController);
  }

  @override
  void dispose() {
    _controller.dispose();
    _imageController.dispose(); // Dispose the image controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final myWidth = MediaQuery.of(context).size.width;
    final myHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        setState(() {
          if (!firsttap) {
            // First tap
            firsttap = true;
          } else if (!secondtap) {
            // Second tap
            secondtap = true;
          } else if (!thirdtap) {
            thirdtap = true;
          } else if (!fourthtap) {
            fourthtap = true;
          } else if (firsttap && secondtap && thirdtap && fourthtap) {
            firsttap = false;
            secondtap = false;
            thirdtap = false;
            fourthtap = false;
          }
        });
      },
      child: Stack(
        children: [_treeAnimation(myWidth), myPlant(pos_xy)],
      ),
    );
  }

  Widget _treeAnimation(double myWidth) {
    final double pos_x = (myWidth / 2) / 4;

    return Stack(
      children: [
        AnimatedPositioned(
          duration: Duration(milliseconds: 1000),
          curve: firsttap ? Curves.easeOutBack : Curves.easeInOut,
          bottom: firsttap ? pos_xy[1] + 10 : pos_xy[1],
          left: (firsttap && !thirdtap)
              ? pos_x
              : (thirdtap ? 230 : (myWidth - 75) / 2),
          child: AnimatedOpacity(
            duration: Duration(milliseconds: 1000),
            opacity: 1,
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 800),
              child: (firsttap && !thirdtap)
                  ? Image.asset(
                      'assets/garden/pinetree.png',
                      key: UniqueKey(),
                      fit: BoxFit.cover,
                      width: 170,
                    )
                  : (thirdtap
                      ? Image.asset('assets/garden/big_greentree.png',
                          key: UniqueKey(), fit: BoxFit.cover, height: 280)
                      : Image.asset(
                          'assets/garden/greentree.png',
                          key: UniqueKey(),
                          fit: BoxFit.cover,
                        )),
            ),
          ),
        ),
        Stack(
          children: [
            AnimatedPositioned(
                duration: Duration(milliseconds: 1000),
                curve: firsttap ? Curves.easeOutBack : Curves.easeInOut,
                bottom: pos_xy[1],
                left: thirdtap ? 60 : (myWidth - 75) / 2,
                child: AnimatedOpacity(
                    duration: Duration(milliseconds: 1000),
                    opacity: firsttap && !thirdtap ? 1 : 0,
                    child: AnimatedSwitcher(
                        duration: Duration(milliseconds: 1000),
                        child: thirdtap
                            ? Image.asset(
                                'assets/garden/pinetree.png',
                                key: UniqueKey(),
                                fit: BoxFit.cover,
                                width: 140,
                              )
                            : Image.asset(
                                'assets/garden/big_greentree.png',
                                fit: BoxFit.cover,
                                width: 75,
                              )))),

            // second step
            AnimatedPositioned(
                duration: Duration(milliseconds: 1000),
                child: mySecondStep(pos_x, myWidth)),

            // third step
            AnimatedOpacity(
              opacity: thirdtap ? 1 : 0,
              duration: Duration(milliseconds: 1000),
              child: finalTree(myWidth, pos_x),
            )
          ],
        )
      ],
    );
  }

  Widget animateflower(double x, double y, String imgPath, String where,
      bool fixSize, double size) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 1000),
      left: where == "leftSide" ? x : null,
      right: where == "rightSide" ? x : null,
      bottom: y,
      child: AnimatedOpacity(
          duration: Duration(milliseconds: 1000),
          opacity: (thirdtap && !fourthtap) ? 1 : 0,
          child: Image.asset(imgPath,
              fit: BoxFit.cover, width: fixSize ? size : null)),
    );
  }

  Widget flower(double x, double y, String imgPath, String where, bool fixSize,
      double size) {
    return Positioned(
      left: where == "leftSide" ? x : null,
      right: where == "rightSide" ? x : null,
      bottom: y,
      child: AnimatedOpacity(
          duration: Duration(milliseconds: 1000),
          opacity: (fourthtap) ? 1 : 0,
          child: Image.asset(imgPath,
              fit: BoxFit.cover, width: fixSize ? size : null)),
    );
  }

  Widget mySecondStep(double pos_x, double myWidth) {
    return Stack(children: [
      AnimatedPositioned(
          duration: Duration(milliseconds: 1000),
          curve: firsttap ? Curves.easeOutBack : Curves.easeInOut,
          bottom: (firsttap && !secondtap) ? pos_xy[1] : (secondtap ? 45 : -10),
          right: (firsttap && !secondtap && !thirdtap)
              ? pos_x + 30
              : (secondtap && !thirdtap
                  ? 10
                  : (thirdtap ? 250 : (myWidth - 150) / 2)),
          child: AnimatedOpacity(
            duration: Duration(milliseconds: 1000),
            opacity: thirdtap ? 0 : (firsttap ? 1 : 0),
            child: AnimatedSwitcher(
                duration: Duration(milliseconds: 1000),
                child: (secondtap && !thirdtap)
                    ? Image.asset(
                        'assets/garden/pinetree.png',
                        key: UniqueKey(),
                        fit: BoxFit.cover,
                        width: 140,
                      )
                    : (thirdtap
                        ? Image.asset(
                            'assets/garden/pinetree.png',
                            key: UniqueKey(),
                            fit: BoxFit.cover,
                            width: 140,
                          )
                        : Image.asset(
                            'assets/garden/circle_tree.png',
                            key: UniqueKey(),
                            fit: BoxFit.cover,
                          ))),
          )),
      AnimatedPositioned(
          duration: Duration(milliseconds: 1000),
          curve:
              (secondtap && !thirdtap) ? Curves.easeOutBack : Curves.easeInOut,
          bottom: (secondtap && !thirdtap) ? pos_xy[1] : (thirdtap ? 20 : -10),
          right: (secondtap && !thirdtap)
              ? pos_x + 30
              : (thirdtap ? 250 : pos_x + 30),
          child: AnimatedOpacity(
            duration: Duration(milliseconds: 1000),
            opacity: (secondtap && !thirdtap) ? 1 : 0,
            child: AnimatedSwitcher(
                duration: Duration(milliseconds: 1000),
                child: (thirdtap)
                    ? Image.asset(
                        'assets/garden/pinetree.png',
                        key: UniqueKey(),
                        fit: BoxFit.cover,
                        width: 140,
                      )
                    : Image.asset(
                        'assets/garden/circle_tree.png',
                        fit: BoxFit.cover,
                        width: 120,
                      )),
          )),
    ]);
  }

  Widget finalTree(double myWidth, double pos_x) {
    return Stack(children: [
      Positioned(
        bottom: pos_xy[1],
        left: (myWidth + 140) / 2,
        child: Image.asset(
          'assets/garden/pinetree.png',
          fit: BoxFit.cover,
          width: 140,
        ),
      ),
      Positioned(
        bottom: pos_xy[1],
        right: (myWidth + 40) / 2,
        child: Image.asset(
          'assets/garden/pinetree.png',
          fit: BoxFit.cover,
          width: 180,
        ),
      ),
      Positioned(
          bottom: pos_xy[1],
          right: pos_x + 30,
          child: Image.asset(
            'assets/garden/circle_tree.png',
            fit: BoxFit.cover,
            width: 120,
          )),
      Positioned(
        bottom: pos_xy[1],
        left: (myWidth - 75) / 2,
        child: Image.asset(
          'assets/garden/big_greentree.png',
          fit: BoxFit.cover,
          width: 75,
        ),
      ),
    ]);
  }

  Widget myPlant(List<double> pos_xy) {
    return Stack(
      children: [
        deadtree_rabbit(-30, 10, 'assets/garden/deadtree.png'),
        deadtree_rabbit(-10, 10, 'assets/garden/big_deadtree.png'),
        deadtree_rabbit(40, 35, 'assets/garden/rabbit.png'),
        Stack(children: [
          Stack(children: [
            AnimatedPositioned(
                duration: Duration(milliseconds: 1000),
                curve: fourthtap ? Curves.easeOutBack : Curves.easeInOut,
                left: fourthtap ? 250 : 0,
                bottom: pos_xy[1],
                child: Image.asset('assets/garden/plant.png')),
            animateflower(fourthtap ? 320 : 4, 17,
                'assets/garden/yellow_flower.png', 'leftSide', false, 0),
            animateflower(fourthtap ? 320 : 37, 28,
                'assets/garden/yellowPoint.png', 'leftSide', false, 0),
            animateflower(fourthtap ? 320 : 44, 38,
                'assets/garden/greenPoint.png', 'leftSide', false, 0),
          ]),
          AnimatedPositioned(
              duration: Duration(milliseconds: 1000),
              curve: fourthtap ? Curves.easeOutBack : Curves.easeInOut,
              bottom: pos_xy[1],
              left: fourthtap ? 300 : pos_xy[0],
              child: Image.asset('assets/garden/big_plant.png')),
          animateflower(fourthtap ? 320 : 105, 55,
              'assets/garden/yellowPoint.png', 'leftSide', false, 0),
          animateflower(fourthtap ? 320 : 140, 20,
              'assets/garden/yellowPoint.png', 'leftSide', false, 0),
          animateflower(fourthtap ? 320 : 150, 40,
              'assets/garden/greenPoint.png', 'leftSide', false, 0),
          animateflower(fourthtap ? 320 : 80, 0,
              'assets/garden/biggreen_flower.png', 'leftSide', true, 55),
        ]),
        Stack(children: [
          AnimatedPositioned(
              duration: Duration(milliseconds: 1000),
              curve: fourthtap ? Curves.easeOutBack : Curves.easeInOut,
              bottom: pos_xy[1],
              right: fourthtap ? 320 : pos_xy[0] + 40, //330
              child: Image.asset('assets/garden/plant.png')),
          AnimatedPositioned(
              duration: Duration(milliseconds: 1000),
              curve: fourthtap ? Curves.easeOutBack : Curves.easeInOut,
              bottom: pos_xy[1],
              right: fourthtap ? 230 : -20, //230
              child: Image.asset(
                'assets/garden/big_plant.png',
              )),
          animateflower(fourthtap ? 320 : 20, pos_xy[1] + 15,
              'assets/garden/bigyelllow_flower.png', 'rightSide', true, 55),
          animateflower(fourthtap ? 320 : 80, pos_xy[1] + 15,
              'assets/garden/green_flower.png', 'rightSide', false, 0),

          //instance flower finaltap
          flower(
              4, 17, 'assets/garden/yellow_flower.png', 'leftSide', false, 0),
          flower(37, 28, 'assets/garden/yellowPoint.png', 'leftSide', false, 0),
          flower(44, 38, 'assets/garden/greenPoint.png', 'leftSide', false, 0),

          flower(
              105, 55, 'assets/garden/yellowPoint.png', 'leftSide', false, 0),
          flower(
              140, 20, 'assets/garden/yellowPoint.png', 'leftSide', false, 0),
          flower(150, 40, 'assets/garden/greenPoint.png', 'leftSide', false, 0),
          flower(
              80, 0, 'assets/garden/biggreen_flower.png', 'leftSide', true, 55),

          flower(20, pos_xy[1] + 15, 'assets/garden/bigyelllow_flower.png',
              'rightSide', true, 55),
          flower(80, pos_xy[1] + 15, 'assets/garden/green_flower.png',
              'rightSide', false, 0),
        ]),
      ],
    );
  }

  Widget deadtree_rabbit(double x, double y, String imgPath) {
    return Positioned(
        right: imgPath == 'assets/garden/rabbit.png' ? null : x,
        left: imgPath == 'assets/garden/rabbit.png' ? x : null,
        bottom: y,
        child: AnimatedOpacity(
            duration: Duration(milliseconds: 1000),
            opacity: fourthtap ? 1 : 0,
            child: Image.asset(imgPath)));
  }

  // Widget animatePlant() {}
}
