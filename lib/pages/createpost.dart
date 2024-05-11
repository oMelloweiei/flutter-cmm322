import 'package:binny_application/features/personalization/controllers/user_controller.dart';
import 'package:binny_application/widgets/class/Color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// List imgList = [];

class CreatePost extends StatelessWidget {
  CreatePost({Key? key}) : super(key: key);
  final userController = UserController.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
        ),
        body: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(children: [
                    Row(
                      children: [
                        Container(
                          width: 45,
                          height: 45,
                          decoration: ShapeDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  userController.user.value.profilePicture),
                              fit: BoxFit.cover,
                            ),
                            shape: OvalBorder(),
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          userController.user.value.fullName,
                          style: TextStyle(
                            color: Color(0xFF02C275),
                            fontSize: 16,
                            fontFamily: 'IBM Plex Sans Thai',
                            fontWeight: FontWeight.w500,
                            height: 0.11,
                            letterSpacing: -0.40,
                          ),
                        )
                      ],
                    ),
                    Form(
                        child: TextFormField(
                      minLines: 5,
                      maxLines: 50,
                      decoration: const InputDecoration(
                        hintText: 'คุณกำลังคิดอะไรอยู่?',
                      ),
                    )),
                  ]),
                  SizedBox(
                      width: double.infinity,
                      height: 85,
                      child: Row(children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  width: 2,
                                  color: Color(0xFFE0E0E0),
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            height: double.infinity,
                            width: 90,
                            child: Icon(
                              Icons.camera,
                              color: Ticolor.greenMain3,
                            ),
                          ),
                        ),
                        // if (imgList.isNotEmpty)
                        //   Expanded(
                        //     child: ListView.builder(
                        //       scrollDirection: Axis.horizontal,
                        //       itemCount: imgList.length,
                        //       itemBuilder: (BuildContext context, int index) {
                        //         return Container(
                        //           width: 90,
                        //         );
                        //       },
                        //     ),
                        //   ),
                      ]))
                ])));
  }
}
