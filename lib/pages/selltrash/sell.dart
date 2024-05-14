import 'package:binny_application/pages/map_screen.dart';
import 'package:binny_application/pages/selltrash/bkrccgroup.dart';
import 'package:binny_application/widgets/class/Image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:binny_application/pages/selltrash/bkrccgroup.dart';
import 'package:binny_application/widgets/class/Color.dart';

var topics = [
  {'topic': 'ร้านรับซื้อใกล้ฉัน', 'icon': Icons.near_me_outlined, 'init': true},
  {'topic': 'ตำแหน่งของฉัน', 'icon': Icons.place, 'init': false},
];

var stores = [
  {
    'name': 'BK Recycle Group',
    'image': 'assets/shop/SHOP_01.webp',
    'price': 10,
    'distance': 0.5,
  },
  {
    'name': 'ร้านล้อชัยเส็จ (รับซื้อขยะรีไซเคิ้ล)',
    'image': 'assets/shop/SHOP_02.webp',
    'price': 30,
    'distance': 1.0,
  },
  {
    'name': 'วิชิต รับซื้อและประมูลของเก่า',
    'image': 'assets/shop/SHOP_03.webp',
    'price': 33,
    'distance': 1.2,
  },
  {
    'name': 'ร้านรับซื้อของเก่า สาธุประดิษฐ์(ตั้งเจริญ)',
    'image': 'assets/shop/SHOP_04.webp',
    'price': 35,
    'distance': 1.4,
  },
  {
    'name':
        'รับซื้อของเก่า(ร้านสีเชียงโค้งวัดช่องนนทรี) ของรีไซเคิ้ล ให้ราคาสูง',
    'image': 'assets/shop/SHOP_05.webp',
    'price': 40,
    'distance': 2.0,
  },
  {
    'name': 'แจ่มใสรีไซเคิล สาขา2 รับของเก่าทุกชนิด',
    'image': 'assets/shop/SHOP_06.webp',
    'price': 40,
    'distance': 2.0,
  },
];

class SellPage extends StatelessWidget {
  SellPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Ticolor.whiteMain2,
      appBar: AppBar(
        backgroundColor: Ticolor.no,
        title: Image.asset(
          TImages.logoblack,
          fit: BoxFit.cover,
          height: 30,
        ),
        actions: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: IconButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => History()),
                    // );
                  },
                  icon: Icon(
                    Icons.history_rounded,
                    size: 35,
                  ))),
          Padding(
              padding: EdgeInsets.only(right: 20),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    size: 35,
                  ))),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: topics.map((topic) {
                return myButton(context, topic['topic'] as String,
                    Icon(topic['icon'] as IconData), topic['init'] as bool);
              }).toList(),
            ),
          ),
          Expanded(
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 7),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Ticolor.whiteMain1,
                  boxShadow: [
                    BoxShadow(
                      color: Ticolor.blackSup1.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: ListView.builder(
                  itemCount: stores.length,
                  itemBuilder: (context, index) {
                    var store = stores[index];
                    return GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => Store()),
                          // );
                        },
                        child: Padding(
                          padding:
                              EdgeInsets.only(left: 8, right: 8, bottom: 4),
                          child: Column(children: [
                            _storeContainer(store, context),
                            Divider(
                              thickness: 1,
                              color: Ticolor.blackSup1.withOpacity(0.3),
                            )
                          ]),
                        ));
                  },
                )),
          ),
        ],
      ),
    );
  }

  Widget myButton(BuildContext context, String topic, Icon icon, bool init) {
    return SizedBox(
        // width: MediaQuery.of(context).size.width * 0.5,
        child: TextButton(
            onPressed: () {
              if (init != true) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MapScreen()),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              elevation: 0,
              backgroundColor: init ? Ticolor.greenMain3 : Ticolor.whiteMain1,
              foregroundColor: init ? Ticolor.whiteMain1 : Ticolor.greenMain3,
              side: BorderSide(color: Ticolor.greenMain3, width: 1),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  icon.icon,
                  size: 20, // Set the size of the icon here
                ),
                SizedBox(width: 5),
                Text(
                  topic,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            )));
  }

  Widget _storeContainer(var store, BuildContext context) {
    int price = store['price'];
    double distance = store['distance'];
    String storeName = store['name'];
    String storePic = store['image'];
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => bkrccgroup(
                      shopName: storeName,
                      shopPic: storePic,
                    )));
      },
      child: Container(
        padding: EdgeInsets.all(6),
        color: Ticolor.no,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              child: Image.asset(
                store['image'],
                fit: BoxFit.cover,
                width: 130,
                height: 130,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
                child: Container(
                    height: 130,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  child: Text(
                                store['name'],
                                softWrap: true,
                                maxLines: 3,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                              SizedBox(height: 5),
                              _detail(price, distance),
                            ]),
                        Row(
                          children: [
                            Icon(
                              Icons.swap_vert_rounded,
                              size: 20,
                              color: Ticolor.greenMain3,
                              weight: 600,
                            ),
                            SizedBox(width: 2),
                            Text(
                              'ราคารับซื้อขยะ',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Ticolor.greenMain3,
                              ),
                            )
                          ],
                        )
                      ],
                    )))
          ],
        ),
      ),
    );
  }

  Widget _detail(int price, double distance) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Ticolor.greenMain3,
          ),
          child: Text(
            '${price} ฿',
            style: TextStyle(
                color: Ticolor.whiteMain1,
                fontSize: 12,
                fontWeight: FontWeight.w400),
          ),
        ),
        SizedBox(width: 10),
        Container(
          height: 20,
          width: 1,
          color: Ticolor.blackSup1,
        ),
        SizedBox(width: 10),
        Text(
          '${distance} km',
          style: TextStyle(fontSize: 10),
        )
      ],
    );
  }
}
