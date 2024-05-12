import 'package:binny_application/data/models/replyModel.dart';
import 'package:binny_application/data/models/topicModel.dart';
import 'package:binny_application/features/authentication/controllers/reply/reply_controller.dart';
import 'package:binny_application/features/personalization/controllers/user_controller.dart';
import 'package:binny_application/widgets/circular_image.dart';
import 'package:binny_application/widgets/class/Image.dart';
import 'package:binny_application/widgets/topic_post.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class PostDetail extends StatelessWidget {
  TopicModel topic;

  PostDetail({Key? key, required this.topic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final panelHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Color(0xFFF6F9FD),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
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
  final ReplyController replyController = Get.put(ReplyController());

  PostInner({
    Key? key,
    required this.controller,
    required this.topic,
  }) : super(key: key) {
    // Fetch replies for the topic
    replyController.fetchReplies(topic.id);
  }

  @override
  Widget build(BuildContext context) {
    final userController = UserController.instance;
    final networkImage = userController.user.value.profilePicture;
    final image =
        networkImage.isNotEmpty ? networkImage : TImages.profilerabbit;
    return Stack(
      children: [
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.3,
              color: Colors.green,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircularImage(
                    image: image,
                    width: 45,
                    height: 45,
                    isNetWorkImage: networkImage.isNotEmpty,
                  ),
                  // Form(child: TextFormField()),
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.navigate_next_rounded))
                ],
              ),
            ))
      ],
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Obx(() {
  //     if (replyController.isLoading.value) {
  //       // Show loading indicator while replies are being fetched
  //       return Center(
  //         child: CircularProgressIndicator(),
  //       );
  //     } else {
  //       // Show replies
  //       return SingleChildScrollView(
  //         controller: controller,
  //         child: Container(
  //           padding: EdgeInsets.symmetric(vertical: 12, horizontal: 26),
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               TopicContainer(
  //                 topic: topic,
  //               ),
  //               SizedBox(height: 20),
  //               Text(
  //                 'Replies:',
  //                 style: TextStyle(
  //                   fontWeight: FontWeight.bold,
  //                   fontSize: 18,
  //                 ),
  //               ),
  //               SizedBox(height: 10),
  //               ListView.builder(
  //                 shrinkWrap: true,
  //                 physics: NeverScrollableScrollPhysics(),
  //                 itemCount: replyController.replies.length,
  //                 itemBuilder: (context, index) {
  //                   return ListTile(
  //                     title: Text(replyController.replies[index].text),
  //                     subtitle: Text(
  //                         'Reply by ${replyController.replies[index].userId}'),
  //                   );
  //                 },
  //               ),
  //             ],
  //           ),
  //         ),
  //       );
  //     }
  //   });
  // }
  // Widget
}
