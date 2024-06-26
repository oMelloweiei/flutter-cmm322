import 'package:binny_application/features/authentication/controllers/reply/reply_controller.dart';
import 'package:binny_application/features/authentication/controllers/topic/topic_controller.dart';
import 'package:binny_application/widgets/appbar.dart';
import 'package:binny_application/widgets/bottomnavbar.dart';
import 'package:binny_application/widgets/class/Color.dart';
import 'package:binny_application/widgets/class/Image.dart';
import 'package:binny_application/widgets/listbox.dart';
import 'package:binny_application/widgets/loaders/shimmer_eff.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

final topicController = Get.put(TopicController());
final ReplyController replyController = Get.put(ReplyController());

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Ticolor.blackMain2,
      // extendBodyBehindAppBar: true,
      appBar: MyAppBar(
        currentPageIndex: 0,
      ),
      body: Container(
        child: Stack(
          children: [
            homePage(),
            Positioned(
              bottom: 10,
              left: 0,
              right: 0,
              child: MyBottomNavbar(
                currentPage: 0,
              ),
            ),
          ],
        ),
      ),
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
        top: 30,
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
                color: Ticolor.blackMain3.withOpacity(0.6),
                child: Image.asset(TImages.the_amount_of_trash),
              )),
        )
    ]);
  }
}

class HomePagecontent extends StatelessWidget {
  final Function(bool) onShowChanged;
  HomePagecontent({Key? key, required this.onShowChanged});

  List<Map<String, String>> data = [
    {
      'picture': TImages.khayakamphra,
      'carpetTitle': 'ขยะกำพร้าไปไหนดี?',
      'description': 'N15 Technology',
      'hashtag': '#ประเภทขยะกำพร้า'
    },
    {
      'picture': TImages.thisshirt,
      'carpetTitle': 'เสื้อตัวนี้ไม่ใส่แล้วไว้ไหนดี?',
      'description': 'สถานสงเคราะห์ต้องการนะ',
      'hashtag': '#ประเภทขยะกำพร้า'
    },
    {
      'picture': TImages.cosmetics,
      'carpetTitle': 'เครื่องสำอางค์ใช้ไม่ทัน',
      'description': 'มา “แบ่งบุญสวย” กันไหม',
      'hashtag': '#ประเภทขยะกำพร้า'
    },
  ];

  Widget myIcon(String img, String head, BuildContext context, String topic) {
    final String imgPath = img;
    return GestureDetector(
        onTap: () {
          if (topic == 'donation') {
            Get.toNamed('/donation');
          } else if (topic == 'katoo') {
            Get.toNamed('/katoo');
          } else if (topic == 'sell') {
            Get.toNamed('/sell');
          } else if (topic == 'manual') {
            Get.toNamed('/howto');
          }
        },
        child: Column(
          children: [
            SizedBox(
              width: 35, // Set the desired width
              height: 35, // Set the desired height
              child: Image.asset(
                imgPath,
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width + 100,
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
            height: 150 - kToolbarHeight,
          ), // Spacer to account for app bar height
          Container(
            padding: EdgeInsets.only(
                left: 10.0, right: 10.0, top: 0.0, bottom: 50.0),
            decoration: BoxDecoration(
              color: Ticolor.whiteMain1,
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
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                          Get.toNamed('/howto');
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
                  height: 190,
                  child: Obx(() {
                    if (topicController.isLoading.value) {
                      return ShimmerEffect(width: 100, height: 190);
                    } else {
                      return Container(
                        height: 190,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: topicController.allTopic.length,
                          itemBuilder: (context, index) {
                            final topic = topicController.allTopic[index];
                            replyController.fetchReplies(topic.id);
                            String comment = replyController.replies.isNotEmpty
                                ? replyController.replies[0].text
                                : 'No comments';
                            String formattedDate = DateFormat.yMMMd()
                                .add_Hm()
                                .format(topic.timeStamp);

                            return squareBox(
                              topic: topic,
                              boxTitle: topic.text,
                              comment: comment,
                              username: topic.userName,
                              formattedDate: formattedDate,
                            );
                          },
                        ),
                      );
                    }
                  }),
                ),

                SizedBox(
                  height: 16,
                ),
                Container(
                  height: 141,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: carpet(
                          picture: data[index]['picture'] as String,
                          carpetTitle: data[index]['carpetTitle'] as String,
                          description: data[index]['description'] as String,
                          hashtag: data[index]['hashtag'] as String,
                        ),
                      );
                    },
                  ),
                )
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
              color: Ticolor.blackMain2,
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
                        color: Ticolor.whiteMain1,
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
                        color: Ticolor.whiteMain1,
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
                        color: Ticolor.whiteMain1,
                        fontSize: 42, // Adjust the font size here
                      ),
                    ),
                    Text(
                      " kg",
                      style: TextStyle(
                        color: Ticolor.whiteMain1,
                        fontSize: 16, // Adjust the font size here
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: Ticolor.addon6,
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
                        color: Ticolor.whiteMain1,
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
          Get.toNamed('/mygarden');
        } else {
          Get.toNamed('/raklok');
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
