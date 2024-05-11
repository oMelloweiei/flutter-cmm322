import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Maps'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            openGoogleMaps();
          },
          child: Text('Open Google Maps'),
        ),
      ),
    );
  }

  void openGoogleMaps() async {
    try {
      final url = 'https://maps.google.com/';
      await launch(url);
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }
}
