import 'package:binny_application/data/models/shopModel.dart';
import 'package:binny_application/theme/color.dart';
import 'package:binny_application/widgets/appbar.dart';
import 'package:binny_application/widgets/class/Color.dart';
import 'package:binny_application/widgets/class/Image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SellInfo extends StatelessWidget {
  final ShopModel shop;
  final String imageUrl;
  List<String> trashList;
  SellInfo(
      {Key? key,
      required this.shop,
      required this.imageUrl,
      required this.trashList}) {
    trashList.removeAt(0);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Ticolor.whiteMain1,
      appBar: AppBar(
        centerTitle: false,
        leadingWidth: 10,
        backgroundColor: Ticolor.no,
        leading: SizedBox(),
        title: Image.asset(
          TImages.logoblack,
          fit: BoxFit.cover,
          height: 30,
          color: Colors.white,
        ),
        actions: [
          TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.white),
              onPressed: () {},
              child: Text(
                'ยกเลิกคำสั่ง',
                style: TextStyle(
                  color: Color(0xFF232323),
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  letterSpacing: -0.40,
                ),
              )),
          SizedBox(width: 20)
        ],
      ),
      body: SingleChildScrollView(
          child: Stack(
        children: [
          Container(
            height: size.height + 400,
          ),
          Positioned(
              child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
            height: size.height * 0.35,
            width: size.width,
          )),
          // SellPanel(shop: shop, imageUrl: imageUrl)
          Positioned(
            left: 20,
            top: size.height * 0.22,
            child: Container(
              padding: EdgeInsets.all(5),
              color: Colors.black,
              child: Text(
                shop.shopname,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.40,
                ),
              ),
            ),
          ),
          Positioned(
            left: size.width * 0.05,
            top: size.height * 0.28,
            child: Container(
              // width: size.width * 0.8,
              padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 7),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    strokeAlign: BorderSide.strokeAlignOutside,
                    color: Color(0xFFE5E5E5),
                  ),
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      FaIcon(FontAwesomeIcons.calendarCheck,
                          size: 40, color: Color(0xFFE5E5E5)),
                      Text(
                        'ลงคิวรับขยะ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF232323),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.40,
                        ),
                      ),
                      Text(
                        '15 ก.พ. 67',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF232323),
                          fontSize: 10,
                          fontWeight: FontWeight.w300,
                          letterSpacing: -0.40,
                        ),
                      )
                    ],
                  ),
                  SizedBox(width: 5),
                  Container(width: 50, height: 3, color: Color(0xFFE5E5E5)),
                  SizedBox(width: 5),
                  Column(
                    children: [
                      FaIcon(FontAwesomeIcons.truckFast,
                          size: 40, color: Color(0xFFE5E5E5)),
                      Text(
                        'ลงคิวรับขยะ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF232323),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.40,
                        ),
                      ),
                      Text(
                        '15 ก.พ. 67',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF232323),
                          fontSize: 10,
                          fontWeight: FontWeight.w300,
                          letterSpacing: -0.40,
                        ),
                      )
                    ],
                  ),
                  SizedBox(width: 5),
                  Container(width: 50, height: 3, color: Color(0xFFE5E5E5)),
                  SizedBox(width: 5),
                  Column(
                    children: [
                      FaIcon(FontAwesomeIcons.faceSmile,
                          size: 40, color: Color(0xFFE5E5E5)),
                      Text(
                        'ลงคิวรับขยะ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF232323),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.40,
                        ),
                      ),
                      Text(
                        '15 ก.พ. 67',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF232323),
                          fontSize: 10,
                          fontWeight: FontWeight.w300,
                          letterSpacing: -0.40,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              left: 20,
              top: size.height * 0.4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ผู้รับซื้อ',
                    style: TextStyle(
                      color: Color(0xFF232323),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      padding: EdgeInsets.all(5),
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                            strokeAlign: BorderSide.strokeAlignOutside,
                            color: Color(0xFFE5E5E5),
                          ),
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      child: Row(
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                TImages.profilerabbit,
                                fit: BoxFit.cover,
                                width: 70,
                                height: 70,
                              ),
                              SizedBox(width: 10),
                              Container(
                                  width: 160,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        shop.ownerName,
                                        style: TextStyle(
                                          color: Color(0xFF232323),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: -0.40,
                                        ),
                                      ),
                                      Text(
                                        'สังกัด: ${shop.shopname}',
                                        style: TextStyle(
                                          color: Color(0xFF232323),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: -0.40,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        'เบอร์ติดต่อ: ${shop.phone}',
                                        style: TextStyle(
                                          color: Color(0xFF232323),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          letterSpacing: -0.40,
                                        ),
                                      )
                                    ],
                                  ))
                            ],
                          ),
                          SizedBox(width: 20),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(7),
                                decoration: ShapeDecoration(
                                  color: Color(0xFFDEFFE7),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(11),
                                  ),
                                ),
                                child: Icon(
                                  Icons.phone_android_outlined,
                                  color: Color(0xFF02C275),
                                ),
                              ),
                              SizedBox(width: 5),
                              Container(
                                padding: EdgeInsets.all(7),
                                decoration: ShapeDecoration(
                                  color: Color(0xFFDEFFE7),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(11),
                                  ),
                                ),
                                child: FaIcon(
                                  FontAwesomeIcons.comment,
                                  color: Color(0xFF02C275),
                                ),
                              ),
                            ],
                          )
                        ],
                      )),
                  SizedBox(height: 20),
                  Text(
                    'รายการขายขยะ',
                    style: TextStyle(
                      color: Color(0xFF232323),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: trashList.map((entry) {
                      int index = trashList.indexOf(entry);
                      return Container(
                          margin: EdgeInsets.only(bottom: 20),
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1,
                                strokeAlign: BorderSide.strokeAlignOutside,
                                color: Color(0xFFE5E5E5),
                              ),
                              borderRadius: BorderRadius.circular(18),
                            ),
                          ),
                          child: Row(children: [
                            Row(
                              children: [
                                Image.asset(
                                  TImages.profilerabbit,
                                  fit: BoxFit.cover,
                                  width: 70,
                                  height: 70,
                                ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          entry,
                                          style: TextStyle(
                                            color: Color(0xFF232323),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: -0.40,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    Row(
                                      children: [
                                        Text(
                                          'ราคารับซื้อ',
                                          style: TextStyle(
                                            color: Color(0xFF232323),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: -0.40,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            )
                          ])
                          // child: Center(child: Text('$entry')),
                          );
                    }).toList(),
                  )
                ],
              )),
        ],
      )),
    );
  }
}
