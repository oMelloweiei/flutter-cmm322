import 'package:binny_application/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class nextButton extends StatefulWidget {
  final String title;

  nextButton({super.key, required this.title});

  @override
  State<nextButton> createState() => _nextButtonState();
}

class _nextButtonState extends State<nextButton> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: greenSub,
      ),
      width: size.width,
      height: 55,
      child: Center(
          child: Text(
        widget.title,
        style: GoogleFonts.ibmPlexSansThai().copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            letterSpacing: -0.4,
            color: Colors.white),
      )),
    );
  }
}

class Sellform extends StatefulWidget {
  final List<String> type;
  const Sellform({Key? key, required this.type}) : super(key: key);

  @override
  State<Sellform> createState() => _SellformState();
}

class _SellformState extends State<Sellform> {
  @override
  Widget build(BuildContext context) {
    // Assuming you want to display the first type in the list

    return Container(
        child: ListView.builder(
            itemCount: widget.type.length - 1,
            itemBuilder: (BuildContext context, int index) {
              return Text(widget.type[index + 1]);
            }));
  }
}
