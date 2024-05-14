import 'package:binny_application/data/repositories/authentication_repository.dart';
import 'package:binny_application/features/personalization/controllers/user_controller.dart';
import 'package:binny_application/theme/color.dart';
import 'package:binny_application/widgets/class/Image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:binny_application/widgets/class/Color.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int currentPageIndex;

  MyAppBar({
    Key? key,
    required this.currentPageIndex,
  }) : super(key: key);

  Color getColor(int page) {
    if (page != 0) {
      return Ticolor.blackMain3;
    }
    return Ticolor.whiteMain1;
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    final _color = getColor(currentPageIndex);
    return AppBar(
      backgroundColor: Ticolor.no,
      leadingWidth: currentPageIndex != 1 ? 52 : 20,
      title: Image.asset(
        TImages.logoblack,
        color: _color,
        fit: BoxFit.cover,
        height: 30,
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: _color,
              size: 35,
            )),
        IconButton(
            onPressed: () => AuthenticationRepository.instance.logout(),
            icon: Icon(
              Icons.person,
              color: _color,
              size: 35,
            )),
        SizedBox(width: 10)
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class appBarSellpage extends StatelessWidget implements PreferredSizeWidget {
  late String shopName;
  appBarSellpage({Key? key, required this.shopName}) : super(key: key);

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
      title: Text(
        shopName,
        style: GoogleFonts.ibmPlexSansThai().copyWith(
          color: whiteMain1,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
