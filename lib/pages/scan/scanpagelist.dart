import 'package:binny_application/pages/scan/detailscan.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:binny_application/widgets/scanlist.dart';

class Widget130 extends StatelessWidget {
  const Widget130({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    List<ClassScanlist> listtrash = [
      ClassScanlist("1111", "object1", "assets/1.jpg"),
      ClassScanlist("2222", "object2", "assets/2.jpg"),
      ClassScanlist("3333", "object3", "assets/3.jpg"),
      ClassScanlist("4444", "object4", "assets/4.jpg")
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DetailScan()));
                  },
                  child: Container(
                      decoration: const BoxDecoration(),
                      height: 140,
                      child: Row(children: [
                        Container(
                            margin: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                color: Colors.lightBlue,
                                borderRadius: BorderRadius.circular(20)),
                            height: 130,
                            width: 110,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    20), // Adjust the radius as needed
                                child: Image.asset(
                                  trash.img,
                                  fit: BoxFit.cover,
                                ))),
                        Column(
                          children: [
                            Text(
                              trash.tagnumber,
                              style: const TextStyle(
                                  fontSize: 28,
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(trash.name,
                                style: const TextStyle(
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontWeight: FontWeight.bold))
                          ],
                        )
                      ])),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) =>
            const Divider(color: Color.fromARGB(255, 196, 191, 191)),
      ),
    );
  }
}
