import 'package:binny_application/widgets/appbar.dart';
import 'package:binny_application/widgets/class/Color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class summary extends StatefulWidget {
  final String shopName;
  final String shopPic;
  summary({super.key, required this.shopName, required this.shopPic});

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
      appBar: appBarSellpage(shopName: widget.shopName),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                child: SizedBox(
                    width: size.width,
                    height: size.height * 0.25,
                    child: FittedBox(
                        fit: BoxFit.cover,
                        child: Image.network(widget.shopPic))),
              ),
              Expanded(child: Container())
            ],
          ),
          Container(
            width: size.width,
            height: size.height * 0.25,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.black, Color.fromARGB(0, 0, 0, 0)])),
          ),
          Center(
            child: Container(
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(color: Colors.black),
              height: 50,
              child: Text(
                widget.shopName,
                style: GoogleFonts.ibmPlexSansThai().copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
