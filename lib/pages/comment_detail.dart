import 'package:binny_application/data/models/replyModel.dart';
import 'package:binny_application/data/models/topicModel.dart';
import 'package:binny_application/features/authentication/controllers/reply/reply_controller.dart';
import 'package:binny_application/features/authentication/controllers/signup/create_comment_controller.dart';
import 'package:binny_application/features/personalization/controllers/user_controller.dart';
import 'package:binny_application/utils/validators/validations.dart';
import 'package:binny_application/widgets/circular_image.dart';
import 'package:binny_application/widgets/class/Image.dart';
import 'package:binny_application/widgets/topic_post.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:binny_application/widgets/class/Color.dart';

class PostDetail extends StatelessWidget {
  TopicModel topic;

  PostDetail({Key? key, required this.topic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final panelHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Ticolor.whiteMain2,
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: Ticolor.no,
          title: Image.asset(
            TImages.logoblack,
            fit: BoxFit.cover,
            height: 30,
          ),
          actions: [
            Padding(
                padding: EdgeInsets.only(right: 10),
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.bookmark_outline_rounded,
                      size: 35,
                    ))),
          ],
        ),
        body: SlidingUpPanel(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            minHeight: panelHeight,
            maxHeight: panelHeight,
            body: Container(),
            panelBuilder: (controller) => PostInner(
                  controller: controller,
                  topic: topic,
                )));
  }
}

class PostInner extends StatelessWidget {
  final TopicModel topic;
  final ScrollController controller;

  PostInner({
    Key? key,
    required this.controller,
    required this.topic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userController = UserController.instance;
    final createcommentController = Get.put(CreateCommentController());
    final networkImage = userController.user.value.profilePicture;
    final image =
        networkImage.isNotEmpty ? networkImage : TImages.profilerabbit;
    return Stack(
      children: [
        Postbox(
          topic: topic,
        ),
        Positioned(
            bottom: 115,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              height: 100,
              color: Ticolor.greenMain3,
              child: Form(
                  key: createcommentController.createCommentKey,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircularImage(
                        image: image,
                        width: 45,
                        height: 45,
                        isNetWorkImage: networkImage.isNotEmpty,
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: SizedBox(
                            height: 35,
                            child: TextFormField(
                                validator: (value) =>
                                    Validator.validateEmptyText('Text', value),
                                controller: createcommentController.comment,
                                expands: false,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 2, horizontal: 25),
                                    hintText: 'แสดงความคิดเห็นของคุณ',
                                    filled: true,
                                    fillColor: Ticolor.whiteMain1,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
                                      borderSide: BorderSide.none,
                                    )))),
                      ),
                      SizedBox(width: 10),
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Ticolor.addon7,
                        child: IconButton(
                          icon: Icon(
                            Icons.navigate_next_rounded,
                            color: Ticolor.greenMain3,
                          ),
                          onPressed: () {
                            createcommentController.creatcomment(
                                userController.user.value, topic);
                          },
                        ),
                      ),
                    ],
                  )),
            ))
      ],
    );
  }
}

class Postbox extends StatelessWidget {
  TopicModel topic;
  final ReplyController replyController = Get.put(ReplyController());
  Postbox({Key? key, required this.topic}) : super(key: key) {
    replyController.fetchReplies(topic.id);
  }

  @override
  Widget build(BuildContext context) {
    final networkImage = topic.profilePic;

    final image =
        networkImage.isNotEmpty ? networkImage : TImages.profilerabbit;
    String formattedDate = DateFormat.yMMMd().add_Hm().format(topic.timeStamp);
    return SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 13, horizontal: 13),
            child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    border: Border.all(color: Ticolor.blackSup3, width: 2)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          // color: Colors.pink,
                          child: Row(children: [
                            CircularImage(
                              image: image,
                              width: 50,
                              height: 50,
                              isNetWorkImage: networkImage.isNotEmpty,
                            ),
                            SizedBox(width: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(topic.userName),
                                Text(formattedDate)
                              ],
                            ),
                          ]),
                        ),
                        Icon(Icons.book),
                      ],
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Text(topic.text),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          child: Row(children: [
                            Icon(Icons.heart_broken_rounded),
                            SizedBox(width: 6),
                            Text(topic.likeCount.toString())
                          ]),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          child: Row(children: [
                            Icon(Icons.chat),
                            SizedBox(width: 6),
                            Text(topic.replyCount.toString())
                          ]),
                        ),
                      ],
                    ),
                    Divider(color: Ticolor.blackSup3),
                    Obx(() {
                      if (replyController.isLoading.value) {
                        // Show loading indicator while replies are being fetched
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: replyController.replies.length,
                          itemBuilder: (context, index) {
                            final networkImageR =
                                replyController.replies[index].profilePic;
                            final imageR = networkImageR.isNotEmpty
                                ? networkImageR
                                : TImages.profilerabbit;
                            final text = replyController.replies[index].text;
                            final name =
                                replyController.replies[index].username;
                            return Container(
                                margin: EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CircularImage(
                                      image: imageR,
                                      width: 50,
                                      height: 50,
                                      isNetWorkImage: networkImageR.isNotEmpty,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                        child: Text(
                                      text,
                                      style: TextStyle(
                                        color: Ticolor.blackMain2,
                                        fontSize: 13,
                                        fontFamily: 'IBM Plex Sans Thai',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ))
                                  ],
                                ));
                          },
                        );
                      }
                    })
                  ],
                ))));
  }
}
