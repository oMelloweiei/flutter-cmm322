// import 'package:firebase_storage/firebase_storage.dart';

// class GetUrlImage {
//   Future<String> getImageUrl(String imagePath) async {
//     try {
//       final ref = FirebaseStorage.instance.refFromURL(imagePath);
//       final url = await ref.getDownloadURL();
//       return url;
//     } catch (e) {
//       print('Error getting image URL: $e');
//       return '';
//     }
//   }
// }
