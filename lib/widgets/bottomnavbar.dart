import 'package:binny_application/pages/homepage.dart';
import 'package:binny_application/pages/pointpage.dart';
import 'package:binny_application/pages/profile.dart';
import 'package:binny_application/pages/scan/scanpage.dart';
import 'package:binny_application/widgets/class/Color.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

var myIcon = [
  {
    'title': 'หน้าแรก',
    'icon': FontAwesomeIcons.house,
    'page': HomePage(),
  },
  {
    'title': 'สแกนขยะ',
    'icon': FontAwesomeIcons.barcode,
    'page': ScanPage(),
  },
  {
    'title': 'แต้มสะสม',
    'icon': FontAwesomeIcons.gift,
    'page': PointPage(),
  },
  {
    'title': 'โปรไฟล์',
    'icon': FontAwesomeIcons.user,
    'page': profilePage(),
  },
];

class MyBottomNavbar extends StatelessWidget {
  final int currentPage;

  const MyBottomNavbar({Key? key, required this.currentPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.symmetric(horizontal: 43, vertical: 4),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 8.50,
            offset: Offset(0, 0),
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: myIcon.asMap().entries.map((entry) {
          var index = entry.key;
          var item = entry.value;
          var title = item['title'].toString();
          var icon = item['icon'] as IconData;
          var page = item['page'] as Widget;
          return GestureDetector(
            onTap: () {
              if (index != currentPage) {
                if (currentPage != 0) {
                  Navigator.pop(context);
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => page),
                  );
                }
              }
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FaIcon(
                  icon,
                  color:
                      currentPage == index ? Ticolor.greenMain3 : Colors.grey,
                ),
                Text(
                  title,
                  style: TextStyle(
                    color:
                        currentPage == index ? Ticolor.greenMain3 : Colors.grey,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
