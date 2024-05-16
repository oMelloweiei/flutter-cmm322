import 'package:binny_application/data/models/shopModel.dart';
import 'package:binny_application/features/authentication/controllers/shop/shop_controller.dart';
import 'package:binny_application/pages/selltrash/sell.dart';
import 'package:binny_application/theme/color.dart';
import 'package:binny_application/widgets/appbar.dart';
import 'package:binny_application/widgets/class/Color.dart';
import 'package:binny_application/widgets/class/Image.dart';
import 'package:binny_application/widgets/loaders/snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

final controller = Get.put(ShopController());

class SellInfo extends StatelessWidget {
  final ShopModel shop;
  final String imageUrl;
  List<String> trashList;
  SellInfo(
      {Key? key,
      required this.shop,
      required this.imageUrl,
      required this.trashList}) {
    trashList.removeAt(0);
  }

  Future<String> getImage(String imgName) async {
    try {
      final imageUrl = await controller.getownerImageUrl(imgName);
      return imageUrl;
    } catch (e) {
      return '';
    }
  }

  // final ownerImg = await getImage(shop.ownerPic);

  String _getImageAsset(String type) {
    switch (type) {
      case 'ขวดน้ำใส PET':
        return 'assets/trash/trash_Recycle07.webp';
      case 'ขวดแก้ว':
        return 'assets/trash/trash_Recycle08.webp';
      case 'น้ำมันพืชใช้แล้ว':
        return 'assets/trash/trash_Recycle05.webp';
      case 'กระป๋องอะลูมิเนียม':
        return 'assets/trash/trash_Recycle10.webp';
      case 'พลาสติกแข็ง HDPE':
        return 'assets/trash/trash_Recycle04.webp';
      case 'อุปกรณ์อิเล็กทรอนิกส์':
        return 'assets/trash/trash_Recycle01.webp';
      case 'พลาสติก':
        return 'assets/trash/trash_Recycle03.webp';
      case 'กระดาษ':
        return 'assets/trash/trash_Recycle12.webp';
      case 'กล่องเครื่องดื่ม UHT':
        return 'assets/trash/trash_Recycle09.webp';
      case 'เสื้อผ้า':
        return 'assets/trash/trash_Recycle02.webp';
      case 'ถุงขนม/ซองกาแฟ':
        return 'assets/trash/trash_Recycle06.webp';
      case 'กระป๋อง เหล็ก สังกะสี ปิ๊ป':
        return 'assets/trash/trash_Recycle11.webp';
      default:
        return ''; // Return an empty string for unknown types
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Ticolor.whiteMain1,
      appBar: AppBar(
        centerTitle: false,
        leadingWidth: 10,
        backgroundColor: Ticolor.no,
        leading: SizedBox(),
        title: Image.asset(
          TImages.logoblack,
          fit: BoxFit.cover,
          height: 30,
          color: Colors.white,
        ),
        actions: [
          TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.white),
              onPressed: () {
                Get.offAll(SellPage());
                Loaders.warningSnackBar(
                    title: 'Cancel', message: 'Your order has been canceled.');
              },
              child: Text(
                'ยกเลิกคำสั่ง',
                style: TextStyle(
                  color: Color(0xFF232323),
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  letterSpacing: -0.40,
                ),
              )),
          SizedBox(width: 20)
        ],
      ),
      body: SingleChildScrollView(
          child: Stack(
        children: [
          Positioned(
              child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
            height: size.height * 0.35,
            width: size.width,
          )),
          // SellPanel(shop: shop, imageUrl: imageUrl)
          Positioned(
            left: 20,
            top: size.height * 0.22,
            child: Container(
              padding: EdgeInsets.all(5),
              color: Colors.black,
              child: Text(
                shop.shopname,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.40,
                ),
              ),
            ),
          ),
          Positioned(
            left: size.width * 0.05,
            top: size.height * 0.28,
            child: Container(
              // width: size.width * 0.8,
              padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 7),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1,
                    strokeAlign: BorderSide.strokeAlignOutside,
                    color: Color(0xFFE5E5E5),
                  ),
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      FaIcon(FontAwesomeIcons.calendarCheck,
                          size: 40, color: Color(0xFFE5E5E5)),
                      Text(
                        'ลงคิวรับขยะ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF232323),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.40,
                        ),
                      ),
                      Text(
                        '15 ก.พ. 67',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF232323),
                          fontSize: 10,
                          fontWeight: FontWeight.w300,
                          letterSpacing: -0.40,
                        ),
                      )
                    ],
                  ),
                  SizedBox(width: 5),
                  Container(width: 50, height: 3, color: Color(0xFFE5E5E5)),
                  SizedBox(width: 5),
                  Column(
                    children: [
                      FaIcon(FontAwesomeIcons.truckFast,
                          size: 40, color: Color(0xFFE5E5E5)),
                      Text(
                        'ลงคิวรับขยะ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF232323),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.40,
                        ),
                      ),
                      Text(
                        '15 ก.พ. 67',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF232323),
                          fontSize: 10,
                          fontWeight: FontWeight.w300,
                          letterSpacing: -0.40,
                        ),
                      )
                    ],
                  ),
                  SizedBox(width: 5),
                  Container(width: 50, height: 3, color: Color(0xFFE5E5E5)),
                  SizedBox(width: 5),
                  Column(
                    children: [
                      FaIcon(FontAwesomeIcons.faceSmile,
                          size: 40, color: Color(0xFFE5E5E5)),
                      Text(
                        'ลงคิวรับขยะ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF232323),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.40,
                        ),
                      ),
                      Text(
                        '15 ก.พ. 67',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF232323),
                          fontSize: 10,
                          fontWeight: FontWeight.w300,
                          letterSpacing: -0.40,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: size.height * 0.4),
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ผู้รับซื้อ',
                  style: TextStyle(
                    color: Color(0xFF232323),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignOutside,
                        color: Color(0xFFE5E5E5),
                      ),
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  child: FutureBuilder<String>(
                    future: getImage(shop.ownerPic),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        // While waiting for the image to load, you can display a placeholder
                        return CircularProgressIndicator(); // Placeholder widget
                      } else if (snapshot.hasError) {
                        // If there's an error loading the image, you can handle it here
                        return Text('Error loading image');
                      } else {
                        // If the image is loaded successfully, you can display it
                        final imageUrl = snapshot.data!;
                        final imageWidget = imageUrl.isNotEmpty
                            ? Image.network(
                                imageUrl,
                                fit: BoxFit.cover,
                                width: 100,
                                height: 100,
                              )
                            : Image.asset(
                                'assets/Wan.png', // Use a placeholder image
                                fit: BoxFit.cover,
                                width: 100,
                                height: 100,
                              );
                        return Row(
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: imageWidget),
                            SizedBox(width: 10),
                            Container(
                              width: 160,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    shop.ownerName,
                                    style: TextStyle(
                                      color: Color(0xFF232323),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: -0.40,
                                    ),
                                  ),
                                  Text(
                                    'สังกัด: ${shop.shopname}',
                                    style: TextStyle(
                                      color: Color(0xFF232323),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: -0.40,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'เบอร์ติดต่อ: ${shop.phone}',
                                    style: TextStyle(
                                      color: Color(0xFF232323),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: -0.40,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        );
                      }
                    },
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'รายการขายขยะ',
                  style: TextStyle(
                    color: Color(0xFF232323),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: trashList.map((entry) {
                    int index = trashList.indexOf(entry);
                    String imagePath = _getImageAsset(entry);
                    return Container(
                        width: size.width * 0.9,
                        margin: EdgeInsets.only(bottom: 20),
                        padding: EdgeInsets.all(10),
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1,
                              strokeAlign: BorderSide.strokeAlignOutside,
                              color: Color(0xFFE5E5E5),
                            ),
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  imagePath,
                                  fit: BoxFit.cover,
                                  width: 70,
                                  height: 70,
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                                flex: 7,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          entry,
                                          style: TextStyle(
                                            color: Color(0xFF232323),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: -0.40,
                                          ),
                                        ),
                                        Text(
                                          '10 kg',
                                          textAlign: TextAlign.end,
                                          style: TextStyle(
                                            color: Color(0xFF232323),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: -0.40,
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'ราคารับซื้อ',
                                          style: TextStyle(
                                            color: Color(0xFF232323),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: -0.40,
                                          ),
                                        ),
                                        Text(
                                          '฿100.00',
                                          textAlign: TextAlign.end,
                                          style: TextStyle(
                                            color: Color(0xFF232323),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            letterSpacing: -0.40,
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    Container(height: 1, color: Colors.black),
                                    SizedBox(height: 5),
                                    Text(
                                      'รับ Binny Point 2 แต้ม',
                                      style: TextStyle(
                                        color: Color(0xFF232323),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: -0.40,
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        ));
                  }).toList(),
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'รายรับทั้งหมด    ฿0',
                          style: TextStyle(
                            color: Color(0xFF232323),
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                            letterSpacing: -0.40,
                          ),
                        ),
                        SizedBox(
                          width: 164,
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'ได้รับ Binny Point',
                                  style: TextStyle(
                                    color: Color(0xFF232323),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                    letterSpacing: -0.40,
                                  ),
                                ),
                                TextSpan(
                                  text: ' 7 แต้ม',
                                  style: TextStyle(
                                    color: Color(0xFF232323),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: -0.40,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                SizedBox(
                    width: size.width * 0.9,
                    child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Color(0xFF02C275),
                        ),
                        onPressed: () {
                          Get.offAllNamed('/home');
                          Loaders.successSnackBar(
                              title: 'Thank you!',
                              message:
                                  'We have sent this infomation to the seller.');
                        },
                        child: Text(
                          'กลับหน้าหลัก',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            letterSpacing: -0.40,
                          ),
                        )))
              ],
            ),
          ),
        ],
      )),
    );
  }
}
