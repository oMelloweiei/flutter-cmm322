import 'package:flutter/cupertino.dart';
import 'package:binny_application/widgets/class/Image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var data = [
  {'name': 'KFC', 'imgpath': Image.asset(TImages.kfc)},
  {'name': 'โอ้กะจู๋', 'imgpath': Image.asset(TImages.ohkaju)},
  {'name': "Chester's", 'imgpath': Image.asset(TImages.chester)},
  {'name': 'DairyQueen', 'imgpath': Image.asset(TImages.dailyqueen)},
  {'name': 'MIXUE', 'imgpath': Image.asset(TImages.mixue)},
  {'name': "Jones'Salad", 'imgpath': Image.asset(TImages.jones)},
];

//data1[0]['name'] = 'Tops'
var data1 = [
  {'name': 'Tops', 'imgpath': Image.asset(TImages.tops)},
  {'name': 'Big C', 'imgpath': Image.asset(TImages.bigC)},
  {'name': "Maxvalu", 'imgpath': Image.asset(TImages.maxvalu)},
  {'name': 'Boots', 'imgpath': Image.asset(TImages.boots)},
  {'name': 'Tops Market', 'imgpath': Image.asset(TImages.topsdaily)},
  {'name': "Lotus's", 'imgpath': Image.asset(TImages.lotus)},
  {'name': "Maxvalu Supermaket", 'imgpath': Image.asset(TImages.maxvalu)},
];

class Tab1 extends StatelessWidget {
  const Tab1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              height: 120,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color.fromARGB(255, 47, 125, 121),
                    Color(0xFF29D062),
                  ],
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 12),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'แต้มสะสมทั้งหมด',
                          style: GoogleFonts.ibmPlexSansThai(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        const Icon(
                          Icons.more_vert,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Row(
                      children: [
                        Text(
                          '230',
                          style: GoogleFonts.ibmPlexSansThai(
                            fontWeight: FontWeight.bold,
                            fontSize: 50,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Color(0xff368983),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 12),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.history,
                              color: Color.fromRGBO(255, 255, 255, 1),
                            ),
                            Text(
                              " ประวัติ",
                              style: GoogleFonts.ibmPlexSansThai(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14),
                            ),
                          ],
                        ),
                        Container(
                            width: 1, height: 30, color: Color(0xFFFFFFFF)),
                        Row(
                          children: [
                            Icon(
                              Icons.qr_code_scanner,
                              color: Colors.white,
                            ),
                            Text(
                              " สแกน",
                              style: GoogleFonts.ibmPlexSansThai(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14),
                            ),
                          ],
                        ),
                        Container(
                            width: 1, height: 30, color: Color(0xFFFFFFFF)),
                        Row(
                          children: [
                            Icon(
                              CupertinoIcons.arrow_right_arrow_left,
                              color: Colors.white,
                            ),
                            Text(
                              " แลกเงิน",
                              style: GoogleFonts.ibmPlexSansThai(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "แลกคูปองส่วนลด",
                          style: GoogleFonts.ibmPlexSansThai(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "|ร้านอาหารใกล้ฉัน",
                          style: GoogleFonts.ibmPlexSansThai(
                              color: Color(0xff62BF26),
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      var item = data[index];
                      var name = item['name']
                          as String; // แปลงประเภทของ name เป็น String
                      var imgpath = item[
                          'imgpath']; // ไม่ต้องแปลงประเภทของ imgpath เนื่องจากมันเป็นรูปภาพ

                      return Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          children: [
                            Container(
                              width: 55,
                              height: 55,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: imgpath is Image
                                      ? imgpath.image
                                      : AssetImage(
                                          'assets/images/placeholder_image.png'), // ใช้รูปภาพจาก imgpath หรือรูปภาพเริ่มต้นในกรณีที่ไม่มีรูปภาพ
                                ),
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              name,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "|ห้างสรรพสินค้าใกล้ฉัน",
                          style: GoogleFonts.ibmPlexSansThai(
                              color: Color(0xff62BF26),
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: data1.length,
                    itemBuilder: (context, index) {
                      //Text = data1[index]['name']
                      //Img = data1[index]['imgPath']
                      //data1[index] => item
                      //item['name'] => name
                      //item['imgPath'] => imgpath

                      var item = data1[index];
                      var name = item['name']
                          as String; // แปลงประเภทของ name เป็น String
                      var imgpath = item[
                          'imgpath']; // ไม่ต้องแปลงประเภทของ imgpath เนื่องจากมันเป็นรูปภาพ

                      return Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          children: [
                            Container(
                              width: 55,
                              height: 55,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: imgpath is Image
                                      ? imgpath.image
                                      : AssetImage(
                                          'assets/images/placeholder_image.png'), // ใช้รูปภาพจาก imgpath หรือรูปภาพเริ่มต้นในกรณีที่ไม่มีรูปภาพ
                                ),
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              name,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
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
}
