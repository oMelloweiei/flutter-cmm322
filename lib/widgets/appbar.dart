import 'package:binny_application/data/repositories/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int currentPageIndex;
  final PageController pageController;

  const MyAppBar({
    Key? key,
    required this.currentPageIndex,
    required this.pageController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return currentPageIndex != 1
        ? AppBar(
            backgroundColor: Colors.transparent,
            leading: currentPageIndex == 0
                ? null
                : SizedBox(
                    width: 48,
                    height: 48,
                    child: IconButton(
                      onPressed: () {
                        if (currentPageIndex != 0) {
                          pageController.animateToPage(
                            0,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.ease,
                          );
                        }
                      },
                      icon: Icon(
                        Icons.chevron_left,
                        size: 48,
                      ),
                    ),
                  ),
            title: SizedBox(
              width: currentPageIndex == 0 ? 90 : 70,
              height: currentPageIndex == 0 ? 125 : 86,
              child: Row(
                children: [
                  Flexible(
                    child: Image.asset(
                      'assets/icons/BINNY.png',
                      fit: BoxFit.cover,
                      color: currentPageIndex == 0
                          ? Colors.white
                          : Color(0xFF242424),
                    ),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              currentPageIndex != 3
                  ? Padding(
                      padding: EdgeInsets.only(right: 12),
                      child: FaIcon(
                        currentPageIndex != 0
                            ? FontAwesomeIcons.clockRotateLeft
                            : FontAwesomeIcons.magnifyingGlass,
                        size: 32,
                        color: currentPageIndex == 0
                            ? Colors.white
                            : Color(0xFF242424),
                      ),
                    )
                  : SizedBox(),
              Padding(
                padding: EdgeInsets.only(right: 30),
                child: IconButton(
                  onPressed: () => AuthenticationRepository.instance.logout(),
                  icon: FaIcon(
                    currentPageIndex == 3
                        ? FontAwesomeIcons.gear
                        : (currentPageIndex != 0
                            ? FontAwesomeIcons.gift
                            : FontAwesomeIcons.bell),
                    size: 32,
                    color: currentPageIndex == 0
                        ? Colors.white
                        : Color(0xFF242424),
                  ),
                ),
              ),
            ],
          )
        : SizedBox();
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
