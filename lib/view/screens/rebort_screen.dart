import 'package:easysugar/help/my_colors_app.dart';
import 'package:easysugar/view/custom_widet/custom_text.dart';
import 'package:flutter/material.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorsApp.primaryColor,
          title: const CustomText(
            text: "Report",
          ),
        ),
        body: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, index) => bildListViewItem(context),
        ));
  }
}

Widget bildListViewItem(
  context,
) {
  return Container(
    margin: const EdgeInsets.all(8.0),
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
        color: const Color.fromARGB(255, 243, 231, 231),
        borderRadius: BorderRadius.circular(10)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildContanerItem(context, "Date", MediaQuery.of(context).size.width * .2,),
        buildContanerItem(context, "Time", MediaQuery.of(context).size.width * .3,),
        buildContanerItem(context, "fasting", MediaQuery.of(context).size.width * .4,),
        buildContanerItem(context, "Reminder", MediaQuery.of(context).size.width * .5,),
        buildContanerItem(context, "Short Action", MediaQuery.of(context).size.width * .6,),
        buildContanerItem(context, "Long Action", MediaQuery.of(context).size.width * .7,),
        buildContanerItem(context, "Pills", MediaQuery.of(context).size.width * .8,),
      ],
    ),
  );
}

Widget buildContanerItem(context, text,width) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CustomText(
        text: text,
        color: Colors.black,
        fontSise: 18,
        fontWeight: FontWeight.bold,
      ),
      const SizedBox(
        height: 4,
      ),
      Container(
        width:width,
        height: 1,
        color: ColorsApp.primaryColor,
      ),
      const SizedBox(
        height: 5,
      )
    ],
  );
}