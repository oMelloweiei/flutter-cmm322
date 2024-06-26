import 'dart:ui';
import 'package:binny_application/widgets/class/Color.dart';
import 'package:binny_application/data/models/topicModel.dart';
import 'package:binny_application/pages/comment_detail.dart';
import 'package:binny_application/widgets/class/Image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

const TextStyle topCommentText = TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 12,
  color: Ticolor.addon4, // Use direct color value instead of Color.fromRGBO()
  letterSpacing: -0.4,
);

const TextStyle titleText = TextStyle(
  fontSize: 20,
  fontFamily: 'IBMPlexSansThai',
  fontWeight: FontWeight.w700,
  color: Ticolor.whiteMain1,
  letterSpacing: -0.5,
);

const TextStyle commentText = TextStyle(
  fontFamily: 'IBMPlexSansThai',
  fontWeight: FontWeight.w400,
  fontSize: 12,
  color:
      Ticolor.whiteMain1, // Use direct color value instead of Color.fromRGBO()
  letterSpacing: -0.4,
);
const TextStyle locationText = TextStyle(
  fontFamily: 'IBMPlexSansThai',
  fontWeight: FontWeight.w400,
  fontSize: 16,
  color:
      Ticolor.whiteMain1, // Use direct color value instead of Color.fromRGBO()
  letterSpacing: -0.4,
);
//Color style here -------------------------------------------------------------------------------------------------------------
const Color primaryColor =
    Ticolor.greenMain3; // Use direct color value instead of Color.fromRGBO()
const Color cardBG = Ticolor.blackMain2;

class squareBox extends StatelessWidget {
  final String boxTitle;
  final String comment;
  final String username;
  final String formattedDate;
  final TopicModel? topic;
  const squareBox({
    Key? key,
    required this.boxTitle,
    required this.comment,
    required this.username,
    required this.formattedDate,
    this.topic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
        child: InkWell(
          onTap: () {
            Get.to(PostDetail(topic: topic!));
          },
          child: Container(
            width: 216,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10),
              color: Ticolor.blackMain3,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 7.0),
                    child: Text(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      boxTitle,
                      style: GoogleFonts.ibmPlexSansThai().copyWith(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: Ticolor.whiteMain1,
                        letterSpacing: -0.5,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 7.0),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Top comment\n',
                            style: GoogleFonts.ibmPlexSansThai(
                              textStyle: topCommentText,
                            ),
                          ),
                          TextSpan(
                            text: comment,
                            style: GoogleFonts.ibmPlexSansThai(
                              textStyle: commentText,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 16.0, 0, 7.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment
                          .end, // Align children to the start (left)
                      children: [
                        Container(
                          width: 155,
                          child: RichText(
                            textAlign: TextAlign.right,
                            text: TextSpan(
                              style: GoogleFonts.ibmPlexSansThai().copyWith(
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                                color: Ticolor.whiteMain1,
                                letterSpacing: -0.5,
                              ),
                              text: '$username\n $formattedDate',
                            ),
                          ),
                        ),
                        Container(
                          width: 45,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage(TImages.logoOval),
                            fit: BoxFit.contain,
                          )),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class carpet extends StatelessWidget {
  final String carpetTitle;
  final String picture;
  final String description;
  final String hashtag;
  carpet(
      {super.key,
      required this.picture,
      required this.carpetTitle,
      required this.description,
      required this.hashtag});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Container(
            width: 348,
            height: 200, // Set the height as needed
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(picture),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Container(
            width: 348,
            height: 200,
            decoration: BoxDecoration(
              color: Ticolor.addon3,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        Positioned(
          left: 0,
          top: 0,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(17, 9, 17, 0),
            child: Text.rich(TextSpan(children: [
              TextSpan(
                text: '$carpetTitle \n',
                // text: 'สวัสดีชาวโลก\n',
                style: GoogleFonts.ibmPlexSansThai(
                  color: Ticolor.whiteMain1,
                  fontSize: 20,
                  letterSpacing: -0.5,
                ),
              ),
              TextSpan(
                text: description,
                style: GoogleFonts.ibmPlexSansThai(
                  color: Ticolor.whiteMain1,
                  fontSize: 14,
                  letterSpacing: -0.5,
                ),
              )
            ])),
          ),
        ),
        Positioned(
            bottom: 10,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(17, 9, 17, 9),
              child: Text.rich(TextSpan(children: [
                TextSpan(
                    text: hashtag,
                    style: GoogleFonts.ibmPlexSansThai(
                      color: Ticolor.whiteMain1,
                      fontSize: 15,
                      letterSpacing: -0.5,
                    ))
              ])),
            ))
      ],
    );
  }
}
