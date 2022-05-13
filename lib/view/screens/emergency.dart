import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyPage extends StatelessWidget {
  const EmergencyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
            child: Column(
          children: [
            TextButton(
              onPressed: () async{
              await canLaunchUrl(Uri(scheme: 'tel', path: '122'));
              },
              child: const Text(
                '122',
                style: TextStyle(color: Colors.black),
              ),
            ),
            TextButton(
              onPressed: () {
                canLaunchUrl(Uri(scheme: 'tel', path: '01155455342'));
              },
              child: const Text(
                '01155455342',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
