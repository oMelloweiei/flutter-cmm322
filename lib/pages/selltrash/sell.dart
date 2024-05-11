import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:binny_application/theme/color.dart';
import 'package:flutter/widgets.dart';

class SellPage extends StatefulWidget {
  const SellPage({super.key});

  @override
  State<SellPage> createState() => _SellPageState();
}

class _SellPageState extends State<SellPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteMain1,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Image.asset(
                  'assets/mainbk.png',
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
                      height: 113,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFE2E2E2)),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: ovally(),
                    ),
                  ]),
                ),
              ],
            ),
            Positioned(
              top: 28,
              left: 13,
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_circle_left_outlined,
                      color: whiteMain1,
                      size: 35,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  Text('BK Recycle Group',
                      style: TextStyle(
                          color: whiteMain1,
                          fontSize: 16,
                          fontWeight: FontWeight.w600)),
                ],
              ),
            ),
            Positioned(
              top: 218,
              left: 13,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                color: blackMain2,
                child: Text(
                  "BK Recycle Group",
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

  Widget ovally() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            border: Border.all(color: greenMain3, width: 2),
          ),
          width: 70,
          height: 70,
          child: Icon(
            Icons.add_outlined,
            color: greenMain3,
          ),
        ),
        Text(
          "เพิ่มรายการ",
          style: TextStyle(
              color: greenMain3, fontSize: 10, fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
