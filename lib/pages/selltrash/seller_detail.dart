import 'dart:convert';

import 'package:binny_application/data/models/shopModel.dart';
import 'package:binny_application/data/models/userModel.dart';
import 'package:binny_application/features/personalization/controllers/user_controller.dart';
import 'package:binny_application/pages/homepage.dart';
import 'package:binny_application/pages/selltrash/model/sellermodel.dart';
import 'package:binny_application/pages/selltrash/sum.dart';
import 'package:binny_application/pages/selltrash/widget_selltrash.dart';
import 'package:binny_application/theme/color.dart';
import 'package:binny_application/utils/validators/validations.dart';
import 'package:binny_application/widgets/appbar.dart';
import 'package:binny_application/widgets/class/Color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

final usercontroller = UserController.instance;

void openGoogleCalendar() async {
  try {
    const url = 'https://calendar.google.com/';
    await launch(url);
  } catch (e) {
    throw "Something went wrong. Please try again";
  }
}

class detailseller extends StatefulWidget {
  final ShopModel shop;

  String imageUrl;
  List<String> trashlist;
  detailseller(
      {super.key,
      required this.shop,
      required this.imageUrl,
      required this.trashlist});

  @override
  State<detailseller> createState() => _detailsellerState();
}

class _detailsellerState extends State<detailseller> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();

  String _jsonString = '';

  @override
  void initState() {
    super.initState();
    // Initialize the JSON string with the initial data
    _updateJsonString();
  }

  // Method to update the JSON string dynamically

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appBarSellpage(shopName: widget.shop.shopname),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: size.height,
            width: size.width,
            color: Color.fromARGB(255, 242, 242, 242),
          ),
          Container(
            child: SizedBox(
                width: size.width,
                child: Image.asset('assets/shop/SHOP_LOCATION.png')),
          ),
          Container(
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
          ),
          Center(
            child: Container(
              width: size.width - 40,
              height: 380,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(25)),
              child: Padding(
                padding: const EdgeInsets.only(top: 15.0, left: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'ที่อยู่ผู้ส่ง',
                        style: GoogleFonts.ibmPlexSansThai().copyWith(
                            fontWeight: FontWeight.w900,
                            fontSize: 22,
                            letterSpacing: -0.4),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Icon(
                              Icons.pin_drop_outlined,
                              size: 35,
                              color: greenMain2,
                            ),
                          ),
                          Expanded(
                              flex: 5,
                              child: Container(
                                width: 100,
                                padding: EdgeInsets.only(right: 5),
                                child: Text(
                                  overflow: TextOverflow.ellipsis,
                                  '90/98 หมู่บ้านกลอรี่เฮ้าท์ ถนนรามอินทรา 65 แยก 2-2-10',
                                  style: GoogleFonts.ibmPlexSansThai().copyWith(
                                      fontSize: 14,
                                      letterSpacing: -0.4,
                                      fontWeight: FontWeight.bold),
                                ),
                              ))
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Icon(
                              Icons.person_outlined,
                              size: 35,
                              color: greenMain2,
                            ),
                          ),
                          Expanded(
                              flex: 5,
                              child: Container(
                                  width: 100,
                                  padding: EdgeInsets.only(right: 5),
                                  child: TextFormField(
                                    validator: (value) =>
                                        Validator.validateEmptyText(
                                            'Name', value),
                                    controller: _nameController,
                                    style: GoogleFonts.ibmPlexSansThai()
                                        .copyWith(
                                            fontSize: 16, color: Colors.black),
                                    onChanged: (value) {
                                      _updateJsonString();
                                    },
                                  )))
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Icon(
                              Icons.phone_outlined,
                              size: 35,
                              color: greenMain2,
                            ),
                          ),
                          Expanded(
                              flex: 5,
                              child: Container(
                                  width: 100,
                                  padding: EdgeInsets.only(right: 5),
                                  child: TextFormField(
                                    validator: (value) =>
                                        Validator.validateEmptyText(
                                            'Name', value),
                                    controller: _nameController,
                                    style: GoogleFonts.ibmPlexSansThai()
                                        .copyWith(
                                            fontSize: 16, color: Colors.black),
                                    onChanged: (value) {
                                      _updateJsonString();
                                    },
                                  )))
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                              flex: 1,
                              child: Icon(
                                Icons.calendar_month_outlined,
                                color: greenMain2,
                                size: 35,
                              )),
                          Expanded(
                              flex: 5,
                              child: Stack(children: [
                                Container(
                                  padding: EdgeInsets.only(right: 5),
                                  child: TextFormField(
                                    style: GoogleFonts.ibmPlexSansThai()
                                        .copyWith(
                                            fontSize: 16, color: Colors.black),
                                  ),
                                ),
                                Positioned(
                                    right: 0,
                                    bottom: 0,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          bottom: 8.0, right: 5.0),
                                      child: IconButton(
                                        onPressed: () {
                                          openGoogleCalendar();
                                        },
                                        icon: Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color: greenMain2,
                                        ),
                                      ),
                                    ))
                              ]))
                        ],
                      ),
                    )
                  ],
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => summary(
                                        shop: widget.shop,
                                        imageUrl: widget.imageUrl,
                                        jsonString: _jsonString,
                                        trashlist: widget.trashlist,
                                      )));
                        },
                        child: Text(
                          'ถัดไป',
                          style: GoogleFonts.ibmPlexSansThai().copyWith(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      )))),
        ],
      ),
    );
  }

  void _updateJsonString() {
    setState(() {
      _jsonString = jsonEncode({
        'name': _nameController.text,
        'number': _numberController.text,
      });
    });
  }
}
