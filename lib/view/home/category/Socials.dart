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


class SocialsPage extends StatefulWidget {
  const SocialsPage({super.key});

  @override
  State<SocialsPage> createState() => _SocialsPageState();
}

class _SocialsPageState extends State<SocialsPage> {
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
        title: Text("Socials",style: GoogleFonts.notoSans(fontSize: 17, color:Themes.getTextColor(context))),
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
                      onTap: () {Get.to(CategoryDetails(label: 'STAGES OF LIFE',table:'stage_life',isaudio:true),transition: Transition.rightToLeft);},

                      title: Text(
                        "STAGES OF LIFE".toUpperCase(),
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
                      onTap: () {Get.to(CategoryDetails(label: 'RELATIONSHIP',table:'relationship',isaudio:true),transition: Transition.rightToLeft);},

                      title: Text(
                        "RELATIONSHIP".toUpperCase(),
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
                      onTap: () {Get.to(CategoryDetails(label: 'PROFESSIONS',table:'professions',isaudio:true),transition: Transition.rightToLeft);},

                      title: Text(
                        "PROFESSIONS".toUpperCase(),
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
                      onTap: () {Get.to(CategoryDetails(label: 'INTERPERSONAL ACTIONS',table:'interpersonal_actions',isaudio:true),transition: Transition.rightToLeft);},

                      title: Text(
                        "INTERPERSONAL ACTIONS".toUpperCase(),
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
                      onTap: () {Get.to(CategoryDetails(label: 'EMOTIONS',table:'emotions',isaudio:true),transition: Transition.rightToLeft);},

                      title: Text(
                        "EMOTIONS".toUpperCase(),
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
                      onTap: () {Get.to(CategoryDetails(label: 'MUSIC',table:'music',isaudio:true),transition: Transition.rightToLeft);},

                      title: Text(
                        "MUSIC".toUpperCase(),
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
                      onTap: () {Get.to(CategoryDetails(label: 'SPORTS',table:'sports',isaudio:true),transition: Transition.rightToLeft);},

                      title: Text(
                        "SPORTS".toUpperCase(),
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
                      onTap: () {Get.to(CategoryDetails(label: 'COMMON EXPRESSIONS',table:'common_expressions',isaudio:true),transition: Transition.rightToLeft);},

                      title: Text(
                        "COMMON EXPRESSIONS".toUpperCase(),
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

