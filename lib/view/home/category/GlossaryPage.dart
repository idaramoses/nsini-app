// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../config/common.dart';
import '../../../res/common/app_methods.dart';
import '../../../utils/themes.dart';
import '../../Home/categoryDetails.dart';


class GlossaryPage extends StatefulWidget {
  const GlossaryPage({super.key});

  @override
  State<GlossaryPage> createState() => _GlossaryPageState();
}

class _GlossaryPageState extends State<GlossaryPage> {
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
        title: Text("Glossary",style: GoogleFonts.notoSans(fontSize: 17, color:Themes.getTextColor(context))),
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
                      onTap: () {Get.to(CategoryDetails(label: 'EDUCATION',table:'education',isaudio:true),transition: Transition.rightToLeft);},

                      title: Text(
                        "EDUCATION".toUpperCase(),
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
                      onTap: () {Get.to(CategoryDetails(label: 'RELIGION AND CULTURE',table:'religion',isaudio:true),transition: Transition.rightToLeft);},

                      title: Text(
                        "RELIGION AND CULTURE".toUpperCase(),
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
                      onTap: () {Get.to(CategoryDetails(label: 'COMMERCE AND TRANSPORT',table:'commerce',isaudio:true),transition: Transition.rightToLeft);},

                      title: Text(
                        "COMMERCE AND TRANSPORT".toUpperCase(),
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
                      onTap: () {Get.to(CategoryDetails(label: 'MEDICAL',table:'medical',isaudio:true),transition: Transition.rightToLeft);},

                      title: Text(
                        "MEDICAL".toUpperCase(),
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
                      onTap: () {Get.to(CategoryDetails(label: 'WHAT WE WEAR',table:'body_wears',isaudio:true),transition: Transition.rightToLeft);},

                      title: Text(
                        "WHAT WE WEAR".toUpperCase(),
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
                      onTap: () {Get.to(CategoryDetails(label: 'PHYSICAL ACTIONS',table:'physical_actions',isaudio:true),transition: Transition.rightToLeft);},

                      title: Text(
                        "PHYSICAL ACTIONS".toUpperCase(),
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
                      onTap: () {Get.to(CategoryDetails(label: 'FEEL',table:'feel',isaudio:true),transition: Transition.rightToLeft);},

                      title: Text(
                        "FEEL".toUpperCase(),
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
                      onTap: () {Get.to(CategoryDetails(label: 'MENTAL ACTIONS',table:'mental_action',isaudio:true),transition: Transition.rightToLeft);},

                      title: Text(
                        "MENTAL ACTIONS".toUpperCase(),
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
                      onTap: () {Get.to(CategoryDetails(label: 'SPEECH',table:'speech',isaudio:true),transition: Transition.rightToLeft);},

                      title: Text(
                        "SPEECH".toUpperCase(),
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

