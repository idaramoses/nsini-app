
// ignore_for_file: file_names, camel_case_types
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../config/common.dart';
import '../../../utils/themes.dart';

class Notification_detail extends StatefulWidget {
  final String content;
  final String name;

  const Notification_detail(
      {super.key, required this.content, required this.name});

  @override
  State<Notification_detail> createState() => _Notification_detailState();
}

class _Notification_detailState extends State<Notification_detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Themes.getCardColor(context),
        elevation: 0.5,
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Image.asset("assets/images/arrow-narrow-left (1).png",scale: 3,color: Themes.getTextColor(context),)),
        title: Text("Notification Details",style: TextStyle(fontSize: 17, color:Themes.getTextColor(context))),
        actions: const [
          Icon(
            Icons.more_vert,
            color: Colors.white,
            size: 20,
          ),
          SizedBox(width: 20),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppConstants.Height(70),

            Text( widget.name,
              style:  TextStyle(
              fontSize: 18,
              color: Themes.getTextColor(context),
              fontWeight: FontWeight.bold
              ),
                        ),
            AppConstants.Height(20),
            Text(
              widget.content,
              style:  TextStyle(
                fontSize: 16,
                color: Themes.getTextColor(context),

              ),
            ),
          ],
        ),
      ),
    );
  }
}
