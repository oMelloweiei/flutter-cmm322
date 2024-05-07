import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:binny_application/widgets/class/Timages.dart';

void main() {
  runApp(const Donation());
}

class Donation extends StatelessWidget {
  const Donation({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Binny',
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 20, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 7),
                          child: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Color(0xFF242424),
                            size: 28,
                          ),
                        ),
                        Image.asset(
                          TImages.logoblack,
                          fit: BoxFit.cover,
                          width: 75,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 7),
                          child: Icon(
                            Icons.favorite_border_rounded,
                            color: Color(0xFF242424),
                            size: 35,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 155,
                width: double.infinity,
                child: CarouselSlider(
                  items: [
                    TImages.khayakamphra,
                    TImages.thisshirt,
                    TImages.cosmetics,
                  ].map((imagePath) {
                    return Container(
                      margin: EdgeInsets.all(3),
                      width: MediaQuery.of(context).size.width,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black,
                      ),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: ColorFiltered(
                              colorFilter: ColorFilter.mode(
                                Colors.black.withOpacity(0.5),
                                BlendMode.darken,
                              ),
                              child: Image.asset(
                                imagePath,
                                fit: BoxFit.cover,
                                width: MediaQuery.of(context).size.width,
                                height: 150,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 22, vertical: 10),
                              child: Text(
                                'ขยะกำพร้าไปไหนดี?',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            bottom: 75,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 22, vertical: 10),
                              child: Text(
                                'N15 Technology',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            bottom: 0,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 22, vertical: 10),
                              child: Text(
                                '#ประเภทขยะกำพร้า',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                  options: CarouselOptions(
                    height: 180,
                    autoPlay: false,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 3000),
                    aspectRatio: 16 / 8,
                    viewportFraction: 1.0,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.5,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  'องค์กรรับบริจาค',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 150,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(7, (index) {
                      return Container(
                        margin: EdgeInsets.all(8),
                        child: Column(
                          children: [
                            ClipOval(
                              child: Image.asset(
                                index == 0
                                    ? TImages.n15_technology
                                    : index == 1
                                        ? TImages.themirror
                                        : index == 2
                                            ? TImages.greenroad
                                            : index == 3
                                                ? TImages.pankan
                                                : index == 4
                                                    ? TImages.daibun
                                                    : index == 5
                                                        ? TImages.baannokkamin
                                                        : TImages.suankaeo,
                                fit: BoxFit.cover,
                                width: 100,
                                height: 100,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              index == 0
                                  ? 'N15 Technology'
                                  : index == 1
                                      ? 'มูลนิธิกระจกเงา'
                                      : index == 2
                                          ? 'ปันกัน'
                                          : index == 3
                                              ? 'Green Road'
                                              : index == 4
                                                  ? 'ห้องได้บุญ'
                                                  : index == 5
                                                      ? 'มูลนิธิบ้านนกขมิ้น'
                                                      : 'มูลนิธิสวนแก้ว',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  'โครงการน่าสนใจ',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 300,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(4, (index) {
                      return Container(
                        margin: EdgeInsets.all(8),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                index == 0
                                    ? TImages.u_turn
                                    : index == 1
                                        ? TImages.pansuk
                                        : index == 2
                                            ? TImages.tha_mai_thing
                                            : TImages.thamthurakit,
                                fit: BoxFit.cover,
                                width: 200,
                                height: 250,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              index == 0
                                  ? 'มูลนิธิกระจกเงา'
                                  : index == 1
                                      ? 'Green Road'
                                      : 'โครงการร้านปันกัน',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
