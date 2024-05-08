// import 'package:binny_application/pages/scan/detailscan.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

// void main() {
//   runApp(MaterialApp(
//     home: Barcode(),
//   ));
// }

// class Barcode extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Barcodepage',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: AppHomePage(),
//       routes: {
//         '/barcodeproductpage': (context) => Barcodeproduct(),
//         '/crystal_page': (context) => DetailScan(), // Add route to the crystal_page
//       },
//     );
//   }
// }

// class AppHomePage extends StatefulWidget {
//   @override
//   _AppHomePageState createState() => _AppHomePageState();
// }

// class _AppHomePageState extends State<AppHomePage> {
//   String _scanBarcode = '';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(60.0),
//         child: AppBar(
//           backgroundColor: Colors.grey[200],
//           leading: IconButton(
//             icon: Icon(Icons.close, size: 30),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//           title: Row(
//             children: <Widget>[
//               TextButton(
//                 onPressed: () => scanBarcodeNormal(),
//                 child: Text(
//                   'สแกนบาร์โค้ด',
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Colors.white,
//                     fontFamily: 'IBMPlexSansThai',
//                   ),
//                 ),
//                 style: ButtonStyle(
//                   backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF02C275)),
//                   fixedSize: MaterialStateProperty.all<Size>(Size(113, 28)),
//                 ),
//               ),
//               SizedBox(width: 10),
//               TextButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, '/barcodeproductpage');
//                 },
//                 child: Text(
//                   'รหัสบาร์โค้ด',
//                   style: TextStyle(
//                     fontSize: 16,
//                     color: Color(0xFF02C275),
//                     fontFamily: 'IBMPlexSansThai',
//                   ),
//                 ),
//                 style: ButtonStyle(
//                   //backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF02C275)),
//                   fixedSize: MaterialStateProperty.all<Size>(Size(113, 28)),
//                 ),
//               ),
//               SizedBox(width: 20),
//             ],
//           ),
//         ),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               _scanBarcode, // ข้อความที่บอกว่าเป็นข้อมูลจากการสแกนบาร์โค้ด
//               style: TextStyle(fontSize: 20),
//             ),
//             Text(
//               'ขออภัย ยังไม่มีข้อมูลสินค้า', // แสดงเลขบาร์โค้ด
//               style: TextStyle(fontSize: 20),
//             ),
//           ],
//         ),
//       ),

//     );
//   }

//   Future<void> scanBarcodeNormal() async {
//     String barcodeScanRes;
//     try {
//       barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
//           '#ff6666', 'Cancel', true, ScanMode.BARCODE);
//       print(barcodeScanRes);

//       // If the scanned barcode is '8851952350161', navigate to 'crystal_page'
//       if (barcodeScanRes == '8851952350161') {
//         Navigator.pushNamed(context, '/crystal_page');
//       }
//       else{
//         if (!mounted) return;

//         setState(() {
//           _scanBarcode = barcodeScanRes;
//         });
//       }
//     } catch (e) {
//       barcodeScanRes = 'Failed to get platform version.';
//     }


//   }
// }