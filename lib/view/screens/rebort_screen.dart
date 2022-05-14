import 'package:easysugar/help/my_colors_app.dart';
import 'package:easysugar/model/rebort.dart';
import 'package:easysugar/view/custom_widet/custom_text.dart';
import 'package:firestore_model/firestore_model.dart';
import 'package:flutter/material.dart';

class ReportScreen extends StatelessWidget {
  ReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorsApp.primaryColor,
          title: const CustomText(
            text: "Report",
          ),
        ),
        body: ModelStreamGetBuilder<Report>(
            // query: (q) =>
            //     q.where('users.docId', isEqualTo: 'Njls2F58btTOkIejNP8wSQ5JjO'),
            onEmpty: () => const Center(
                    child: CustomText(
                  text: 'No Report Yet',
                  color: Colors.black,
                )),
            onLoading: () => const Center(child: CircularProgressIndicator()),
            onSuccess: (reports) {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: reports?.length,
                itemBuilder: (context, index) {
                  Report? report = reports?[index];

                  print('report ${report?.toMap}');
                  return bildListViewItem(context, report: report);
                },
              );
            }));
  }
}

Widget bildListViewItem(context, {Report? report}) {
  return Container(
    margin: const EdgeInsets.all(8.0),
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
        color: const Color.fromARGB(255, 243, 231, 231),
        borderRadius: BorderRadius.circular(10)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildContanerItem(
          context,
          report!.date,
          MediaQuery.of(context).size.width * .2,
        ),
        buildContanerItem(
          context,
          report.time ?? '',
          MediaQuery.of(context).size.width * .3,
        ),
        buildContanerItem(
          context,
          report.fasting ?? '',
          MediaQuery.of(context).size.width * .4,
        ),
        buildContanerItem(
          context,
          report.reminder ?? '',
          MediaQuery.of(context).size.width * .5,
        ),
        buildContanerItem(
          context,
          "Short Action",
          MediaQuery.of(context).size.width * .6,
        ),
        buildContanerItem(
          context,
          "Long Action",
          MediaQuery.of(context).size.width * .7,
        ),
        buildContanerItem(
          context,
          report.pills ?? '',
          MediaQuery.of(context).size.width * .8,
        ),
      ],
    ),
  );
}

Widget buildContanerItem(context, text, width) {
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
        width: width,
        height: 1,
        color: ColorsApp.primaryColor,
      ),
      const SizedBox(
        height: 5,
      )
    ],
  );
}
