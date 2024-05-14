import 'package:binny_application/pages/selltrash/widget_selltrash.dart';
import 'package:binny_application/widgets/appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:binny_application/theme/color.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class bkrccgroup extends StatefulWidget {
  late String shopName;
  late String shopPic;

  bkrccgroup({Key? key, required this.shopName, required this.shopPic})
      : super(key: key);

  @override
  State<bkrccgroup> createState() => _bkrccgroupState();
}

class _bkrccgroupState extends State<bkrccgroup> {
  List<String> _trashList = [
    'เพิ่มรายการ',
  ];

  void addToTrashList(String trashItem) {
    setState(() {
      _trashList.add(trashItem);
    });
  }

  void deleteTrashList(String trashItem) {
    setState(() {
      _trashList.remove(trashItem);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: whiteMain1,
      appBar: appBarSellpage(shopName: widget.shopName),
      body: Stack(alignment: Alignment.center, children: [
        SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Stack(
                  children: [
                    Image.asset(
                      widget.shopPic,
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width * 0.62,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width * 0.62,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.005, 1],
                          colors: [
                            Color.fromRGBO(0, 0, 0, 50),
                            Color.fromRGBO(0, 0, 0, 0),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 218,
                      left: 13,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                        color: blackMain2,
                        child: Text(
                          widget.shopName,
                          style: GoogleFonts.ibmPlexSansThai().copyWith(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Row(
              //   children: [
              //     Padding(
              //       padding: EdgeInsets.only(right: 2),
              //       child: Icon(
              //         Icons.swap_vert_rounded,
              //         color: greenMain3,
              //         size: 18,
              //       ),
              //     ),
              //     Text(
              //       "ราคารับซื้อขยะ",
              //       style: TextStyle(
              //         fontSize: 14.0,
              //         color: greenMain3,
              //         fontWeight: FontWeight.w600,
              //       ),
              //     ),
              //   ],
              // ),
              Padding(
                padding: EdgeInsets.only(left: 13, right: 13, top: 15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(right: 2),
                                child: Text(
                                  "เลือกประเภทขยะรีไซเคิล",
                                  style: GoogleFonts.ibmPlexSansThai().copyWith(
                                    fontSize: 18.0,
                                    color: blackMain2,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.info_outline_rounded,
                                color: blackMain2,
                                size: 18,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 2),
                          child: Icon(
                            Icons.swap_vert_rounded,
                            color: greenMain3,
                            size: 18,
                          ),
                        ),
                        Text(
                          "ราคารับซื้อขยะ",
                          style: GoogleFonts.ibmPlexSansThai().copyWith(
                            fontSize: 14.0,
                            color: greenMain3,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 13, right: 13, top: 5),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFFE2E2E2)),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _trashList.length,
                        itemBuilder: (context, index) {
                          return addTrashIcon(
                            types: _trashList[index],
                            onTap: addToTrashList,
                            deleteTrashList: deleteTrashList,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                width: size.width,
                height: size.height * 0.45,
                color: Colors.red,
                child: Sellform(type: _trashList),
              )
            ],
          ),
        ),
        Positioned(bottom: 0, child: nextButton(title: 'ถัดไป')),
      ]),
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
                  onTap: () => openList(context, onTap),
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
    BuildContext context, void Function(String) addToTrashList) async {
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
        child: selectionTrash(addToTrashList: addToTrashList),
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
  const selectionTrash({Key? key, required this.addToTrashList})
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
          child: TrashObject(types: trashTypes[index]),
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
