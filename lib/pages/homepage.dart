import 'package:binny_application/pages/comment.dart';
import 'package:binny_application/pages/donationpage.dart';
import 'package:binny_application/pages/howto.dart';
import 'package:binny_application/pages/manual.dart';
import 'package:binny_application/pages/myGarden.dart';
import 'package:binny_application/pages/pointpage.dart';
import 'package:binny_application/pages/profile.dart';
import 'package:binny_application/pages/raklok.dart';
import 'package:binny_application/pages/scanpage.dart';
import 'package:binny_application/pages/sell.dart';
import 'package:binny_application/widgets/appbar.dart';
import 'package:binny_application/widgets/bottomnavbar.dart';
import 'package:binny_application/widgets/class/Timages.dart';
import 'package:binny_application/widgets/listbox.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {
  final List<CameraDescription> cameras;
  const HomePage({Key? key, required this.cameras}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: MyAppBar(
        currentPageIndex: _currentIndex,
        pageController: _pageController,
      ),
      body: Container(
          padding: _currentIndex == 1
              ? EdgeInsets.zero
              : (_currentIndex == 0
                  ? EdgeInsets.only(top: kToolbarHeight)
                  : EdgeInsets.only(top: kToolbarHeight + 40)),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                _currentIndex != 0
                    ? Color.fromRGBO(129, 218, 246, 1)
                    : Colors.white,
                _currentIndex != 0
                    ? Colors.white
                    : Color.fromARGB(255, 24, 24, 24),
              ],
              stops: [0.0, _currentIndex != 3 ? 0.0 : 0.3],
            ),
          ),
          child: Stack(children: [
            PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              children: [
                homePage(),
                ScanPage(
                  cameras: widget.cameras,
                ),
                PointPage(),
                profilePage(),
              ],
            ),
            Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: myBottomNavbar(
                  selectedIndex: _currentIndex,
                  onIndexChanged: (index) {
                    _pageController.animateToPage(
                      index,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                  },
                ))
          ])),
    );
  }
}

class homePage extends StatefulWidget {
  homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  bool _onShow = false;

  void setOnShow(bool value) {
    setState(() {
      _onShow = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
        top: 55,
        left: 0,
        right: 0,
        child: Container(
          child: Image.asset(
            TImages.bghome, // Replace 'your_image.png' with your image path
          ),
        ),
      ),
      Positioned(
          child: HomePagecontent(
        onShowChanged: setOnShow,
      )),
      if (_onShow)
        Positioned.fill(
          child: GestureDetector(
              onTap: () {
                setOnShow(false);
              },
              child: Container(
                padding: EdgeInsets.all(10),
                color: Colors.black.withOpacity(0.6),
                child: Image.asset(TImages.the_amount_of_trash),
              )),
        )
    ]);
  }
}

class HomePagecontent extends StatelessWidget {
  final Function(bool) onShowChanged;
  HomePagecontent({Key? key, required this.onShowChanged});

  Widget myIcon(String img, String head, BuildContext context, String topic) {
    final String imgPath = img;
    return GestureDetector(
        onTap: () {
          if (topic == 'donation') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Donation(),
              ),
            );
          } else if (topic == 'katoo') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => katooPage(),
              ),
            );
          } else if (topic == 'sell') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SellPage(),
              ),
            );
          } else if (topic == 'manual') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ManualPage(),
              ),
            );
          }
        },
        child: Column(
          children: [
            Container(
              width: 35, // Set the desired width
              height: 35, // Set the desired height
              child: Image.asset(
                imgPath,
                fit: BoxFit.cover, // Adjust the fit to your requirement
              ),
            ),
            Text(head),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 172 - AppBar().preferredSize.height,
          ), // Spacer to account for app bar height
          Container(
            padding: EdgeInsets.only(
                left: 10.0, right: 10.0, top: 0.0, bottom: 50.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: 10.0,
                      right: 10.0,
                      top: 25.0,
                      bottom: 0.0), // Adjust the horizontal padding as needed
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      myIcon(TImages.sell_garbage, "ติดต่อขายขยะ", context,
                          'sell'),
                      myIcon(TImages.q_and_a, "ถามตอบ", context, 'katoo'),
                      myIcon(TImages.garbage_separation, "คู่มือแยกขยะ",
                          context, 'manual'),
                      myIcon(TImages.donate_garbage, "บริจาคขยะ", context,
                          'donation'),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ), // Add some spacing between the Row and the next Container

                Container(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      qrCodeContainer(context),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          interact_content(
                              TImages.eco_friendly, 'Raklok', context),
                          SizedBox(width: 12),
                          interact_content(TImages.chair, 'myGarden', context)
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                    ])),

                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HowtoPage(),
                            ),
                          );
                        },
                        child: Image.asset(
                          TImages.homecard,
                          height: 185,
                          width: 360,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  height: 190, // Specify a height here
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      squareBox(
                          boxTitle: 'boxTitle',
                          comment: 'comment',
                          username: 'username',
                          formattedDate: 'formattedDate')
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  height: 230, // Specify a height here
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      carpet(
                          picture: 'demoTrash.png',
                          carpetTitle: 'carpetTitle',
                          description: 'description',
                          hashtag: 'hashtag')
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget qrCodeContainer(BuildContext context) {
    return GestureDetector(
        onTap: () {
          onShowChanged(true);
        },
        child: Container(
            padding: EdgeInsets.all(16.0),
            height: 177,
            width: 335,
            decoration: BoxDecoration(
              color: Color(0xFF262525),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      TImages.homelevel,
                      width: 71,
                      height: 22,
                    ),
                    Text(
                      "ปริมาณขยะที่ฉันช่วยไว้",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16, // Adjust the font size here
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 1,
                ), // Add some spacing between the texts
                Row(
                  children: [
                    Text(
                      "#0023412000",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10, // Adjust the font size here
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "10.25",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 42, // Adjust the font size here
                      ),
                    ),
                    Text(
                      " kg",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16, // Adjust the font size here
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: const Color.fromARGB(255, 180, 180, 180),
                  thickness: 0.5,
                ), // Add a horizontal line
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      TImages.homeiconscan,
                      width: 15,
                      height: 15,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "สแกนกับร้านรับซื้อขยะที่เข้าร่วม",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11, // Adjust the font size here
                      ),
                    ),
                  ],
                )
              ],
            )));
  }

  Widget interact_content(String img, String topic, BuildContext context) {
    final imgPath = img;
    return GestureDetector(
      onTap: () {
        if (topic == 'myGarden') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MyGarden(),
            ),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RaklokPage(),
            ),
          );
        }
      },
      child: Image.asset(
        imgPath,
        fit: BoxFit.cover,
        height: 154,
      ),
    );
  }
}
