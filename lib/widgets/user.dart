import 'package:binny_application/features/personalization/controllers/user_controller.dart';
import 'package:binny_application/widgets/class/Image.dart';
import 'package:binny_application/widgets/loaders/shimmer_eff.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:binny_application/widgets/class/Color.dart';
// ข้อมูล uesr
List<Map<String, dynamic>> userData = [
  {
    "Username": "Binny Bun",
    "name_key": "@binny.bin",
    "following": 15,
    "follower": 4,
    "stat": 386,
    "percent": "+2.4%",
    "BarPET": 68,
    "BarALU": 120,
    "BarUHT": 48,
    "BarOIL": 150,
    "PET": "68kg",
    "Aluminium": "120kg",
    "UHT": "48kg",
    "Oil": "150kg"
  },
  {
    "Username": "TEST",
    "name_key": "@TEST.bin",
    "following": 99,
    "follower": 999,
    "stat": 999,
    "percent": "+100%",
    "BarPET": 250,
    "BarALU": 250,
    "BarUHT": 250,
    "BarOIL": 250,
    "PET": "250kg",
    "Aluminium": "250kg",
    "UHT": "250kg",
    "Oil": "250kg"
  },
];
final controller = UserController.instance;

//หน้าเเสดงชื่อผู็ใช้
class BinnyBunWidget extends StatelessWidget {
  //ชื่อโปรไฟล์ของผู้ใช้
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment
          .center, // จัดให้ส่วนของ InkWell อยู่ตรงกลางตามแนวแกนตั้ง
      crossAxisAlignment: CrossAxisAlignment
          .center, // จัดให้ส่วนของ InkWell อยู่ตรงกลางตามแนวแกนนอน
      children: [
        Obx(() {
          if (controller.profileLoading.value) {
            return const ShimmerEffect(width: 80, height: 15);
          } else {
            return Text(
              controller.user.value.fullName,
              style: TextStyle(
                  color: Ticolor.blackMain3,
                  fontSize: controller.user.value.fullName.length > 8 ? 24 : 32,
                  fontWeight: FontWeight.bold),
            );
          }
        }),
        SizedBox(height: 0.1),
        InkWell(
          onTap: () {
            Clipboard.setData(ClipboardData(text: userData[0]['name_key']));
            print('Text copied');
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment
                .center, // จัดให้ส่วนของ Row อยู่ตรงกลางตามแนวแกนนอน
            children: [
              Text(
                controller.user.value.username,
                style: TextStyle(color: Ticolor.blackMain3, fontSize: 14),
              ),
              SizedBox(width: 2),
              Image.asset(
                TImages.iconcopy,
                width: 18,
                height: 18,
                color: Ticolor.blackMain3,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

//หน้าเเสดงผู้ติดตาม
class FollowStatsContainer extends StatelessWidget {
  //ที่เเสดงค่าของ ผู้ติดตาม กำลังติดตาม
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.80,
      decoration: BoxDecoration(
        color: Ticolor.no,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Ticolor.blackSup1.withOpacity(0.5),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              height: 65,
              decoration: BoxDecoration(
                color: Ticolor.no,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
                border: Border(
                  right: BorderSide(
                    color: Ticolor.blackSup1.withOpacity(0.5),
                    width: 1,
                  ),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    // userData[0]['following'].toString(),
                    (controller.user.value.following ?? 0).toString(),

                    style: TextStyle(
                        color: Ticolor.blackMain3,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'กำลังติดตาม',
                    style: TextStyle(
                        color: Ticolor.greenMain2,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              height: 65,
              decoration: BoxDecoration(
                color: Ticolor.no,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    (controller.user.value.follower ?? 0).toString(),
                    style: TextStyle(
                        color: Ticolor.blackMain3,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'ผู้ติดตาม',
                    style: TextStyle(
                        color: Ticolor.greenMain2,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// สถิติขยะ
class MyWasteStatistics extends StatefulWidget {
  @override
  _MyWasteStatisticsState createState() => _MyWasteStatisticsState();
}

class _MyWasteStatisticsState extends State<MyWasteStatistics> {
  //สถิติการแยกขยะของฉัน
  final List<String> months = [
    'มกราคม',
    'กุมภาพันธ์',
    'มีนาคม',
    'เมษายน',
    'พฤษภาคม',
    'มิถุนายน',
    'กรกฎาคม',
    'สิงหาคม',
    'กันยายน',
    'ตุลาคม',
    'พฤศจิกายน',
    'ธันวาคม'
  ];

  String selectedMonth = 'มกราคม';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        color: Ticolor.no,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Ticolor.no, width: 2),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'สถิติการแยกขยะของฉัน',
                style: TextStyle(
                    color: Ticolor.blackMain1,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 55),
              DropdownButton<String>(
                value: selectedMonth,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedMonth = newValue!; // อัปเดตค่าเดือนที่เลือก
                  });
                },
                items: months.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ],
          ),
          SizedBox(height: 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                // userData[0]['stat'].toString(),
                (controller.user.value.point ?? 0).toString(),
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 6),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                decoration: BoxDecoration(
                  color: Ticolor.greenMain1.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  userData[0]['percent'],
                  style: TextStyle(fontSize: 14, color: Ticolor.greenMain3),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Container(
            height: 10,
            width: 350,
            child: Row(
              children: [
                Expanded(
                  flex: userData[0]['BarPET'],
                  child: Container(
                    color: Ticolor.bar1,
                  ),
                ),
                Expanded(
                  flex: userData[0]['BarALU'],
                  child: Container(
                    color: Ticolor.bar2,
                  ),
                ),
                Expanded(
                  flex: userData[0]['BarUHT'],
                  child: Container(
                    color: Ticolor.bar3,
                  ),
                ),
                Expanded(
                  flex: userData[0]['BarOIL'],
                  child: Container(
                    color: Ticolor.bar4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// สร้าง การ์ด 4 อันล่าง
class BcardWidget extends StatelessWidget {
  //แสดงการ์ด 4 อันที่มีข้อมูล พลาสติกใสPET  กระป๋องอลูมิเนียม  กล่องเรื่องดื่มUHT  น้ำมันพืชใช้เเล้ว
  final List<String> items;
  BcardWidget({required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.25,
      decoration: BoxDecoration(
        color: Ticolor.no,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Ticolor.no, width: 2),
      ),
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        children: <Widget>[
          Row(
            children: [
              _buildCard(items[0], 4),
              _buildCard(items[1], 1),
            ],
          ),
          Row(
            children: [
              _buildCard(items[2], 2),
              _buildCard(items[3], 3),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCard(String item, int index) {
    Color color = _getColorForIndex(index);
    return Expanded(
      child: Card(
        elevation: 0,
        color: Ticolor.whiteMain1,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Ticolor.blackSup1.withOpacity(0.5), width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.only(left: 16, right: 16),
          title: Row(
            children: [
              CircleAvatar(
                backgroundColor: color,
                radius: 5,
              ),
              SizedBox(width: 8),
              Text(
                item.split(' ')[0],
                style: TextStyle(
                    color: Ticolor.blackMain1,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          subtitle: Text(
            item.split(' ')[1],
            style: TextStyle(
                color: Ticolor.blackMain3, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Color _getColorForIndex(int index) {
    List<Color> colors = [
      Ticolor.bar1,
      Ticolor.bar2,
      Ticolor.bar3,
      Ticolor.bar4,
    ];
    return colors[index % colors.length];
  }
}
