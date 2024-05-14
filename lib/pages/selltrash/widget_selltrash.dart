import 'dart:ui' as ui;

import 'package:binny_application/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    // Assuming you want to display the first type in the list

    return ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.vertical,
        itemCount: widget.type.length - 1,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            widget.type[index + 1],
                            style: GoogleFonts.ibmPlexSansThai().copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              letterSpacing: -0.4,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'ราคา/กก. 5 บาท',
                            style: GoogleFonts.ibmPlexSansThai().copyWith(
                              color: Colors.grey,
                              letterSpacing: -0.4,
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                      child: Divider(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10.0, bottom: 10),
                              child: Text(
                                'น้ำหนัก',
                                style: GoogleFonts.ibmPlexSansThai().copyWith(
                                    fontSize: 15, fontWeight: FontWeight.w700),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, bottom: 8.0),
                              child: Form(
                                  autovalidateMode: AutovalidateMode.always,
                                  onChanged: () {
                                    Form.of(primaryFocus!.context!).save();
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(color: Colors.grey)),
                                    height: 35,
                                    width: 60,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 8.0),
                                      child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        textAlign: ui.TextAlign.center,
                                        style: GoogleFonts.ibmPlexSansThai()
                                            .copyWith(
                                          fontSize: 12,
                                        ),
                                        onSaved: (String? value) {
                                          if (value != null) {
                                            _kg[index] = value;
                                          }
                                        },
                                      ),
                                    ),
                                  )),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10.0, bottom: 10),
                              child: Text(
                                'kg',
                                style: GoogleFonts.ibmPlexSansThai().copyWith(
                                    fontSize: 15, fontWeight: FontWeight.w700),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(right: 10.0, bottom: 10),
                          child: Text(
                            'ภาพขยะของฉัน',
                            style: GoogleFonts.ibmPlexSansThai().copyWith(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: greenMain2),
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
          );
        });
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
