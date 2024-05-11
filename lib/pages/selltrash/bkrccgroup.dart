import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:binny_application/theme/color.dart';
import 'package:flutter/widgets.dart';
import 'package:binny_application/pages/selltrash/listtrash.dart';

class bkrccgroup extends StatefulWidget {
  late String shopName;
  late String shopPic;

  bkrccgroup({super.key, required this.shopName, required this.shopPic});

  @override
  State<bkrccgroup> createState() => _bkrccgroupState();
}

class _bkrccgroupState extends State<bkrccgroup> {
  List<String> _trashList = [
    'เพิ่มรายการ',
  ];

  void updateList(List<String> newList) {
    setState(() {
      _trashList = newList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: whiteMain1,
      appBar: appBarSellpage(shopName: widget.shopName),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Image.asset(
                  widget.shopPic,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width * 0.62,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 13, right: 13, top: 35),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 2),
                                child: Text(
                                  "เลือกประเภทขยะรีไซเคิล",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: blackMain2,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.info_outline_rounded,
                                color: blackMain2,
                                size: 18,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
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
                              style: TextStyle(
                                fontSize: 14.0,
                                color: greenMain3,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFE2E2E2)),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _trashList.length,
                          itemBuilder: (context, index) {
                            return addTrashIcon(
                              types: _trashList[index],
                              updateList: updateList,
                            );
                          }),
                    ),
                  ]),
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width * 0.62,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [
                    0.005,
                    1
                  ],
                      colors: [
                    Color.fromRGBO(0, 0, 0, 50),
                    Color.fromRGBO(0, 0, 0, 0)
                  ])),
            ),
            // Positioned(
            //   top: 28,
            //   left: 13,
            //   child: Row(
            //     children: [
            //       IconButton(
            //         icon: Icon(
            //           Icons.arrow_circle_left_outlined,
            //           color: whiteMain1,
            //           size: 35,
            //         ),
            //         onPressed: () => Navigator.of(context).pop(),
            //       ),
            //       Text(widget.shopName,
            //           style: TextStyle(
            //               color: whiteMain1,
            //               fontSize: 16,
            //               fontWeight: FontWeight.w600)),
            //     ],
            //   ),
            // ),
            Positioned(
              top: 218,
              left: 13,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                color: blackMain2,
                child: Text(
                  widget.shopName,
                  style: TextStyle(
                      color: whiteMain1,
                      fontSize: 20,
                      fontWeight: FontWeight.w800),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class appBarSellpage extends StatelessWidget implements PreferredSizeWidget {
  late String shopName;
  appBarSellpage({super.key, required this.shopName});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(0, 0, 0, 0),
      leading: IconButton(
        icon: Icon(
          Icons.arrow_circle_left_outlined,
          color: whiteMain1,
          size: 35,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      title: Text(shopName,
          style: TextStyle(
              color: whiteMain1, fontSize: 16, fontWeight: FontWeight.w600)),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
