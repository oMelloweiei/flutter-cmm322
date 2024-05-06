import 'package:binny_application/widgets/class/Timages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:binny_application/widgets/user.dart';

class profilePage extends StatefulWidget {
  const profilePage({Key? key}) : super(key: key);

  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  final List<String> items = [
    'พลาสติกใสPET ${userData[0]['PET']}',
    'กระป๋องอลูมิเนียม ${userData[0]['Aluminium']}',
    'กล่องเรื่องดื่มUHT ${userData[0]['UHT']}',
    'น้ำมันพืชใช้แล้ว ${userData[0]['Oil']}',
  ];

  String selectedMonth = 'มกราคม';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            //ส่วนเเสดงพื้นหลัง โดยล็อคตำแหน่งเอาไว้
            Positioned(
              top: 0,
              left: 0,
              right: -10,
              child: Container(
                child: Image.asset(
                  TImages.bgprofile,
                ),
              ),
            ),
            //ส่วนเเสดงคอนเทนเนอร์สีขาว โดยล็อคตำแหน่งเอาไว้
            Positioned(
              top: 100,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.circular(10), // กำหนดขอบมนขนาด 10 px
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 30),
                      Center(
                        child: Stack(
                          children: [
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: BinnyBunWidget(),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: FollowStatsContainer(),
                      ),
                      Center(
                        child: MyWasteStatistics(),
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: BcardWidget(items: items),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //ส่วนเเสดงโปรไฟล์ขอผู้ใช้ โดยล็อคตำแหน่งเอาไว้
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Image.asset(
                    TImages.profilerabbit,
                    width: 175,
                    height: 175,
                  ),
                ),
              ),
            ),
            //ส่วนเเสดงปุ่มเเก้ไขโปรไฟล์ โดยล็อคตำแหน่งเอาไว้
            Positioned(
              top: 110,
              right: MediaQuery.of(context).size.width * 0.05,
              child: InkWell(
                onTap: () {
                  // ใส่เส้นทางไปหน้าแก้ไขโปรไฟล์
                  print('Edit profile pressed');
                },
                child: Row(
                  children: [
                    Image.asset(
                      TImages.iconedit,
                      width: 18,
                      height: 18,
                      color: Color(0xFF29D062),
                    ),
                    SizedBox(width: 1),
                    Text(
                      'แก้ไขโปรไฟล์',
                      style: TextStyle(
                          color: Color(0xFF29D062),
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
