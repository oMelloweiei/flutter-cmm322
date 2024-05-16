import 'dart:convert';

import 'package:binny_application/data/models/shopModel.dart';
import 'package:binny_application/data/models/userModel.dart';
import 'package:binny_application/pages/selltrash/sell_info.dart';
import 'package:binny_application/pages/selltrash/seller_detail.dart';
import 'package:binny_application/pages/selltrash/widget_selltrash.dart';
import 'package:binny_application/theme/color.dart';
import 'package:binny_application/widgets/appbar.dart';
import 'package:binny_application/widgets/class/Color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class summary extends StatefulWidget {
  final ShopModel shop;

  String imageUrl;
  String jsonString;
  List<String> trashlist;
  summary(
      {super.key,
      required this.shop,
      required this.imageUrl,
      required this.jsonString,
      required this.trashlist});

  @override
  State<summary> createState() => _summaryState();
}

class _summaryState extends State<summary> {
  String _name = '';
  String _number = '';
  @override
  void initState() {
    super.initState();
    // Extract name from jsonString when page initializes
    _extractName();
    _extractNumber();
  }

  void _extractName() {
    if (widget.jsonString.isEmpty) {
      return;
    }
    try {
      final Map<String, dynamic> jsonMap = jsonDecode(widget.jsonString);
      _name = jsonMap['name'] ?? '';
    } catch (e) {
      print('Error extracting name: $e');
    }
  }

  void _extractNumber() {
    if (widget.jsonString.isEmpty) {
      return;
    }
    try {
      final Map<String, dynamic> jsonMap = jsonDecode(widget.jsonString);
      _number = jsonMap['number'] ?? '';
    } catch (e) {
      print('Error extracting name: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Ticolor.whiteMain1,
      extendBodyBehindAppBar: true,
      appBar: appBarSellpage(shopName: widget.shop.shopname),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              SizedBox(
                  width: size.width,
                  height: size.height * 0.25,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Image.network(
                      widget.imageUrl,
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width * 0.62,
                    ),
                  )),
              Container(
                  padding: EdgeInsets.only(top: 20),
                  height: size.height * 0.69,
                  child: SingleChildScrollView(
                    child: Container(
                        decoration: BoxDecoration(),
                        child: Column(children: [
                          Container(
                              margin: const EdgeInsets.all(30),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Column(children: [
                                Container(
                                  decoration: BoxDecoration(),
                                  width: 350,
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          decoration: const BoxDecoration(),
                                          height: 50,
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const Text(
                                                    "  ประเภทขยะรีไซเคิล",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                                // jade ปุ่มมุงอยู่นี้นะ
                                                GestureDetector(
                                                  onTap: () =>
                                                      Navigator.pop(context),
                                                  child: Container(
                                                    margin:
                                                        const EdgeInsets.all(4),
                                                    decoration: BoxDecoration(),
                                                    child: const Row(
                                                      children: [
                                                        Icon(
                                                          Icons.edit,
                                                          color: greenMain2,
                                                        ),
                                                        Text(
                                                          "แก้ไข",
                                                          style: TextStyle(
                                                              color:
                                                                  greenMain3),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ]),
                                        ),
                                        ////list list
                                        Center(
                                          child: SizedBox(
                                            height: 90,
                                            child: ListView.builder(
                                                padding: EdgeInsets.zero,
                                                itemCount:
                                                    widget.trashlist.length - 1,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        flex: 4,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 15.0),
                                                          child: Text(
                                                            widget.trashlist[
                                                                index + 1],
                                                            style: GoogleFonts
                                                                    .ibmPlexSansThai()
                                                                .copyWith(
                                                                    fontSize:
                                                                        16,
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                          flex: 1,
                                                          child: Text('5.5 kg'))
                                                    ],
                                                  );
                                                }),
                                          ),
                                        )

                                        ////listview listkind
                                      ]),
                                ),

                                //// divider----------------------------------
                                ///
                                ///
                                ///
                                Divider(
                                  indent: 20,
                                  endIndent: 20,
                                ),

                                ///
                                ///
                                ///
                                ///
                                ///
                                Container(
                                  height: 160,
                                  width: 320,
                                  child: Column(children: [
                                    Container(
                                      decoration: BoxDecoration(),
                                      height: 20,
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("  รายละเอียดผู้ส่ง",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ]),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 8.0, left: 5.0, right: 5.0),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.location_pin,
                                            color: greenMain2,
                                            size: 30,
                                          ),
                                          Text(
                                            "ที่ไหนก็ได้ที่มีเธอ",
                                            style: TextStyle(fontSize: 14),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 8.0, left: 5.0, right: 5.0),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.man,
                                            color: greenMain2,
                                            size: 30,
                                          ),
                                          Text(_name,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black)),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 8.0, left: 5.0, right: 5.0),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.phone,
                                            color: greenMain2,
                                            size: 30,
                                          ),
                                          Text(_number,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black)),
                                        ],
                                      ),
                                    )
                                    ////listview listkind
                                    ///
                                    ///new text info
                                    ///
                                  ]),
                                )
                              ])),
                          /////   container ก้อนใหญ่ อันล่าง
                          Container(
                            width: 360,
                            margin: const EdgeInsets.only(
                                left: 15, right: 15, bottom: 15),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  height: 30,
                                  width: 300,
                                  decoration: BoxDecoration(),
                                  child: const Text("  ทั้งหมด",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Container(
                                    alignment: Alignment.centerLeft,
                                    height: 30,
                                    width: 300,
                                    decoration: const BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255)),
                                    child: (const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("  ค่าบริการ",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal)),
                                        Text(
                                          "฿20",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ))),
                                /////////----------------------------------------
                                const Divider(
                                  indent: 20,
                                  endIndent: 20,
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  height: 30,
                                  width: 300,
                                  decoration: BoxDecoration(),
                                  child: const Text("  ชำระเงินโดย",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Container(
                                    alignment: Alignment.centerLeft,
                                    height: 30,
                                    width: 300,
                                    decoration: BoxDecoration(),
                                    child: (const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("  เงินสด/ชำระเงินปลายทาง",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal)),
                                        Icon(Icons.arrow_right)
                                      ],
                                    ))),
                                SizedBox(
                                  height: 20,
                                )
                              ],
                            ),
                          )
                        ])),
                  ))
            ],
          ),
          Positioned(
            top: 0,
            child: Container(
              width: size.width,
              height: size.height * 0.25,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.black, Color.fromARGB(0, 0, 0, 0)])),
            ),
          ),
          Positioned(
            top: 210,
            left: 13,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              color: blackMain2,
              child: Text(
                widget.shop.shopname,
                style: GoogleFonts.ibmPlexSansThai().copyWith(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Positioned(
              bottom: 5,
              child: SizedBox(
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
                              trashList: widget.trashlist));
                        },
                        child: Text(
                          'ถัดไป',
                          style: GoogleFonts.ibmPlexSansThai().copyWith(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ))))
        ],
      ),
    );
  }
}
