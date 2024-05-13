import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'scanpagelist.dart';

class DetailScan extends StatefulWidget {
  final String barcode;
  final String picture;
  final String name;
  final String iconre;
  DetailScan(
      {Key? key,
      required this.barcode,
      required this.picture,
      required this.name,
      required this.iconre})
      : super(key: key);
  @override
  State<DetailScan> createState() => _DetailScanState();
}

class _DetailScanState extends State<DetailScan> {
  bool _isLiked = false;
  bool _isDisliked = false;

  late String name;
  late String picture;
  late String barcode;
  late String iconre;

  @override
  void initState() {
    super.initState();

    //Properties here
    name = widget.name;
    picture = widget.picture;
    barcode = widget.barcode;
    iconre = widget.iconre;
  }

  void toggleLike() {
    setState(() {
      _isLiked = !_isLiked;
      if (_isLiked) {
        _isDisliked = false; // ให้ปุ่ม dislike หากเปิดอยู่ในสถานะปิด
      }
    });
  }

  void toggleDislike() {
    setState(() {
      _isDisliked = !_isDisliked;
      if (_isDisliked) {
        _isLiked = false; // ให้ปุ่ม like หากเปิดอยู่ในสถานะปิด
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F9FD),
      appBar: DetailScanAppBar(
        name: widget.name,
        barcode: widget.barcode,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BinProduct(
              picture: picture,
              iconre: iconre,
            ),
            LikeDislikeBar(
              onLikePressed: toggleLike,
              onDislikePressed: toggleDislike,
            ),
            SizedBox(height: 0),
            CommentList(),
          ],
        ),
      ),
    );
  }
}

class DetailScanAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String barcode;
  final String name;

  DetailScanAppBar({required this.name, required this.barcode});
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Color.fromARGB(0, 255, 255, 255),
      elevation: 0,
      title: Column(
        children: [
          Text(
            name,
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
          ),
          Text(
            barcode,
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w300, color: Colors.black),
          )
        ],
      ),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back, size: 40, color: Colors.black),
      ),
    );
  }
}

class BinProductDetail extends StatelessWidget {
  final bool isFavorited;
  final VoidCallback toggleFavorite;
  final String picture;

  BinProductDetail({
    required this.isFavorited,
    required this.toggleFavorite,
    required this.picture,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 333,
          height: 244,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black26, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image.asset(
            picture,
            width: 300,
            height: 300,
            fit: BoxFit.contain,
          ),
        ),
        Positioned(
          top: 2,
          right: 2,
          child: IconButton(
            onPressed: toggleFavorite,
            icon: Icon(
              isFavorited ? Icons.bookmark_outlined : Icons.bookmark_outline,
              color: isFavorited ? Colors.amber : Colors.black26,
              size: 30,
            ),
          ),
        ),
      ],
    );
  }
}

class BinProduct extends StatefulWidget {
  final String picture;
  final String iconre;

  BinProduct({required this.picture, required this.iconre});
  @override
  _BinProductState createState() => _BinProductState();
}

class _BinProductState extends State<BinProduct> {
  bool isFavorited = false;

  void toggleFavorite() {
    setState(() {
      isFavorited = !isFavorited;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Column(
        children: [
          SizedBox(height: 20),
          BinProductDetail(
            isFavorited: isFavorited,
            toggleFavorite: toggleFavorite,
            picture: widget.picture,
          ),
          SizedBox(height: 16),
          BinProductText(),
          SizedBox(height: 10),
          ProductDetailTwoPic(
            picture: widget.picture,
            iconre: widget.iconre,
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

class BinProductText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'คู่มือคัดแยกขยะ',
                style: GoogleFonts.ibmPlexSansThai(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              Image.asset(
                'assets/icons/recycle.png',
                width: 40,
                height: 40,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'แยกได้...ชิ้น',
                style: GoogleFonts.ibmPlexSansThai(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              Text(
                'วิธีคัดแยกขยะจากผู้ใช้งานอื่น',
                style: GoogleFonts.ibmPlexSansThai(
                  fontSize: 16,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProductDetailTwoPic extends StatelessWidget {
  final String picture;
  final String iconre;

  ProductDetailTwoPic({required this.picture, required this.iconre});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 333,
      height: 185,
      padding: EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 0,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      width: 135,
                      height: 125,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[200],
                      ),
                      child: Center(
                        child: Image.asset(
                          picture,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      ' ',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Stack(children: [
                      Container(
                        width: 135,
                        height: 125,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[200],
                        ),
                        child: Center(
                          child: Image.asset(
                            picture,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Container(
                        width: 135,
                        height: 125,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(54, 0, 0, 0),
                        ),
                      ),
                      Container(
                        width: 135,
                        height: 125,
                        child: Image.asset(
                          iconre,
                          fit: BoxFit.contain,
                        ),
                      )
                    ]),
                    SizedBox(height: 5),
                    Text(
                      'Type',
                      style: GoogleFonts.ibmPlexSansThai(fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 20,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'Scan Tip: Waste should be separated according to type',
                    style: GoogleFonts.ibmPlexSansThai(
                      fontSize: 10,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LikeDislikeBar extends StatelessWidget {
  final VoidCallback onLikePressed;
  final VoidCallback onDislikePressed;

  LikeDislikeBar({
    required this.onLikePressed,
    required this.onDislikePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  // Call your like function here
                  onLikePressed();
                },
                icon: Icon(
                  Icons.playlist_add_rounded,
                  size: 28,
                  color: Colors.green,
                ),
              ),
              Text(
                'เพิ่มวิธีของคุณ',
                style: GoogleFonts.ibmPlexSansThai(
                  fontSize: 12,
                  color: Colors.green,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '30',
                style: GoogleFonts.ibmPlexSansThai(
                  fontSize: 12,
                  color: Colors.green,
                ),
              ),
              IconButton(
                onPressed: () {
                  // Call your like function here
                  onLikePressed();
                },
                icon: Icon(
                  Icons.thumb_up_alt_outlined,
                  size: 20,
                  color: Colors.green,
                ),
              ),
              Text(
                '20',
                style: GoogleFonts.ibmPlexSansThai(
                  fontSize: 12,
                  color: Colors.green,
                ),
              ),
              IconButton(
                onPressed: () {
                  // Call your dislike function here
                  onDislikePressed();
                },
                icon: Icon(
                  Icons.thumb_down_alt_outlined,
                  size: 20,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CommentList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              'ความคิดเห็น',
              style: GoogleFonts.ibmPlexSansThai(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              onPressed: () {
                // Call your dislike function here
              },
              icon: Icon(
                Icons.keyboard_arrow_down_rounded,
                size: 28,
                color: Colors.green,
              ),
            ),
          ]),
          SizedBox(height: 10),
          ListView.builder(
            shrinkWrap: true,
            itemCount: comments.length,
            itemBuilder: (BuildContext context, int index) {
              return CommentScan(
                profileImage: comments[index].profileImage,
                name: comments[index].name,
                comment: comments[index].comment,
              );
            },
          ),
        ],
      ),
    );
  }
}

class CommentScan extends StatelessWidget {
  final String profileImage;
  final String name;
  final String comment;

  CommentScan({
    required this.profileImage,
    required this.name,
    required this.comment,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(profileImage),
            radius: 20,
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: GoogleFonts.ibmPlexSansThai(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 2),
              Text(
                comment,
                style: GoogleFonts.ibmPlexSansThai(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Comment {
  final String profileImage;
  final String name;
  final String comment;

  Comment({
    required this.profileImage,
    required this.name,
    required this.comment,
  });
}

List<Comment> comments = [
  Comment(
    profileImage: 'assets/trash/demoTrash.png',
    name: 'John Doe',
    comment: 'This is a great article!',
  ),
  Comment(
    profileImage: 'assets/trash/demoTrash.png',
    name: 'Jane Smith',
    comment: 'Thank you for sharing this information.',
  ),
  Comment(
    profileImage: 'assets/trash/demoTrash.png',
    name: 'Alex Johnson',
    comment: 'I have a question regarding this topic.',
  ),
];
