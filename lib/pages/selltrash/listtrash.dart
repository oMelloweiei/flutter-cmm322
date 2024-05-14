import 'dart:ui';

import 'package:binny_application/pages/selltrash/bkrccgroup.dart';
import 'package:binny_application/theme/Text.dart';
import 'package:binny_application/widgets/class/Color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:binny_application/theme/color.dart';
import 'package:flutter/widgets.dart';

class addTrashIcon extends StatelessWidget {
  final String types;
  final Function(List<String>) updateList;
  List<String> addList = [
    'เพิ่มรายการ',
  ];

  var kind = (
    {
      'type': 'ขวดน้ำใส PET',
      'image': 'assets/trash/trash_Recycle07.webp',
    }, //1

    {
      'type': 'ขวดแก้ว',
      'image': 'assets/trash/trash_Recycle08.webp',
    }, //2

    {
      'type': 'น้ำมันพืชใช้แล้ว',
      'image': 'assets/trash/trash_Recycle05.webp',
    }, //3

    {
      'type': 'กระป๋องอะลูมิเนียม',
      'image': 'assets/trash/trash_Recycle10.webp',
    }, //4

    {
      'type': 'พลาสติกแข็ง HDPE',
      'image': 'assets/trash/trash_Recycle04.webp',
    }, //5

    {
      'type': 'อุปกรณ์อิเล็กทรอนิกส์',
      'image': 'assets/trash/trash_Recycle01.webp',
    }, //6

    {
      'type': 'พลาสติก',
      'image': 'assets/trash/trash_Recycle03.webp',
    }, //7

    {
      'type': 'กระดาษ',
      'image': 'assets/trash/trash_Recycle12.webp',
    }, //8

    {
      'type': 'กล่องเครื่องดื่ม UHT',
      'image': 'assets/trash/trash_Recycle09.webp',
    }, //9

    {
      'type': 'เสื้อผ้า',
      'image': 'assets/trash/trash_Recycle02.webp',
    }, //10

    {
      'type': 'ถุงขนม/ซองกาแฟ',
      'image': 'assets/trash/trash_Recycle06.webp',
    }, //11

    {
      'type': 'กระป๋อง เหล็ก สังกะสี ปิ๊ป',
      'image': 'assets/trash/trash_Recycle11.webp',
    }, //12
  );

  addTrashIcon({
    required this.types,
    required this.updateList,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    TextTheme textThemeThai = buildTextTHI(Theme.of(context).textTheme);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          types == 'เพิ่มรายการ'
              ? GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              actions: [
                                IconButton(
                                    onPressed: () {
                                      Navigator.pop(
                                        context,
                                      );
                                      updateList(addList);
                                    },
                                    icon: Icon(Icons.check))
                              ],
                              title: Center(
                                child: Text(
                                  'เลือกประเภทขยะรีไซเคิล',
                                  style: textThemeThai.titleLarge!.copyWith(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900,
                                      letterSpacing: -0.7),
                                ),
                              ),
                              contentPadding: EdgeInsets.all(4.0),
                              content: Container(
                                width: size.width,
                                height: 500,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        select(types: 'ขวดน้ำใส PET'),
                                        select(types: 'ขวดแก้ว'),
                                        select(types: 'น้ำมันพืชใช้แล้ว'),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        select(types: 'กระป๋องอะลูมิเนียม'),
                                        select(types: 'พลาสติกแข็ง HDPE'),
                                        select(types: 'อุปกรณ์อิเล็กทรอนิกส์'),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        select(types: 'พลาสติก'),
                                        select(types: 'กระดาษ'),
                                        select(types: 'กล่องเครื่องดื่ม UHT'),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        select(types: 'เสื้อผ้า'),
                                        select(types: 'ถุงขนม/ซองกาแฟ'),
                                        select(
                                            types: 'กระป๋อง เหล็ก สังกะสี ปิ๊ป')
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ));
                  },
                  child: button(types: types))
              : button(types: types),
          Text(
            types,
            style: TextStyle(
                color: Ticolor.greenMain3,
                fontSize: 10,
                fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}

class button extends StatelessWidget {
  final String types;
  button({super.key, required this.types});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        border: Border.all(
            color:
                types == 'เพิ่มรายการ' ? Ticolor.greenMain3 : Ticolor.blackSup1,
            width: 2),
      ),
      width: 100,
      height: 100,
      child: types == 'เพิ่มรายการ'
          ? Icon(
              Icons.add_outlined,
              color: Ticolor.greenMain3,
            )
          : ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: FittedBox(
                fit: BoxFit.cover,
                child: Image.asset(
                  _getImageAsset(types),
                ),
              ),
            ),
    );
  }
}

//assets
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

//select trash here
class select extends StatefulWidget {
  final String types;
  select({
    super.key,
    required this.types,
  });

  @override
  State<select> createState() => _selectState();
}

class _selectState extends State<select> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
        updateList(widget.types);
      },
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          width: 100,
          height: 100,
          child: Stack(alignment: Alignment.center, children: [
            Container(
              width: 100,
              height: 100,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: FittedBox(
                      fit: BoxFit.cover,
                      child: Image.asset(_getImageAsset(widget.types)))),
            ),
            Visibility(
              visible: isSelected,
              child: Container(
                color: Ticolor.addon8,
              ),
            ),
            Visibility(
                visible: isSelected,
                child: Container(
                  child: Icon(
                    Icons.check,
                    size: 50,
                    color: Ticolor.whiteMain1,
                  ),
                ))
          ] //stack Chirdren

              ),
        ),
      ),
    );
  }
}

class updateList {
  List<String> _newlist = [];
  late String types;

  updateList(this.types);

  void update(String newType) {
    types = newType;
    _newlist.add(newType);
    print(_newlist);
  }
}
