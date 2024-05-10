import 'package:binny_application/widgets/class/Image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var data = [
  {
    'name': 'Apple iPad Gen10 (64 GB)',
    'imgpath': Image.asset(TImages.appleiPadGen10_64GB),
    'score': "55,555 คะแนน"
  },
  {
    'name': 'เมาส์ไม้ไผ่ “Icemouse2”',
    'imgpath': Image.asset(TImages.Icemouse2),
    'score': "3,555 คะแนน"
  },
  {
    'name': 'หูฟังไร้สายแบบครอบหู Sony รุ่น WH-CH520”',
    'imgpath': Image.asset(TImages.over_earwirelessheadphones),
    'score': "35,000 คะแนน"
  },
];

var data1 = [
  {
    'name': 'Revife Fiber jackget',
    'imgpath': Image.asset(TImages.revifeFiberjackget),
    'score': "800 คะแนน"
  },
  {
    'name': 'Happy Typo Tote Bag',
    'imgpath': Image.asset(TImages.happyTypoToteBag),
    'score': "700 คะแนน"
  },
  {
    'name': "T-shirt collection Pomme",
    'imgpath': Image.asset(TImages.t_shirtcollectionPomme),
    'score': "555 คะแนน"
  },
];

var data2 = [
  {
    'name': 'ชุดออกกำลังกาย Adidas x Marimeko',
    'imgpath': Image.asset(TImages.adidasxMarimeko),
    'score': "4,550 คะแนน"
  },
  {
    'name': 'จักรยานไฟฟ้า EM ECO',
    'imgpath': Image.asset(TImages.emeco),
    'score': "5,555 คะแนน"
  },
  {
    'name': "Kurma Classic Professional Yoga Mat",
    'imgpath': Image.asset(TImages.kurmaClassicProfessionalYogaMat),
    'score': "2,000 คะแนน"
  },
];

var data3 = [
  {
    'name': 'Penguin Mug – แก้วมัค พร้อมฝาปิด รุ่น แพนกวิน',
    'imgpath': Image.asset(TImages.penguinMug),
    'score': "500 คะแนน"
  },
  {
    'name': 'Save Turtle Soap Tray',
    'imgpath': Image.asset(TImages.saveTurtleSoapTray),
    'score': "250 คะแนน"
  },
  {
    'name': "ที่รองแก้ว “BOPE”",
    'imgpath': Image.asset(TImages.coasters_BOPE),
    'score': "500 คะแนน"
  },
];

class Tab2 extends StatelessWidget {
  const Tab2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.black87,
      // color: Colors.amber,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 10),
            child: Container(
              height: 110,
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
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "แต้มสะสมทั้งหมด",
                          style: GoogleFonts.ibmPlexSansThai(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
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
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 1,
                          height: 80,
                          color: Color(0xFFFFFFFF),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Icon(
                              Icons.storefront,
                              color: Colors.white,
                              size: 50,
                            ),
                            Positioned(
                              top: 0,
                              left: 30,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 3, vertical: 1),
                                decoration: BoxDecoration(
                                  color: Colors.red, // เลือกสีตามต้องการ
                                  shape: BoxShape.circle,
                                ),
                                child: Text(
                                  '99', // แทนตัวเลขด้วยจำนวนสินค้าในตะกร้า
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'สินค้าในตะกร้า',
                          style: GoogleFonts.ibmPlexSansThai(
                            fontSize: 10,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 20, left: 10),
            width: MediaQuery.of(context).size.width,
            child: Text(
              "สินค้าอิเล็กทรอนิกส์",
              style: GoogleFonts.ibmPlexSansThai(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.bold,
                  fontSize: 12),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 6),
            child: Container(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  var item = data[index];
                  var name = item['name'] as String;
                  var imgpath = item['imgpath'];
                  var score = item['score'] as String;

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 3.2,
                          height: MediaQuery.of(context).size.width / 4.8,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Color(0xFFEEF1F4),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: imgpath is Image
                                  ? imgpath.image
                                  : AssetImage(
                                      'assets/images/placeholder_image.png'), // ใช้รูปภาพจาก imgpath หรือรูปภาพเริ่มต้นในกรณีที่ไม่มีรูปภาพ
                            ),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(6),
                                topRight: Radius.circular(6)),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 3.2,
                          height: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(6),
                                bottomRight: Radius.circular(6)),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  name,
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  score,
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff62BF26),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 20, left: 10),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "เครื่องแต่งกาย",
                  style: GoogleFonts.ibmPlexSansThai(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 6),
            child: Container(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: data1.length,
                itemBuilder: (context, index) {
                  var item = data1[index];
                  var name = item['name'] as String;
                  var imgpath = item['imgpath'];
                  var score = item['score'] as String;

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 3.2,
                          height: MediaQuery.of(context).size.width / 4.8,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Color(0xFFEEF1F4),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: imgpath is Image
                                  ? imgpath.image
                                  : AssetImage(
                                      'assets/images/placeholder_image.png'), // ใช้รูปภาพจาก imgpath หรือรูปภาพเริ่มต้นในกรณีที่ไม่มีรูปภาพ
                            ),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(6),
                                topRight: Radius.circular(6)),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 3.2,
                          height: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(6),
                                bottomRight: Radius.circular(6)),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  name,
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  score,
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff62BF26),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 20, left: 10),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "สินค้าเพื่อสุขภาพ",
                  style: GoogleFonts.ibmPlexSansThai(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 6),
            child: Container(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: data2.length,
                itemBuilder: (context, index) {
                  var item = data2[index];
                  var name = item['name'] as String;
                  var imgpath = item['imgpath'];
                  var score = item['score'] as String;

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 3.2,
                          height: MediaQuery.of(context).size.width / 4.8,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Color(0xFFEEF1F4),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: imgpath is Image
                                  ? imgpath.image
                                  : AssetImage(
                                      'assets/images/placeholder_image.png'), // ใช้รูปภาพจาก imgpath หรือรูปภาพเริ่มต้นในกรณีที่ไม่มีรูปภาพ
                            ),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(6),
                                topRight: Radius.circular(6)),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 3.2,
                          height: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(6),
                                bottomRight: Radius.circular(6)),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  name,
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  score,
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff62BF26),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 20, left: 10),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "สินค้าทั่วไป&ข้าวของเครื่องใช้",
                  style: GoogleFonts.ibmPlexSansThai(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 6),
            child: Container(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: data3.length,
                itemBuilder: (context, index) {
                  var item = data3[index];
                  var name = item['name'] as String;
                  var imgpath = item['imgpath'];
                  var score = item['score'] as String;

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 3.2,
                          height: MediaQuery.of(context).size.width / 4.8,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Color(0xFFEEF1F4),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: imgpath is Image
                                  ? imgpath.image
                                  : AssetImage(
                                      'assets/images/placeholder_image.png'), // ใช้รูปภาพจาก imgpath หรือรูปภาพเริ่มต้นในกรณีที่ไม่มีรูปภาพ
                            ),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(6),
                                topRight: Radius.circular(6)),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 3.2,
                          height: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(6),
                                bottomRight: Radius.circular(6)),
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  name,
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  score,
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff62BF26),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
