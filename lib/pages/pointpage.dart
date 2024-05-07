import 'package:binny_application/widgets/appbar.dart';
import 'package:binny_application/widgets/bottomnavbar.dart';
import 'package:binny_application/widgets/reward.dart';
import 'package:binny_application/widgets/score.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PointPage extends StatefulWidget {
  const PointPage({Key? key}) : super(key: key);

  @override
  _PointPageState createState() => _PointPageState();
}

class _PointPageState extends State<PointPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(currentPageIndex: 2),
        body: Stack(children: [
          DefaultTabController(
            length: 2, // Specify the length of tabs
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    child: TabBar(
                      unselectedLabelColor: Color(0xff63676D),
                      labelColor: Color(0xff62BF26),
                      indicatorColor: Color(0xff62BF26),
                      controller: tabController,
                      tabs: [
                        Tab(
                          text: 'แต้มสะสม',
                        ),
                        Tab(
                          text: 'แลกของ',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: TabBarView(
                      controller: tabController,
                      children: [
                        Tab1(),
                        Tab2(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: MyBottomNavbar(
              currentPage: 2,
            ),
          ),
        ]));
  }
}
