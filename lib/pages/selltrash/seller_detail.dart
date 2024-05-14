import 'package:binny_application/pages/homepage.dart';
import 'package:binny_application/pages/selltrash/widget_selltrash.dart';
import 'package:binny_application/widgets/appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class detailseller extends StatefulWidget {
  final String shopName;
  const detailseller({super.key, required this.shopName});

  @override
  State<detailseller> createState() => _detailsellerState();
}

class _detailsellerState extends State<detailseller> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appBarSellpage(shopName: widget.shopName),
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            color: Colors.black,
          ),
          Positioned(
              bottom: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: nextButton(title: 'next page', link: homePage()),
              ))
        ],
      ),
    );
  }
}
