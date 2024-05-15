import 'package:binny_application/data/models/shopModel.dart';
import 'package:binny_application/data/models/userModel.dart';
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
  UserModel user;
  String imageUrl;
  summary(
      {super.key,
      required this.shop,
      required this.imageUrl,
      required this.user});

  @override
  State<summary> createState() => _summaryState();
}

class _summaryState extends State<summary> {
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
                  child: Jadewidget())
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
                          Get.to(detailseller(
                            shop: widget.shop,
                            imageUrl: widget.imageUrl,
                            user: widget.user,
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
                      ))))
        ],
      ),
    );
  }
}
