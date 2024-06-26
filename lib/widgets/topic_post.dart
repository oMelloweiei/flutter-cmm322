import 'package:binny_application/data/models/topicModel.dart';
import 'package:binny_application/pages/comment_detail.dart';
import 'package:binny_application/widgets/circular_image.dart';
import 'package:binny_application/widgets/class/Image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:binny_application/widgets/class/Color.dart';

class TopicContainer extends StatelessWidget {
  final TopicModel topic;

  const TopicContainer({Key? key, required this.topic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat.yMMMd().add_Hm().format(topic.timeStamp);
    final networkImage = topic.profilePic;
    final image =
        networkImage.isNotEmpty ? networkImage : TImages.profilerabbit;
    return GestureDetector(
        onTap: () {
          Get.to(PostDetail(
            topic: topic,
          ));
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 8),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              border: Border.all(color: Ticolor.blackSup1, width: 2)),
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
                        children: [Text(topic.userName), Text(formattedDate)],
                      ),
                    ]),
                  ),
                  Icon(Icons.bookmark_border_outlined,
                      color: Color(0xFFCFCFCF)),
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
                      FaIcon(FontAwesomeIcons.heart),
                      SizedBox(width: 6),
                      Text(topic.likeCount.toString())
                    ]),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    child: Row(children: [
                      FaIcon(FontAwesomeIcons.comment),
                      SizedBox(width: 6),
                      Text(topic.replyCount.toString())
                    ]),
                  ),
                ],
              ),
              Divider(color: Ticolor.blackSup1),
              // Container(
              //   margin: EdgeInsets.symmetric(vertical: 4),
              //   child: Row(
              //     children: [
              //       ClipOval(
              //         child: Image.asset(
              //           ReplyImg,
              //           fit: BoxFit.cover,
              //           width: 35,
              //           height: 35,
              //         ),
              //       ),
              //       SizedBox(width: 10),
              //       Flexible(
              //           child: Column(
              //         mainAxisAlignment: MainAxisAlignment.start,
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Text(
              //             reply,
              //             maxLines: 2,
              //             softWrap: true,
              //             overflow: TextOverflow.ellipsis,
              //           ),
              //           Text(
              //             'reply',
              //             style: TextStyle(color: Colors.green),
              //           )
              //         ],
              //       ))
              //     ],
              //   ),
              // )
            ],
          ),
        ));
  }
}
