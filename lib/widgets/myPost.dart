import 'package:binny_application/pages/createpost.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:binny_application/widgets/class/Color.dart';

class myPost extends StatelessWidget {
  const myPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Ticolor.blackMain3.withOpacity(0.05),
      padding: EdgeInsets.symmetric(horizontal: 26, vertical: 26),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'คุณยังไม่เคยตั้งกระทู้..',
            style:
                TextStyle(fontSize: 16, color: Ticolor.blackMain3.withOpacity(0.3)),
          ),
          Text(
            'มาเริ่มตั้งกระทู้กันเลย!',
            style:
                TextStyle(fontSize: 20, color: Ticolor.blackMain3.withOpacity(0.5)),
          ),
          TextButton(
            onPressed: () {
              Get.to(CreatePost());
            },
            style: ElevatedButton.styleFrom(backgroundColor: Ticolor.greenMain4),
            child: Text(
              'เขียนกระทู้คำถามของคุณ',
              style: TextStyle(fontSize: 20, color: Ticolor.whiteMain1),
            ),
          )
        ],
      ),
    );
  }
}
