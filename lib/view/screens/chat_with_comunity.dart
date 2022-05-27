import 'package:easysugar/view/custom_widet/custom_drawer.dart';
import 'package:easysugar/view/custom_widet/custom_text.dart';
import 'package:easysugar/view/custom_widet/custom_text_field.dart';

import 'package:flutter/material.dart';

import '../../help/routs/routs_name.dart';

class ChatWhithComunityScreen extends StatelessWidget {
  const ChatWhithComunityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            Navigator.pushNamed(context, RoutsNames.homeScreenForPatient);
          }, icon: const Icon(Icons.home_filled))
        ],
        backgroundColor: const Color(0xff08877A),
        title: const Text("Chat With Community "),
      ),
      body: Container(
        color: const Color(0xff0F8F81).withOpacity(.5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.only(top: 70, left: 30, right: 10),
                height: MediaQuery.of(context).size.height * .57,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xff0F8F81).withOpacity(.30),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      buildChatItem(
                        context,
                        text: "Hi my name is Salma , I am type-1 , and U ?",
                        align: Alignment.topLeft,
                        color: const Color.fromARGB(255, 23, 24, 24)
                            .withOpacity(.30),
                      ),
                      buildChatItem(
                        context,
                        text:
                            "Thanks Salma , I am Mohamed oh no , I am type-1 What medications are U taking ? ",
                        align: Alignment.topRight,
                        color: const Color(0xffAED4D1),
                      ),
                      buildChatItem(
                        context,
                        text: "Hi my name is Salma , I am type-1 , and U ?",
                        align: Alignment.topLeft,
                        color: const Color.fromARGB(255, 23, 24, 24)
                            .withOpacity(.30),
                      ),
                      buildChatItem(context,
                          text: "Hi my name is Salma , I am type-1 , and U ?",
                          align: Alignment.topRight,
                          color: const Color(0xffAED4D1)),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 200,
                decoration: const BoxDecoration(
                    color: Color(0xff08877A),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 40, left: 30),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      children: [
                        FloatingActionButton(
                            backgroundColor: const Color(0xffAED4D1),
                            onPressed: () {},
                            child: const Icon(Icons.camera_alt_outlined)),
                        const SizedBox(
                          width: 10,
                        ),
                        const Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: CustomTextField(
                              color: Color(0xffAED4D1),
                              lableText: "Type message here",
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: FloatingActionButton(
                              backgroundColor: const Color(0xffAED4D1),
                              onPressed: () {},
                              child: const Icon(Icons.send)),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      drawer: const CustomDrawer(),
    );
  }
}

Widget buildChatItem(context, {text, AlignmentGeometry? align, Color? color}) {
  return Padding(
    padding: const EdgeInsets.only(left: 13),
    child: Align(
      alignment: align!,
      child: Container(
        padding: const EdgeInsets.only(left: 20, top: 20),
        margin: const EdgeInsets.only(top: 20),
        height: MediaQuery.of(context).size.height * .13,
        width: MediaQuery.of(context).size.width * .6,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                bottomRight: Radius.circular(44),
                topRight: Radius.circular(44)),
            color: color),
        child: CustomText(
          text: text,
        ),
      ),
    ),
  );
}
