// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/common.dart';
import '../../../res/common/app_methods.dart';
import '../../../utils/themes.dart';
import '../categoryDetails.dart';


class PhysioPage extends StatefulWidget {
  const PhysioPage({super.key});

  @override
  State<PhysioPage> createState() => _PhysioPageState();
}

class _PhysioPageState extends State<PhysioPage> {
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
        title: Text("Physio",style: GoogleFonts.notoSans(fontSize: 17, color:Themes.getTextColor(context))),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            animationFunction(
                1,
                slideDuration: Duration(milliseconds: 2000),

                Card(
                  elevation: 0.5,

                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.h,
                      vertical: 4.h,
                    ),
                    decoration: CommonMethods.getBoxDecoration(
                      cornerRadius: 20.r,
                      color: Themes.getCardColor(context),
                    ),
                    child: ListTile(

                      contentPadding: EdgeInsets.zero,
                      minLeadingWidth: 4,
                      horizontalTitleGap: 4,
                      onTap: () {Get.to(CategoryDetails(label: 'Internal Parts',table:'internal_part',isaudio:true),transition: Transition.rightToLeft);},

                      title: Text(
                        "Internal Parts".toUpperCase(),
                        style: GoogleFonts.notoSans(
                          color: Themes.getTextColor(context),
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 2,
                        textAlign: TextAlign.left,
                      ),

                      trailing: Icon(Icons.arrow_forward_ios,size: 15,),

                    ),
                  ),
                )),
            animationFunction(
                1,
                slideDuration: Duration(milliseconds: 2000),

                Card(
                  elevation: 0.5,

                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.h,
                      vertical: 4.h,
                    ),
                    decoration: CommonMethods.getBoxDecoration(
                      cornerRadius: 20.r,
                      color: Themes.getCardColor(context),
                    ),
                    child: ListTile(

                      contentPadding: EdgeInsets.zero,
                      minLeadingWidth: 4,
                      horizontalTitleGap: 4,
                      onTap: () {Get.to(CategoryDetails(label: 'External Parts',table:'external_part',isaudio:true),transition: Transition.rightToLeft);},

                      title: Text(
                        "External Parts".toUpperCase(),
                        style: GoogleFonts.notoSans(
                          color: Themes.getTextColor(context),
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 2,
                        textAlign: TextAlign.left,
                      ),

                      trailing: Icon(Icons.arrow_forward_ios,size: 15,),

                    ),
                  ),
                )),
            animationFunction(
                1,
                slideDuration: Duration(milliseconds: 2000),

                Card(
                  elevation: 0.5,

                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.h,
                      vertical: 4.h,
                    ),
                    decoration: CommonMethods.getBoxDecoration(
                      cornerRadius: 20.r,
                      color: Themes.getCardColor(context),
                    ),
                    child: ListTile(

                      contentPadding: EdgeInsets.zero,
                      minLeadingWidth: 4,
                      horizontalTitleGap: 4,
                      onTap: () {Get.to(CategoryDetails(label: 'BODY PROCESSES',table:'body_process',isaudio:true),transition: Transition.rightToLeft);},

                      title: Text(
                        "BODY PROCESSES".toUpperCase(),
                        style: GoogleFonts.notoSans(
                          color: Themes.getTextColor(context),
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 2,
                        textAlign: TextAlign.left,
                      ),

                      trailing: Icon(Icons.arrow_forward_ios,size: 15,),

                    ),
                  ),
                )),

            // Add more subcategories here
          ],
        ),
      ),
    );
  }
}

