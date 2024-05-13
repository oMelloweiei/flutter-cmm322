import 'package:binny_application/widgets/class/Image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:binny_application/widgets/class/Color.dart';

class maintain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Assuming TImages.maintainpic is a variable storing the image path
            Image.asset(TImages.maintainpic),
            Text(
              'ปิดปรับปรุงชั่วคราว',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'ขออภัยในความไม่สะดวก',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            Text(
              'เนื่องจากอยู่ระหว่างการปรับปรุงระบบ',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            Text(
              'เพื่อให้มีประสิทธิภาพที่ดียิ่งขึ้น',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(20.0),
        child: ElevatedButton(
          onPressed: () {
            // Navigate back to the previous screen
            Navigator.pop(context);
          },
          child: Text(
            'ตกลง',
            style: TextStyle(
              color: Ticolor.whiteMain1, // Change text color to white
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Ticolor.greenMain4,
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            textStyle: TextStyle(
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    );
  }
}
