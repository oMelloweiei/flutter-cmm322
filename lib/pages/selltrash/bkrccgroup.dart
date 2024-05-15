import 'package:binny_application/data/models/shopModel.dart';
import 'package:binny_application/pages/selltrash/seller_detail.dart';
import 'package:binny_application/pages/selltrash/widget_selltrash.dart';
import 'package:binny_application/widgets/appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:binny_application/theme/color.dart';
import 'package:flutter/widgets.dart';
import 'package:binny_application/widgets/class/Color.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class bkrccgroup extends StatefulWidget {
  ShopModel shop;
  String imageUrl;

  bkrccgroup({Key? key, required this.shop, required this.imageUrl})
      : super(key: key);

  @override
  State<bkrccgroup> createState() => _bkrccgroupState();
}

///////////////////////////class for trash///////////////////////////////////////////////

class _bkrccgroupState extends State<bkrccgroup> {
  List<String> _trashList = [
    'เพิ่มรายการ',
  ];

  bool _show = false;

  void addToTrashList(String trashItem) {
    setState(() {
      if (!_trashList.contains(trashItem)) {
        _trashList.add(trashItem);
      }
    });
  }

  void deleteTrashList(String trashItem) {
    setState(() {
      _trashList.remove(trashItem);
    });
  }

  void toggle(bool show) {
    setState(() {
      show = !show;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Ticolor.whiteMain1,
      appBar: appBarSellpage(shopName: widget.shop.shopname),
      body: Stack(alignment: Alignment.center, children: [
        SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Stack(
                  children: [
                    Image.network(
                      widget.imageUrl,
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width * 0.62,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width * 0.62,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.005, 1],
                          colors: [
                            Color.fromRGBO(0, 0, 0, 50),
                            Color.fromRGBO(0, 0, 0, 0),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 200,
                      left: 13,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 8),
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
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 13, right: 13, top: 40),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 2),
                                child: Text(
                                  "เลือกประเภทขยะรีไซเคิล",
                                  style: GoogleFonts.ibmPlexSansThai().copyWith(
                                    fontSize: 18.0,
                                    color: blackMain2,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.info_outline_rounded,
                                color: Ticolor.blackMain2,
                                size: 18,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 2),
                          child: Icon(
                            Icons.swap_vert_rounded,
                            color: greenMain3,
                            size: 18,
                          ),
                        ),
                        Text(
                          "ราคารับซื้อขยะ",
                          style: GoogleFonts.ibmPlexSansThai().copyWith(
                            fontSize: 14.0,
                            color: greenMain3,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 13, right: 13, top: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        border: Border.all(color: Ticolor.blackSup3),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _trashList.length,
                        itemBuilder: (context, index) {
                          return addTrashIcon(
                            types: _trashList[index],
                            onTap: addToTrashList,
                            deleteTrashList: deleteTrashList,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 40,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(
                  left: 15,
                ),
                child: Row(
                  children: [
                    Text(
                      textAlign: TextAlign.left,
                      "น้ำหนักขยะรีไซเคิล",
                      style: GoogleFonts.ibmPlexSansThai().copyWith(
                        fontSize: 18.0,
                        color: blackMain2,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Icon(
                        Icons.info_outline_rounded,
                        color: blackMain2,
                        size: 18,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.topCenter,
                width: size.width,
                height: size.height * 0.5,
                color: Colors.transparent,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: Sellform(type: _trashList),
                ),
              ),
            ],
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
                    )))),
        // Visibility(visible: _showpopup ,child: child)
      ]),
    );
  }
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// WIDGET PART
////////////////////////////////////////////////////////////////////////////////////////////////////////////////

