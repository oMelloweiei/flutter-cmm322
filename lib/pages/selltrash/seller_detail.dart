import 'package:binny_application/data/models/shopModel.dart';
import 'package:binny_application/features/personalization/controllers/user_controller.dart';
import 'package:binny_application/pages/homepage.dart';
import 'package:binny_application/pages/selltrash/sell_info.dart';
import 'package:binny_application/theme/color.dart';
import 'package:binny_application/widgets/appbar.dart';
import 'package:binny_application/widgets/class/Color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class detailseller extends StatefulWidget {
  final ShopModel shop;
  final String imageUrl;
  List<String> trashList;
  detailseller(
      {super.key,
      required this.shop,
      required this.imageUrl,
      required this.trashList});

  @override
  State<detailseller> createState() => _detailsellerState();
}

final usercontroller = UserController.instance;

class _detailsellerState extends State<detailseller> {
  @override
  void initState() {
    // widget.trashList.removeAt(0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appBarSellpage(shopName: widget.shop.shopname),
      body: Stack(
        children: [
          Positioned(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/shop/SHOP_LOCATION.png',
                fit: BoxFit.cover,
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.95,
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: Ticolor.greenMain3),
                        onPressed: () {
                          Get.to(SellInfo(
                            shop: widget.shop,
                            imageUrl: widget.imageUrl,
                            trashList: widget.trashList,
                          ));
                        },
                        child: Text(
                          'ถัดไป',
                          style: GoogleFonts.ibmPlexSansThai().copyWith(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      )))
            ],
          )),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.3,
            top: MediaQuery.of(context).size.height * 0.23,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  SizedBox(
                    width: 30,
                  ),
                  Container(
                    width: 176,
                    height: 30,
                    padding: EdgeInsets.symmetric(horizontal: 7, vertical: 5),
                    decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            width: 1,
                            strokeAlign: BorderSide.strokeAlignOutside,
                            color: Color(0xFFDBDBDB),
                          ),
                          borderRadius: BorderRadius.circular(7),
                        )),
                    child: Text(
                      style: TextStyle(
                        color: Color(0xFF02C275),
                        fontSize: 13,
                        fontFamily: 'IBM Plex Sans Thai',
                        fontWeight: FontWeight.w500,
                        height: 0,
                        letterSpacing: -0.40,
                      ),
                      '90/98 หมู่บ้านกลอรี่เฮ้าท์ ถนนรามอินทรา 65 แยก 2-2-10',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ]),
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                        width: 2,
                        color: Color(0xFF02C275),
                      )),
                  child: Icon(
                    Icons.circle,
                    color: Color(0xFF02C275),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              child: Container(
            width: size.width,
            height: size.height * 0.25,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Colors.black,
                  const Color.fromARGB(0, 255, 255, 255)
                ])),
          )),
          Positioned(
              left: (size.width * 0.1) / 2,
              top: (size.height / 2) - 50,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      strokeAlign: BorderSide.strokeAlignOutside,
                      color: Color(0xFFDBDBDB),
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                width: size.width * 0.9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ที่อยู่ผู้ส่ง',
                      style: GoogleFonts.ibmPlexSansThai().copyWith(
                          fontWeight: FontWeight.w900,
                          fontSize: 22,
                          letterSpacing: -0.4),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                                flex: 2,
                                child: Icon(
                                  Icons.pin_drop_outlined,
                                  size: 35,
                                  color: greenMain2,
                                )),
                            Expanded(
                                flex: 7,
                                child: Container(
                                  padding: EdgeInsets.only(right: 5),
                                  child: Text(
                                    overflow: TextOverflow.ellipsis,
                                    '90/98 หมู่บ้านกลอรี่เฮ้าท์ ถนนรามอินทรา 65 แยก 2-2-10',
                                    style: GoogleFonts.ibmPlexSansThai()
                                        .copyWith(
                                            fontSize: 14,
                                            letterSpacing: -0.4,
                                            fontWeight: FontWeight.bold),
                                  ),
                                ))
                          ],
                        )),
                    Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                                flex: 2,
                                child: Icon(
                                  Icons.person_outlined,
                                  size: 35,
                                  color: greenMain2,
                                )),
                            Expanded(
                                flex: 7,
                                child: Container(
                                    padding: EdgeInsets.only(right: 5),
                                    child: TextFormField(
                                      style: GoogleFonts.ibmPlexSansThai()
                                          .copyWith(
                                              fontSize: 16,
                                              color: Colors.black),
                                    ))),
                          ],
                        )),
                    Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                                flex: 2,
                                child: Icon(
                                  Icons.phone_outlined,
                                  size: 35,
                                  color: greenMain2,
                                )),
                            Expanded(
                                flex: 7,
                                child: Container(
                                    padding: EdgeInsets.only(right: 5),
                                    child: TextFormField(
                                      style: GoogleFonts.ibmPlexSansThai()
                                          .copyWith(
                                              fontSize: 16,
                                              color: Colors.black),
                                    ))),
                          ],
                        )),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
