import 'dart:convert';

import 'package:binny_application/data/models/shopModel.dart';
import 'package:binny_application/data/models/userModel.dart';
import 'package:binny_application/features/personalization/controllers/user_controller.dart';
import 'package:binny_application/theme/color.dart';
import 'package:binny_application/widgets/user.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

List<String> _kg = [
  '',
];

class nextButton extends StatefulWidget {
  final String title;
  final Widget link;
  nextButton({super.key, required this.title, required this.link});

  @override
  State<nextButton> createState() => _nextButtonState();
}

class _nextButtonState extends State<nextButton> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(greenSub),
            fixedSize: MaterialStateProperty.all(Size(size.width - 20, 60))),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: ((context) => widget.link)));
        },
        child: Text(
          widget.title,
          style: GoogleFonts.ibmPlexSansThai().copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              letterSpacing: -0.4,
              color: Colors.white),
        ));
  }
}

class Sellform extends StatefulWidget {
  final List<String> type;
  const Sellform({Key? key, required this.type}) : super(key: key);

  @override
  State<Sellform> createState() => _SellformState();
}

class _SellformState extends State<Sellform> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: widget.type.skip(1).map((type) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    type,
                    style: GoogleFonts.ibmPlexSansThai().copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: -0.4,
                    ),
                  ),
                  Text(
                    'ราคา/กก. 5 บาท',
                    style: GoogleFonts.ibmPlexSansThai().copyWith(
                      color: Colors.grey,
                      letterSpacing: -0.4,
                    ),
                  ),
                ],
              ),
              Divider(),
              Form(
                child: Row(
                  children: [
                    Text('น้ำหนัก'),
                    SizedBox(width: 10),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 0.1,
                      width: MediaQuery.of(context).size.width * 0.12,
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 5),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text('kg'),
                  ],
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        );
      }).toList(),
    );
  }
}

void submit(BuildContext context) {
  Navigator.of(context).pop();
}

// Add Icon in listview
class addTrashIcon extends StatelessWidget {
  final String types;
  final Function(String) onTap;
  final Function(String) deleteTrashList;

  addTrashIcon({
    required this.types,
    required this.onTap, // Accept onTap function as a parameter
    required this.deleteTrashList,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          types == 'เพิ่มรายการ'
              ? GestureDetector(
                  onTap: () => openList(context, onTap, deleteTrashList),
                  child: button(
                    types: types,
                    deleteTrashList: deleteTrashList,
                  ),
                )
              : button(
                  types: types,
                  deleteTrashList: deleteTrashList,
                ),
          Text(
            types,
            style: TextStyle(
              color: greenMain3,
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> openList(
    BuildContext context,
    void Function(String) addToTrashList,
    void Function(String) deleteTrashList) async {
  final size = MediaQuery.of(context).size;
  showDialog(
    barrierDismissible: true,
    barrierColor: Colors.black.withOpacity(0.5),
    context: context,
    builder: (context) => AlertDialog(
      actions: [
        IconButton(
          onPressed: () => submit(context),
          icon: Icon(Icons.check),
        )
      ],
      title: Center(
        child: Text(
          'เลือกประเภทขยะรีไซเคิล',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w900,
            letterSpacing: -0.7,
          ),
        ),
      ),
      contentPadding: EdgeInsets.all(4.0),
      content: Container(
        width: size.width,
        height: 450,
        child: selectionTrash(
          addToTrashList: addToTrashList,
          deleteTrashList: deleteTrashList,
        ),
      ),
    ),
  );
}

class button extends StatelessWidget {
  final Function(String) deleteTrashList;
  final String types;
  button({Key? key, required this.types, required this.deleteTrashList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        border: Border.all(
          color: types == 'เพิ่มรายการ' ? greenMain3 : Colors.grey,
          width: 2,
        ),
      ),
      width: 100,
      height: 100,
      child: types == 'เพิ่มรายการ'
          ? Icon(
              Icons.add_outlined,
              color: greenMain3,
            )
          : GestureDetector(
              onTap: () => deleteTrashList(types),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Image.asset(
                    _getImageAsset(types),
                  ),
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

class selectionTrash extends StatefulWidget {
  final void Function(String)
      addToTrashList; // Function to add item to _trashList
  final void Function(String) deleteTrashList;
  const selectionTrash(
      {Key? key, required this.addToTrashList, required this.deleteTrashList})
      : super(key: key);

  @override
  State<selectionTrash> createState() => _selectionTrashState();
}

class _selectionTrashState extends State<selectionTrash> {
  List<String> trashTypes = [
    'ขวดน้ำใส PET',
    'ขวดแก้ว',
    'น้ำมันพืชใช้แล้ว',
    'กระป๋องอะลูมิเนียม',
    'พลาสติกแข็ง HDPE',
    'อุปกรณ์อิเล็กทรอนิกส์',
    'พลาสติก',
    'กระดาษ',
    'กล่องเครื่องดื่ม UHT',
    'เสื้อผ้า',
    'ถุงขนม/ซองกาแฟ',
    'กระป๋อง เหล็ก สังกะสี ปิ๊ป',
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: trashTypes.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            widget.addToTrashList(trashTypes[index]);
          },
          child: TrashObject(
            types: trashTypes[index],
          ),
        );
      },
    );
  }
}

class TrashObject extends StatelessWidget {
  final String types;
  TrashObject({required this.types});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Column(
        children: [
          Container(
            width: 900,
            height: 100,
            child: Stack(alignment: Alignment.bottomCenter, children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              Container(
                width: 100,
                height: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Image.asset(_getImageAsset(types)),
                  ),
                ),
              ),
              Container(
                height: 40,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
                ),
                child: Text(
                  types,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.ibmPlexSansThai(),
                  maxLines: 2,
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

//////////////////////////////////////////////////////////////////////////////////////
//Mark page//
//////////////////////////////////////////////////////////////////////////////////////

class Jadewidget extends StatefulWidget {
  final String jsonString;
  Jadewidget({
    super.key,
    required this.jsonString,
  });

  @override
  State<Jadewidget> createState() => _JadewidgetState();
}

class _JadewidgetState extends State<Jadewidget> {
  String _name = '';
  String _number = '';
  @override
  void initState() {
    super.initState();
    // Extract name from jsonString when page initializes
    _extractName();
  }

  void _extractName() {
    if (widget.jsonString.isEmpty) {
      return;
    }
    try {
      final Map<String, dynamic> jsonMap = jsonDecode(widget.jsonString);
      _name = jsonMap['name'] ?? '';
    } catch (e) {
      print('Error extracting name: $e');
    }
  }

  void _extractNumber() {
    if (widget.jsonString.isEmpty) {
      return;
    }
    try {
      final Map<String, dynamic> jsonMap = jsonDecode(widget.jsonString);
      _number = jsonMap['number'] ?? '';
    } catch (e) {
      print('Error extracting name: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          decoration: BoxDecoration(),
          child: Column(children: [
            Container(
                margin: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(children: [
                  Container(
                    decoration: BoxDecoration(),
                    width: 340,
                    child: Column(children: [
                      Container(
                        decoration: const BoxDecoration(),
                        height: 50,
                        width: 320,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("  ประเภทขยะรีไซเคิล",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                              // jade ปุ่มมุงอยู่นี้นะ
                              Container(
                                margin: const EdgeInsets.all(4),
                                decoration: BoxDecoration(),
                                child: const Row(
                                  children: [Icon(Icons.edit), Text("แก้ไข")],
                                ),
                              ),
                            ]),
                      ),
                      ////list list
                      Container(
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 77, 218, 89)),
                        height: 50,
                        width: 320,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 163, 46, 181)),
                        height: 50,
                        width: 320,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 77, 218, 89)),
                        height: 50,
                        width: 320,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 163, 46, 181)),
                        height: 50,
                        width: 320,
                      ),

                      ////listview listkind
                    ]),
                  ),

                  //// divider----------------------------------
                  ///
                  ///
                  ///
                  Divider(
                    indent: 20,
                    endIndent: 20,
                  ),

                  ///
                  ///
                  ///
                  ///
                  ///
                  Container(
                    height: 220,
                    width: 320,
                    child: Column(children: [
                      Container(
                        decoration: const BoxDecoration(),
                        height: 30,
                        child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("  รายละเอียดผู้ส่ง",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                            ]),
                      ),
                      const ListTile(
                        leading: Icon(
                          Icons.location_pin,
                          color: greenMain2,
                          size: 30,
                        ),
                        title: Text(
                          "668/222 การินรูหนู ถนน เสื่อมโทรม",
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.man,
                          color: greenMain2,
                          size: 30,
                        ),
                        title: Text(_name,
                            style:
                                TextStyle(fontSize: 14, color: Colors.black)),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.phone,
                          color: greenMain2,
                          size: 30,
                        ),
                        title: Text(_number,
                            style:
                                TextStyle(fontSize: 14, color: Colors.black)),
                      )
                      ////listview listkind
                      ///
                      ///new text info
                      ///
                    ]),
                  )
                ])),
            /////   container ก้อนใหญ่ อันล่าง
            Container(
              width: 340,
              margin: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    height: 30,
                    width: 300,
                    decoration: BoxDecoration(),
                    child: const Text("  ทั้งหมด",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                      alignment: Alignment.centerLeft,
                      height: 30,
                      width: 300,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255)),
                      child: (const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("  ค่าบริการ",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.normal)),
                          Text(
                            "฿20",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          )
                        ],
                      ))),
                  /////////----------------------------------------
                  const Divider(
                    indent: 20,
                    endIndent: 20,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    height: 30,
                    width: 300,
                    decoration: BoxDecoration(),
                    child: const Text("  ชำระเงินโดย",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                      alignment: Alignment.centerLeft,
                      height: 30,
                      width: 300,
                      decoration: BoxDecoration(),
                      child: (const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("  เงินสด/ชำระเงินปลายทาง",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.normal)),
                          Icon(Icons.arrow_right)
                        ],
                      ))),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            )
          ])),
    );
  }
}
