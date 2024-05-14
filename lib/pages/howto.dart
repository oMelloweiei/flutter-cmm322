import 'package:binny_application/widgets/class/Image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:binny_application/widgets/class/Color.dart';

class HowtoPage extends StatelessWidget {
  const HowtoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          TImages.logoblack,
          fit: BoxFit.cover,
          height: 30,
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 1),
                child: Text('How to แยก..',
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 10),
              Stack(
                alignment: Alignment.center,
                children: [
                  _buildRotatedRectangle(0.1),
                  _buildRotatedRectangle(-0.1),
                  _buildRotatedRectangle(0.0),
                  // รวมรูปภาพทั้งหมดลงใน Stack
                  _buildPositionedImage('assets/Road.png', 185, 120, 170, 1),
                  _buildPositionedImage('assets/Road2.png', 300, 250, 2, 150),
                  _buildPositionedImage('assets/Hygiene.png', 100, 100, 34, 110,
                      fit: BoxFit.cover),
                  _buildPositionedImage('assets/Tree.png', 125, 125, 220, 340),
                  _buildPositionedImage('assets/Tree.png', 75, 75, 0, 180),
                  _buildPositionedImage('assets/Tree.png', 75, 75, 275, 190),
                  _buildPositionedImage('assets/Dettol.png', 100, 100, 225, 85,
                      fit: BoxFit.cover),
                  _buildPositionedImage(
                      'assets/Morakod.png', 100, 100, 210, 225,
                      fit: BoxFit.cover),
                  _buildPositionedImage('assets/Vic.png', 100, 100, 45, 300,
                      fit: BoxFit.cover),
                  Positioned(
                    top: 10,
                    left: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('ขยะชิ้นนี้...',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold)),
                        Text('ต้องแยกยังไงนะ?',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 450,
                    left: 123,
                    child: Text('รีเฟรช เหลืออีก 1/3',
                        style: TextStyle(fontSize: 14)),
                  ),
                  Positioned(
                    top: 10,
                    right: 20,
                    child: Icon(Icons.info_outline, color: Ticolor.blackMain3),
                  ),
                  _buildPositionedPoints(200, 170),
                  _buildPositionedPoints(86, 10),
                  _buildPositionedPoints(55, 235),
                  _buildPositionedPoints(270, 90),
                  // เรียกใช้ RankingWidget ที่สร้างไว้
                ],
              ),
              SizedBox(height: 70),
              Stack(
                children: [
                  _buildRectangle(0.0),
                  _buildPositionedCircleImage('assets/Wan.png', 45, 15, 110,
                      fit: BoxFit.cover),
                  _buildPositionedCircleImage('assets/Ying.png', 45, 15, 220,
                      fit: BoxFit.cover),
                  _buildPositionedCircleImage('assets/Ying2.png', 45, 15, 330,
                      fit: BoxFit.cover),
                  _buildPositionedCircleImage('assets/Ying3.png', 45, 15, 440,
                      fit: BoxFit.cover),
                  _buildPositionedCircleImage('assets/Wan2.png', 45, 15, 550,
                      fit: BoxFit.cover),
                  _buildRankingWidget('อันดับที่1', 80, 15),
                  _buildRankingWidget('อันดับที่2', 190, 15),
                  _buildRankingWidget('อันดับที่3', 300, 15),
                  _buildRankingWidget('อันดับที่4', 410, 15),
                  _buildRankingWidget('อันดับที่5', 520, 15),
                  _buildTextbinnypoint(85, 15),
                  _buildTextbinnypoint(195, 15),
                  _buildTextbinnypoint(305, 15),
                  _buildTextbinnypoint(415, 15),
                  _buildTextbinnypoint(525, 15),
                  _buildpoints(140, 15),
                  _buildpoints(250, 15),
                  _buildpoints(360, 15),
                  _buildpoints(470, 15),
                  _buildpoints(580, 15),
                  _buildScore('873', 115, 15),
                  _buildScore('564', 225, 15),
                  _buildScore('544', 335, 15),
                  _buildScore('324', 445, 15),
                  _buildScore('224', 555, 15),
                  _buildName('Teewara I.', 120, 70),
                  _buildName('Sandy San', 230, 70),
                  _buildName('Nonnie', 340, 70),
                  _buildName('สมหญิง', 450, 70),
                  _buildName('สมชาย', 560, 70),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      width: 400,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Ticolor.blackMain3,
                      ),
                    ),
                  ),
                  Positioned(
                    top: -60,
                    left: 15,
                    child: Transform.translate(
                      offset: Offset(-10, 70),
                      child: Container(
                        width: 50,
                        height: 50,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'assets/gold.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 15,
                    left: 265,
                    child: Container(
                      height: 40,
                      width: 125,
                      decoration: BoxDecoration(
                        color: Ticolor.blackMain3,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Ticolor.whiteMain1,
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'คุณอยู่อันดับ 35',
                          style: TextStyle(
                            color: Ticolor.whiteMain1,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 2,
                    left: 48,
                    child: Container(
                      height: 40,
                      width: 150,
                      child: Center(
                        child: Text(
                          'การจัดอันดับ',
                          style: TextStyle(
                            color: Ticolor.whiteMain1,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 70),
              // ให้ประกาศ RankingPage ใหม่เพื่อแยกหน้าจอ RankingWidget ออกมา
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPositionedCircleImage(
      String asset, double size, double left, double top,
      {BoxFit fit = BoxFit.contain}) {
    return Positioned(
      top: top,
      left: left,
      child: Container(
        width: size,
        height: size,
        child: ClipOval(
          child: Image.asset(asset, fit: fit),
        ),
      ),
    );
  }

  // สร้าง Widget รูปภาพและตำแหน่ง
  Widget _buildPositionedImage(
      String asset, double width, double height, double left, double top,
      {BoxFit fit = BoxFit.contain}) {
    return Positioned(
      top: top,
      left: left,
      child: Container(
        width: width,
        height: height,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(asset, fit: fit),
        ),
      ),
    );
  }

  // สร้าง Widget ตำแหน่งและจำนวนพ้อยต์
  Widget _buildPositionedPoints(double top, double left) {
    return Positioned(
      top: top,
      left: left,
      child: Container(
        height: 30,
        width: 90,
        decoration: BoxDecoration(
            color: Ticolor.blackMain3, borderRadius: BorderRadius.circular(6)),
        child: Center(
          child: Text(
            '2 point',
            style: TextStyle(
                color: Ticolor.whiteMain1, fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  // สร้าง Widget สี่เหลี่ยมหมุน
  Widget _buildRotatedRectangle(double angle) {
    return Positioned(
      child: Transform.rotate(
        angle: angle,
        child: Container(
          height: 489,
          width: 359,
          decoration: BoxDecoration(
              color: Ticolor.whiteMain1,
              border: Border.all(color: Ticolor.blueSup1),
              borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }

  Widget _buildRectangle(double angle) {
    return Positioned(
      child: Transform.rotate(
        angle: angle,
        child: Container(
          height: 620,
          width: 400,
          decoration: BoxDecoration(
              color: Ticolor.whiteMain1,
              border: Border.all(color: Ticolor.blueSup1),
              borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }

  Widget _buildTextbinnypoint(double top, double right) {
    return Positioned(
      top: top,
      right: right,
      child: Center(
        child: Text(
          '+10 binny point',
          style: TextStyle(
              color: Ticolor.greenMain4, fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildpoints(double top, double right) {
    return Positioned(
      top: top,
      right: right,
      child: Center(
        child: Text(
          'คะแนนสะสม',
          style: TextStyle(
            color: Ticolor.blackMain3,
            fontSize: 15,
          ),
        ),
      ),
    );
  }

  Widget _buildRankingWidget(String text, double top, double left) {
    return Positioned(
      top: top,
      left: left,
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20, // คุณสามารถปรับขนาดตัวอักษรตามต้องการ
        ),
      ),
    );
  }

  Widget _buildScore(String text, double top, double right) {
    return Positioned(
      top: top,
      right: right,
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25, // คุณสามารถปรับขนาดตัวอักษรตามต้องการ
        ),
      ),
    );
  }

  Widget _buildName(String text, double top, double left) {
    return Positioned(
      top: top,
      left: left,
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14, // คุณสามารถปรับขนาดตัวอักษรตามต้องการ
        ),
      ),
    );
  }
}
