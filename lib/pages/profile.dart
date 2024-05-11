import 'package:binny_application/features/authentication/screens/settings/editprofile.dart';
import 'package:binny_application/features/personalization/controllers/user_controller.dart';
import 'package:binny_application/widgets/appbar.dart';
import 'package:binny_application/widgets/bottomnavbar.dart';
import 'package:binny_application/widgets/circular_image.dart';
import 'package:binny_application/widgets/class/Color.dart';
import 'package:binny_application/widgets/class/Image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:binny_application/widgets/user.dart';
import 'package:get/get.dart';

class profilePage extends StatefulWidget {
  const profilePage({Key? key}) : super(key: key);

  @override
  State<profilePage> createState() => _profilePageState();
}

final controller = Get.put(UserController());

class _profilePageState extends State<profilePage> {
  final List<String> items = [
    'พลาสติกใสPET ${controller.user.value.plastic}kg',
    'กระป๋องอลูมิเนียม ${controller.user.value.aluminium}kg',
    'กล่องเรื่องดื่มUHT ${controller.user.value.drinkbox}kg',
    'น้ำมันพืชใช้แล้ว ${controller.user.value.plastic}kg',
  ];

  String selectedMonth = 'มกราคม';

  @override
  Widget build(BuildContext context) {
    final networkImage = controller.user.value.profilePicture;
    final image =
        networkImage.isNotEmpty ? networkImage : TImages.profilerabbit;
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: MyAppBar(currentPageIndex: 3),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                //ส่วนเเสดงพื้นหลัง โดยล็อคตำแหน่งเอาไว้
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.35,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromRGBO(129, 218, 246, 1),
                            Colors.white,
                          ],
                          stops: [
                            0.0,
                            0.5
                          ]),
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.16,
                  left: 0,
                  right: 0,
                  child: Container(
                    child: Image.asset(
                      TImages.bgprofile,
                    ),
                  ),
                ),
                //ส่วนเเสดงคอนเทนเนอร์สีขาว โดยล็อคตำแหน่งเอาไว้
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.255,
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
                  top: MediaQuery.of(context).size.height * 0.15,
                  left: (MediaQuery.of(context).size.width / 2) - 120 / 2,
                  child: CircularImage(
                    image: image,
                    width: 120,
                    height: 120,
                    isNetWorkImage: networkImage.isNotEmpty,
                  ),
                ),
                //ส่วนเเสดงปุ่มเเก้ไขโปรไฟล์ โดยล็อคตำแหน่งเอาไว้
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.275,
                  right: MediaQuery.of(context).size.width * 0.05,
                  child: InkWell(
                    onTap: () => Get.to(() => const EditProfile()),
                    child: Row(
                      children: [
                        Image.asset(
                          TImages.iconedit,
                          width: 18,
                          height: 18,
                          color: Ticolor.greenMain2,
                        ),
                        SizedBox(width: 1),
                        Text(
                          'แก้ไขโปรไฟล์',
                          style: TextStyle(
                              color: Ticolor.greenMain2,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
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
                    currentPage: 3,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
