import 'package:flutter/cupertino.dart';
import 'package:binny_application/widgets/class/Image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:binny_application/widgets/listbox.dart';
import 'package:binny_application/widgets/class/Color.dart';

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

var data0 = [
  {
    'name': 'KFC',
    'imgpath': Image.asset(TImages.kfc),
    'url': 'https://www.kfc.co.th/'
  },
  {
    'name': 'โอ้กะจู๋',
    'imgpath': Image.asset(TImages.ohkaju),
    'url': 'https://www.ohkajhuorganic.com/en/'
  },
  {
    'name': "Chester's",
    'imgpath': Image.asset(TImages.chester),
    'url': 'https://www.chesters.co.th/'
  },
  {
    'name': 'DairyQueen',
    'imgpath': Image.asset(TImages.dailyqueen),
    'url': 'https://www.dairyqueenthailand.com/'
  },
  {
    'name': 'MIXUE',
    'imgpath': Image.asset(TImages.mixue),
    'url': 'https://mixue.asia/'
  },
  {
    'name': "Jones'Salad",
    'imgpath': Image.asset(TImages.jones),
    'url': 'https://jonessalad.com/'
  },
];

//data1[0]['name'] = 'Tops'
var data1 = [
  {
    'name': 'Tops',
    'imgpath': Image.asset(TImages.tops),
    'url': 'https://www.tops.co.th/th'
  },
  {
    'name': 'Big C',
    'imgpath': Image.asset(TImages.bigC),
    'url': 'https://www.bigc.co.th/'
  },
  {
    'name': "Maxvalu",
    'imgpath': Image.asset(TImages.maxvalu),
    'url': 'https://www.aeonthailand.co.th/th/'
  },
  {
    'name': 'Boots',
    'imgpath': Image.asset(TImages.boots),
    'url': 'https://store.boots.co.th/th'
  },
  {
    'name': 'Tops Market',
    'imgpath': Image.asset(TImages.topsdaily),
    'url': 'https://topsdaily.tops.co.th/'
  },
  {
    'name': "Lotus's",
    'imgpath': Image.asset(TImages.lotus),
    'url': 'https://www.lotuss.com/th'
  },
  {
    'name': "Maxvalu Supermaket",
    'imgpath': Image.asset(TImages.maxvalu),
    'url': 'https://www.aeonthailand.co.th/th'
  },
];
var data2 = [
  {
    'name': 'ร้านยากรุงเทพ',
    'imgpath': Image.asset(TImages.bangkok),
    'url': 'https://www.bangkokdrugstore.co.th/home.php'
  },
  {
    'name': 'Icare Pharmacy',
    'imgpath': Image.asset(TImages.icarepharmacy),
    'url': 'https://www.facebook.com/icvitamin/'
  },
  {
    'name': "eXta Plus",
    'imgpath': Image.asset(TImages.extaplus),
    'url': 'https://www.exta.co.th/'
  },
  {
    'name': 'ร้านยาฟาสซิโน',
    'imgpath': Image.asset(TImages.fascino),
    'url': 'https://www.fascino.co.th/'
  },
  {
    'name': 'บ้านยา ฟาร์มาเฮ้าส์',
    'imgpath': Image.asset(TImages.banyapharmaHouse),
    'url': 'https://www.facebook.com/banyapharmahouse/'
  },
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
                    Ticolor.addon2,
                    Ticolor.greenMain2,
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
                            color: Ticolor.whiteMain1,
                          ),
                        ),
                        const Icon(
                          Icons.more_vert,
                          color: Ticolor.whiteMain1,
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
                            color: Ticolor.whiteMain1,
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
                color: Ticolor.greenMain9,
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
                              color: Ticolor.addon,
                            ),
                            Text(
                              " ประวัติ",
                              style: GoogleFonts.ibmPlexSansThai(
                                  color: Ticolor.whiteMain1,
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
                              color: Ticolor.whiteMain1,
                            ),
                            Text(
                              " สแกน",
                              style: GoogleFonts.ibmPlexSansThai(
                                  color: Ticolor.whiteMain1,
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
                              color: Ticolor.whiteMain1,
                            ),
                            Text(
                              " แลกเงิน",
                              style: GoogleFonts.ibmPlexSansThai(
                                  color: Ticolor.whiteMain1,
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
                              color: Ticolor.addon3,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "|ร้านอาหารใกล้ฉัน",
                          style: GoogleFonts.ibmPlexSansThai(
                              color: Ticolor.greenMain10,
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
                    itemCount: data0.length,
                    itemBuilder: (context, index) {
                      var item = data0[index];
                      var name = item['name'] as String;
                      var imgpath = item['imgpath'];

                      return Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          children: [
                            Container(
                              width: 55,
                              height: 55,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Ticolor.whiteMain1,
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
                              color: Ticolor.greenMain10,
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
                      var item = data1[index];
                      var name = item['name'] as String;
                      var imgpath = item['imgpath'];

                      return Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          children: [
                            Container(
                              width: 55,
                              height: 55,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Ticolor.whiteMain1,
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
                          "|ร้านขายยา",
                          style: GoogleFonts.ibmPlexSansThai(
                              color: Ticolor.greenMain10,
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
                    itemCount: data2.length,
                    itemBuilder: (context, index) {
                      var item = data2[index];
                      var name = item['name'] as String;
                      var imgpath = item['imgpath'];

                      return Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          children: [
                            Container(
                              width: 55,
                              height: 55,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Ticolor.whiteMain1,
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
