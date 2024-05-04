import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'detailscan.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('This is ScanPage'),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailScan()),
              );
            },
            child: Text('Go to Detail Scan'),
          ),
        ],
      ),
    );
  }
}
