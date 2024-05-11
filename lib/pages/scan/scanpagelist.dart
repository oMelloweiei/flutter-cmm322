import 'package:binny_application/pages/scan/detailscan.dart';
import 'package:binny_application/theme/Text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:binny_application/widgets/scanlist.dart';
import 'package:flutter/widgets.dart';
import 'package:binny_application/widgets/class/Image.dart';

class Widget130 extends StatelessWidget {
  final TextTheme textThemeThai;

  const Widget130({Key? key, required this.textThemeThai}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    List<ClassScanlist> listtrash = [
      ClassScanlist("8 851 9523 50161", "Crystal คริสตัล",
          "assets/scan/Scan_BARCODE10.webp"),
      ClassScanlist("1 111 6425 20001", "น้ำมันพืช มรกต",
          "assets/scan/Scan_BARCODE09.webp"),
      ClassScanlist("8 850 3600 33321", "Dettol Multi Surface",
          "assets/scan/Scan_BARCODE08.webp"),
      ClassScanlist("4 987 1766 00776", "วิคส์ วาโปรับ (Vicks VapoRub)",
          "assets/scan/Scan_BARCODE07.webp"),
      ClassScanlist('8 850 0922 80604', 'HYGIENE EXPERT CARE น้ำยาปรับผ้านุ่ม',
          "assets/scan/Scan_BARCODE06.webp"),
      ClassScanlist("4 987 1766 00776", "วิคส์ วาโปรับ (Vicks VapoRub)",
          "assets/scan/Scan_BARCODE07.webp"),
      ClassScanlist("4 987 1766 00776", "วิคส์ วาโปรับ (Vicks VapoRub)",
          "assets/scan/Scan_BARCODE07.webp"),
    ];
    return Container(
      width: size.width,
      height: size.height,
      child: ListView.separated(
        itemCount: listtrash.length,
        itemBuilder: (BuildContext context, int index) {
          ClassScanlist trash = listtrash[index];
          return ListTile(
            title: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailScan(
                                barcode: trash.tagnumber,
                                picture: trash.img,
                                name: trash.name)));
                  },
                  child: Container(
                      // decoration: const BoxDecoration(color: Colors.amber),
                      height: 140,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                margin:
                                    const EdgeInsets.fromLTRB(10.0, 0, 0, 0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                height: 130,
                                width: 130,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        20), // Adjust the radius as needed
                                    child: Image.asset(
                                      trash.img,
                                      fit: BoxFit.cover,
                                    ))),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 9.0, top: 9.0),
                              child: Container(
                                alignment: Alignment.centerLeft,
                                width: size.width - 200,
                                height: 140,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        textAlign: TextAlign.start,
                                        trash.tagnumber,
                                        style: textThemeThai.titleLarge!
                                            .copyWith(
                                                fontSize: 16,
                                                color: Colors.green,
                                                fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Text(trash.name,
                                          style: textThemeThai.titleLarge!
                                              .copyWith(
                                                  fontSize: 16,
                                                  color: Color.fromARGB(
                                                      255, 0, 0, 0),
                                                  fontWeight: FontWeight.w500)),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ])),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) =>
            const Divider(color: Color.fromARGB(255, 223, 223, 223)),
      ),
    );
  }
}
