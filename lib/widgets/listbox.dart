import 'dart:ui';

import 'package:binny_application/widgets/class/Image.dart';
import 'package:flutter/material.dart';

const TextStyle topCommentText = TextStyle(
  fontFamily: 'IBMPlexSansThai',
  fontWeight: FontWeight.w400,
  fontSize: 12,
  color:
      Color(0xFF9FFFA9), // Use direct color value instead of Color.fromRGBO()
  letterSpacing: -0.4,
);

const TextStyle titleText = TextStyle(
  fontSize: 20,
  fontFamily: 'IBMPlexSansThai',
  fontWeight: FontWeight.w700,
  color: Colors.white,
  letterSpacing: -0.5,
);

const TextStyle commentText = TextStyle(
  fontFamily: 'IBMPlexSansThai',
  fontWeight: FontWeight.w400,
  fontSize: 12,
  color: Colors.white, // Use direct color value instead of Color.fromRGBO()
  letterSpacing: -0.4,
);
const TextStyle locationText = TextStyle(
  fontFamily: 'IBMPlexSansThai',
  fontWeight: FontWeight.w400,
  fontSize: 16,
  color: Colors.white, // Use direct color value instead of Color.fromRGBO()
  letterSpacing: -0.4,
);
//Color style here -------------------------------------------------------------------------------------------------------------
const Color primaryColor =
    Color(0xFF02C275); // Use direct color value instead of Color.fromRGBO()
const Color cardBG = Color(0xFF242424);

class squareBox extends StatelessWidget {
  final String boxTitle;
  final String comment;
  final String username;
  final String formattedDate;
  const squareBox(
      {Key? key,
      required this.boxTitle,
      required this.comment,
      required this.username,
      required this.formattedDate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
        child: InkWell(
          onTap: () {}, //Link to whatever
          child: Container(
            width: 216,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10),
              color: Colors.black,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 7.0),
                    child: Text(
                      boxTitle,
                      style: titleText,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 7.0),
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: 'Top comment\n',
                          style: topCommentText,
                        ),
                        TextSpan(
                          text: comment,
                          style: commentText,
                        ),
                      ]),
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
                              text: '$username\n $formattedDate',
                              style: commentText,
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
                image: AssetImage(
                    picture), // Replace 'demoTrash.png' with your image asset path
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
              color: Color.fromARGB(102, 0, 0, 0),
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
                style: titleText,
              ),
              TextSpan(
                text: description,
                style: locationText,
              )
            ])),
          ),
        ),
        Positioned(
            bottom: 0,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(17, 9, 17, 9),
              child: Text.rich(TextSpan(
                  children: [TextSpan(text: hashtag, style: locationText)])),
            ))
      ],
    );
  }
}
