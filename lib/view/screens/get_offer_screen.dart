import 'package:easysugar/help/my_colors_app.dart';
import 'package:flutter/material.dart';

class GetOfferScreen extends StatelessWidget {
  const GetOfferScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.primaryColor,

        title: const Text("GetOffer"),
      ),
    );
  }
}