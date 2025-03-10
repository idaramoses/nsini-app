import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../config/common.dart';
import '../../../main.dart';
import '../../../res/common/app_methods.dart';
import '../../../res/constant/app_routes_path.dart';
import '../../../res/constant/app_strings.dart';
import '../../../utils/themes.dart';
import '../../home/controller/home_controller.dart';
import '../controller/controller.dart';
import 'package:intl/intl.dart';

class HymsPage extends StatefulWidget {
  const HymsPage({super.key});

  @override
  State<HymsPage> createState() => _HymsPageState();
}

class _HymsPageState extends State<HymsPage> with WidgetsBindingObserver {




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
        title: Text("Hymns",style: TextStyle(fontSize: 17, color:Themes.getTextColor(context))),
      ),
      body: SafeArea(
          child: Container()),
    );
  }
}
