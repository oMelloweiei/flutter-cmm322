import 'package:binny_application/pages/createpost.dart';
import 'package:binny_application/widgets/listbox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class katooPage extends StatelessWidget {
  const katooPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final panelHeightOpen = MediaQuery.of(context).size.height * 0.8;
    final panelHeightClose = MediaQuery.of(context).size.height * 0.45;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
          ),
          backgroundColor: Colors.black,
        ),
        body: SlidingUpPanel(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            minHeight: panelHeightClose,
            maxHeight: panelHeightOpen,
            body: QAPage(),
            panelBuilder: (controller) => PanelWidget(controller: controller)));
  }
}

class QAPage extends StatefulWidget {
  const QAPage({Key? key}) : super(key: key);

  @override
  State<QAPage> createState() => _QAPageState();
}

class _QAPageState extends State<QAPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'กระทู้ถามตอบ',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'IBMPlexSansThai'),
                ),
                Text(
                  '#ประเด็นถามตอบยอดฮิตวันนี้',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'IBMPlexSansThai'),
                ),
              ],
            )),

        Container(
          height: 230, // Specify a height here
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              squareBox(
                  boxTitle: 'boxTitle',
                  comment: 'comment',
                  username: 'username',
                  formattedDate: 'formattedDate'),
              squareBox(
                  boxTitle: 'boxTitle',
                  comment: 'comment',
                  username: 'username',
                  formattedDate: 'formattedDate'),
              squareBox(
                  boxTitle: 'boxTitle',
                  comment: 'comment',
                  username: 'username',
                  formattedDate: 'formattedDate'),
              squareBox(
                  boxTitle: 'boxTitle',
                  comment: 'comment',
                  username: 'username',
                  formattedDate: 'formattedDate'),
            ],
          ),
        ),

        // Add another column with box content
      ],
    );
  }
}

class PanelWidget extends StatefulWidget {
  final ScrollController controller;
  const PanelWidget({Key? key, required this.controller}) : super(key: key);

  @override
  State<PanelWidget> createState() => _PanelWidgetState();
}

class _PanelWidgetState extends State<PanelWidget> {
  Map<String, bool> contentsState = {
    'recommendPost': true,
    'myPost': false,
  };

  void onPressed(String buttonText) {
    setState(() {
      contentsState.updateAll((key, value) => value = false);
      contentsState[buttonText] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final selectedWidget = _getSelectedWidget();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 35, vertical: 10),
          // color: Colors.red.withOpacity(0.3),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Row(mainAxisSize: MainAxisSize.min, children: [
                myTextButton('สำหรับฉัน', 'recommendPost'),
                SizedBox(width: 20),
                myTextButton('กระทู้ของฉัน', 'myPost')
              ])),
              Icon(Icons.post_add, color: Colors.green, size: 35)
            ],
          ),
        ),
        Expanded(child: selectedWidget),
      ],
    );
  }

  Widget myTextButton(String text, String cond) {
    bool selected = contentsState[cond] ?? false;
    return GestureDetector(
        onTap: () => onPressed(cond),
        child: IntrinsicWidth(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                text,
                style: TextStyle(
                    color: selected ? Colors.green : Colors.black,
                    fontSize: 20),
              ),
              SizedBox(height: 2),
              selected
                  ? Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        color: Colors.green,
                      ),
                      height: 3,
                    )
                  : SizedBox(),
            ],
          ),
        ));
  }

  Widget _getSelectedWidget() {
    Widget selectedWidget;
    if (contentsState['recommendPost']!) {
      selectedWidget = forMeContainer(
        controller: widget.controller,
      );
    } else {
      selectedWidget = myPost();
    }
    return selectedWidget;
  }
}

class myPost extends StatelessWidget {
  const myPost({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.black.withOpacity(0.05),
      padding: EdgeInsets.symmetric(horizontal: 26, vertical: 26),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'คุณยังไม่เคยตั้งกระทู้..',
            style:
                TextStyle(fontSize: 16, color: Colors.black.withOpacity(0.3)),
          ),
          Text(
            'มาเริ่มตั้งกระทู้กันเลย!',
            style:
                TextStyle(fontSize: 20, color: Colors.black.withOpacity(0.5)),
          ),
          TextButton(
            onPressed: () {
              Get.to(CreatePost());
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            child: Text(
              'เขียนกระทู้คำถามของคุณ',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}

class forMeContainer extends StatelessWidget {
  final ScrollController controller;
  const forMeContainer({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 26, vertical: 12),
      child: ListView(controller: controller, children: [
        commmentBox(
            "name",
            "time",
            "date",
            "Comment Comment Comment Comment Comment Comment Comment Comment  Comment Comment Comment Comment",
            20,
            10,
            " reply reply reply reply reply reply reply reply reply reply reply reply reply reply reply reply reply reply",
            "assets/Ying.png",
            'assets/Ying2.png'),
        commmentBox(
            "name",
            "time",
            "date",
            "Comment Comment Comment Comment Comment Comment Comment Comment  Comment Comment Comment Comment",
            20,
            10,
            " reply reply reply reply reply reply reply reply reply reply reply reply reply reply reply reply reply reply",
            "assets/Ying.png",
            'assets/Ying2.png'),
        commmentBox(
            "name",
            "time",
            "date",
            "Comment Comment Comment Comment Comment Comment Comment Comment  Comment Comment Comment Comment",
            20,
            10,
            " reply reply reply reply reply reply reply reply reply reply reply reply reply reply reply reply reply reply",
            "assets/Ying.png",
            'assets/Ying2.png'),
        commmentBox(
            "name",
            "time",
            "date",
            "Comment Comment Comment Comment Comment Comment Comment Comment  Comment Comment Comment Comment",
            20,
            10,
            " reply reply reply reply reply reply reply reply reply reply reply reply reply reply reply reply reply reply",
            "assets/Ying.png",
            'assets/Ying2.png'),
        commmentBox(
            "name",
            "time",
            "date",
            "Comment Comment Comment Comment Comment Comment Comment Comment  Comment Comment Comment Comment",
            20,
            10,
            " reply reply reply reply reply reply reply reply reply reply reply reply reply reply reply reply reply reply",
            "assets/Ying.png",
            'assets/Ying2.png'),
      ]),
    );
  }

  Widget commmentBox(
      String name,
      String time,
      String date,
      String post,
      int like,
      int nComment,
      String reply,
      String PostprofileImg,
      String ReplyImg) {
    return GestureDetector(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 8),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              border: Border.all(
                  color: const Color.fromARGB(255, 203, 203, 203), width: 2)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    // color: Colors.pink,
                    child: Row(children: [
                      ClipOval(
                        child: Image.asset(PostprofileImg,
                            fit: BoxFit.cover, width: 50, height: 50),
                      ),
                      SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [Text(name), Text('${time} | ${date}')],
                      ),
                    ]),
                  ),
                  Icon(Icons.book),
                ],
              ),
              SizedBox(
                height: 18,
              ),
              Text(post),
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
                      Text(like.toString())
                    ]),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    child: Row(children: [
                      Icon(Icons.chat),
                      SizedBox(width: 6),
                      Text(nComment.toString())
                    ]),
                  ),
                ],
              ),
              Divider(color: const Color.fromARGB(255, 203, 203, 203)),
              Container(
                margin: EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        ReplyImg,
                        fit: BoxFit.cover,
                        width: 35,
                        height: 35,
                      ),
                    ),
                    SizedBox(width: 10),
                    Flexible(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          reply,
                          maxLines: 2,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          'reply',
                          style: TextStyle(color: Colors.green),
                        )
                      ],
                    ))
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
