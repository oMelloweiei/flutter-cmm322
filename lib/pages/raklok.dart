import 'package:binny_application/theme/color.dart';
import 'package:binny_application/widgets/class/Image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RaklokPage extends StatefulWidget {
  const RaklokPage({super.key});

  @override
  State<RaklokPage> createState() => _RaklokPageState();
}

class Trashh {
  final String text;
  final String asset;

  Trashh(this.text, this.asset);
}

List<Trashh> trashie = [
  Trashh('แยกชิ้นส่วนคอมขาย', 'assets/slidepic-18.png'),
  Trashh('แชร์วิธีจัดการเศษอาหาร', 'assets/slidepic-17.png'),
  Trashh('ชวนเก็บขยะริมทะเล', 'assets/slidepic-16.png'),
  Trashh('บางมด...มาแยกขยะ', 'assets/slidepic-15.png'),
  Trashh('บางมด...มาแยกขยะ', 'assets/slidepic-11.png'),
  Trashh('ชวนเก็บขยะริมทะเล', 'assets/slidepic-12.png'),
  Trashh('แชร์วิธีจัดการเศษอาหาร', 'assets/slidepic-13.png'),
  Trashh('แยกชิ้นส่วนคอมขาย', 'assets/slidepic-14.png'),
];

class Trash {
  final String name;
  final String image;

  Trash(this.name, this.image);
}

List<Trash> trashy = [
  Trash('บางมด...มาแยกขยะ', 'assets/slidepic-11.png'),
  Trash('ชวนเก็บขยะริมทะเล', 'assets/slidepic-12.png'),
  Trash('แชร์วิธีจัดการเศษอาหาร', 'assets/slidepic-13.png'),
  Trash('แยกชิ้นส่วนคอมขาย', 'assets/slidepic-14.png'),
  Trash('บางมด...มาแยกขยะ', 'assets/slidepic-15.png'),
  Trash('ชวนเก็บขยะริมทะเล', 'assets/slidepic-16.png'),
  Trash('แชร์วิธีจัดการเศษอาหาร', 'assets/slidepic-17.png'),
  Trash('แยกชิ้นส่วนคอมขาย', 'assets/slidepic-18.png'),
];

class _RaklokPageState extends State<RaklokPage> with TickerProviderStateMixin {
  TabController? tabController;
  final List<bool> _favoritesTab1 = List<bool>.filled(8, false);
  final List<bool> _favoritesTab2 = List<bool>.filled(8, false);
  late final PageController pageController;
  ScrollController _scrollController = ScrollController();
  int pageNo = 0;

  Map<String, bool> contentsState = {};

  void onPressed(String buttonText) {
    setState(() {
      contentsState.updateAll((key, value) => value = false);
      contentsState[buttonText] = true;
    });

    void initState() {
      super.initState();
      tabController = TabController(length: 2, vsync: this);
    }

    void dispose() {
      tabController?.dispose();
      pageController.dispose();
      super.dispose();
    }
  }

  bool showBtmAppBr = true;

  // Container(
  //                 padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
  //                 child: Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: [
  //                     Row(
  //                       children: [
  //                         const Padding(
  //                           padding: EdgeInsets.only(right: 7),
  //                           child: Icon(
  //                             Icons.arrow_back_ios_new_rounded,
  //                             color: Color(0xFF242424),
  //                             size: 28,
  //                           ),
  //                         ),
  //                         Image.asset(TImages.binny_White,
  //                             color: Colors.black, fit: BoxFit.cover, width: 75)
  //                       ],
  //                     ),
  //                     const Row(
  //                       children: [
  //                         Padding(
  //                           padding: EdgeInsets.only(right: 7),
  //                           child: Icon(
  //                             Icons.favorite_border_rounded,
  //                             color: Color(0xFF242424),
  //                             size: 35,
  //                           ),
  //                         ),
  //                         Icon(
  //                           Icons.calendar_month_sharp,
  //                           color: Color(0xFF242424),
  //                           size: 35,
  //                         ),
  //                       ],
  //                     ),
  //                   ],
  //                 )),

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: whiteMain1,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding:
                    const EdgeInsets.symmetric(horizontal: 21, vertical: 20),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "รักษ์โลก",
                      style: TextStyle(
                        fontSize: 40.0,
                        color: greenMain3,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      "คอมมูนิตี้",
                      style: TextStyle(
                        fontSize: 30.0,
                        color: blackMain2,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 45,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFE2E2E2)),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 3,
                      child: TabBar(
                        tabAlignment: TabAlignment.start,
                        controller: tabController,
                        isScrollable: true,
                        labelColor: greenMain3,
                        unselectedLabelColor: blackMain3,
                        indicatorColor: greenMain3,
                        tabs: [
                          Tab(text: "สำหรับฉัน"),
                          Tab(text: "ยอดฮิต"),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Text(
                          "ดูทั้งหมด",
                          style: TextStyle(
                            fontSize: 12.0,
                            decoration: TextDecoration.underline,
                            decorationThickness: 2.0,
                            decorationColor: greenMain3,
                            color: greenMain3,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10.0),
                width: double.maxFinite,
                height: 150,
                child: TabBarView(
                  controller: tabController,
                  children: [
                    ListView.builder(
                      itemCount: 8,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) {
                        return Container(
                          height: 145,
                          width: 125,
                          margin: const EdgeInsets.only(left: 10),
                          child: Stack(
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Container(
                                    height: 125,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      image: DecorationImage(
                                        image: AssetImage(trashy[index].image),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      width: double.infinity,
                                      alignment: Alignment.centerLeft,
                                      padding: EdgeInsets.only(top: 3),
                                      child: Text(
                                        trashy[index].name,
                                        style: TextStyle(
                                          color: blackMain3,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Positioned(
                                top: 8,
                                right: 10,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _favoritesTab1[index] =
                                          !_favoritesTab1[index];
                                    });
                                  },
                                  child: Icon(
                                    _favoritesTab1[index]
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: _favoritesTab1[index]
                                        ? Colors.red
                                        : Colors.white,
                                    size: 22.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    ListView.builder(
                      itemCount: 8,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) {
                        return Container(
                          height: 145,
                          width: 125,
                          margin: const EdgeInsets.only(left: 10),
                          child: Stack(
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Container(
                                    height: 125,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      image: DecorationImage(
                                        image: AssetImage(trashie[index].asset),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      width: double.infinity,
                                      alignment: Alignment.centerLeft,
                                      padding: EdgeInsets.only(top: 3),
                                      child: Text(
                                        trashie[index].text,
                                        style: TextStyle(
                                          color: blackMain3,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Positioned(
                                top: 8,
                                right: 10,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _favoritesTab2[index] =
                                          !_favoritesTab2[index];
                                    });
                                  },
                                  child: Icon(
                                    _favoritesTab2[index]
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: _favoritesTab2[index]
                                        ? Colors.red
                                        : Colors.white,
                                    size: 22.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
              Positioned(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(0.5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "   กิจกรรมน่าสนใจ",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Container(
                                alignment: Alignment.centerRight,
                                padding: const EdgeInsets.only(right: 20.0),
                                child: Text(
                                  "ดูทั้งหมด",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    decoration: TextDecoration.underline,
                                    decorationThickness: 2.0,
                                    decorationColor: greenMain3,
                                    color: greenMain3,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: List.generate(
                          5,
                          (index) => GestureDetector(
                            child: Container(
                              margin: const EdgeInsets.all(0.5),
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: GridB(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FabExt extends StatelessWidget {
  const FabExt({
    Key? key,
    required this.showFabTitle,
  }) : super(key: key);

  final bool showFabTitle;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {},
      label: AnimatedContainer(
        duration: const Duration(seconds: 2),
        padding: const EdgeInsets.all(12.0),
      ),
    );
  }
}

class GridB extends StatefulWidget {
  const GridB({Key? key}) : super(key: key);

  @override
  State<GridB> createState() => _GridBState();
}

class _GridBState extends State<GridB> {
  final List<Map<String, dynamic>> gridMap = [
    {
      "title": "บางขยะ x ขยะกำพร้าสัญจร ม.เกษตร |",
      "text":
          "เชิญชวนเพื่อนๆมาส่งขยะกำพร้าที่ ม.เกษตร หรือมาเป็นอาสาสมัครเรียนรู้การแยกขยะกันครับ",
      "images": "assets/images/pic1.jpg",
      "date": "10 มี.ค. 2567",
      "time": "09:00-12:00",
      "location": "เกษตร บางเขน",
    },
    {
      "title": "Recycling The Sea by JORAKAY |",
      "text":
          "ทะเลไทยมีความสวยงามดึงดูดนักท่องเที่ยวทั้งในและนอกประเทศให้แวะเวียนมาชื่นชมความงามอย่างไม่ขาดสาย รวมไปถึงการทำประมงที่เป็นอาชีพและวิถีชีวิตของชาว...",
      "images": "assets/images/pic2.jpg",
      "date": "15 มี.ค. 2567",
      "time": "10:30-12:00",
      "location": "หาดทุ่งวัวแล่น",
    },
    {
      "title": "นัดเก็บขยะริมหาดบางแสน |",
      "text":
          "เชิญชวนมารวมช่วยกันรักษาหาดทรายแสนสวยให้รอดพ้นจากขยะเพื่อสร้างภูมิทัศน์ที่สวยงาม พร้อมดื่มด่ำบรรยากาศยามเช้าริมชายหาดบางแสน ภายในกิจกรรมจะมี...",
      "images": "assets/images/pic3.jpg",
      "date": "21 มี.ค. 2567",
      "time": "06:30-08:00",
      "location": "หาดบางแสน",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        crossAxisSpacing: 20.0,
        mainAxisSpacing: 1.0,
        mainAxisExtent: 260,
      ),
      itemCount: gridMap.length,
      itemBuilder: (_, index) {
        return Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                color: Color(0xFF232323),
              ),
              height: 250,
            ),
            Positioned(
                child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
              child: Image.asset(
                fit: BoxFit.cover,
                width: 400,
                height: 128,
                "${gridMap.elementAt(index)['images']}",
              ),
            )),
            Positioned(
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 3, horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(13)),
                      color: Color(0xFF242424),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          CupertinoIcons.heart_fill,
                          color: Color(0xFF02C275),
                          size: 15,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          '30 คน',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 3, horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(13)),
                      color: Color(0xFF242424),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          CupertinoIcons.location_solid,
                          color: Colors.white,
                          size: 15,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          "${gridMap.elementAt(index)['location']}",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        )
                      ],
                    ),
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.end,
              ),
              left: 7,
              right: 7,
              top: 7,
            ),
            Positioned(
                top: 118,
                left: 13,
                child: Container(
                  color: Colors.white,
                  child: Text("${gridMap.elementAt(index)['date']}"),
                )),
            Positioned(
                top: 140,
                left: 13,
                right: 10,
                bottom: 10,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "${gridMap.elementAt(index)['title']}",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 14),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Icon(
                          CupertinoIcons.clock,
                          color: Colors.white,
                          size: 15,
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Text(
                          "${gridMap.elementAt(index)['time']}",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                    Text(
                      "${gridMap.elementAt(index)['text']}",
                      style: TextStyle(color: Colors.white, fontSize: 10),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    OverflowBar(
                      alignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Color(0XFF02C275),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 0)),
                            child: Text('เข้าร่วม')),
                        SizedBox(
                          width: 5,
                        ),
                        TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                                foregroundColor: Color(0xFF02C275),
                                side: BorderSide(color: Color(0xFF02C275)),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 0)),
                            child: Text('สนใจ')),
                      ],
                    )
                  ],
                ))
          ],
        );
      },
    );
  }
}
