import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailScan extends StatefulWidget {
  const DetailScan({Key? key}) : super(key: key);
  @override
  State<DetailScan> createState() => _DetailScanState();
}

class _DetailScanState extends State<DetailScan> {
  bool isLiked = false;
  bool isDisliked = false;

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
      if (isLiked) {
        isDisliked = false; // ให้ปุ่ม dislike หากเปิดอยู่ในสถานะปิด
      }
    });
  }

  void toggleDislike() {
    setState(() {
      isDisliked = !isDisliked;
      if (isDisliked) {
        isLiked = false; // ให้ปุ่ม like หากเปิดอยู่ในสถานะปิด
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F9FD),
      appBar: DetailScanAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BinProduct(),
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
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color.fromARGB(0, 255, 255, 255),
      elevation: 0,
      title: Text(
        'Binny',
        style: TextStyle(
            fontSize: 26, fontWeight: FontWeight.w700, color: Colors.black),
      ),
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back, size: 40, color: Colors.black),
      ),
      actions: [
        IconButton(
          onPressed: () {
            // Add your function here
          },
          icon: Icon(Icons.filter_list, size: 40, color: Colors.black),
        ),
      ],
    );
  }
}

class BinProductDetail extends StatelessWidget {
  final bool isFavorited;
  final VoidCallback toggleFavorite;

  BinProductDetail({
    required this.isFavorited,
    required this.toggleFavorite,
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
            'assets/trash/demoTrash.png',
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
          ),
          SizedBox(height: 16),
          BinProductText(),
          SizedBox(height: 10),
          ProductDetailTwoPic(),
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
                          'assets/trash/demoTrash.png',
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
                    Container(
                      width: 135,
                      height: 125,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[200],
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/trash/demoTrash.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Bottle',
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
                    'Scan Tip: Always rinse bottles before recycling',
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
