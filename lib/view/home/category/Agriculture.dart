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


class AgriculturePage extends StatefulWidget {
  const AgriculturePage({super.key});

  @override
  State<AgriculturePage> createState() => _AgriculturePageState();
}

class _AgriculturePageState extends State<AgriculturePage> {
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
        title: Text("Agriculture",style: GoogleFonts.notoSans(fontSize: 17, color:Themes.getTextColor(context))),
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
                      onTap: () {Get.to(CategoryDetails(label: 'ANIMALS',table:'animals',isaudio:true),transition: Transition.rightToLeft);},

                      title: Text(
                        "ANIMALS".toUpperCase(),
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
                      onTap: () {Get.to(CategoryDetails(label: 'PLANTS',table:'plants',isaudio:true),transition: Transition.rightToLeft);},

                      title: Text(
                        "PLANTS".toUpperCase(),
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
                      onTap: () {Get.to(CategoryDetails(label: 'FOOD AND DRINKS',table:'foods',isaudio:true),transition: Transition.rightToLeft);},

                      title: Text(
                        "FOOD AND DRINKS".toUpperCase(),
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
                      onTap: () {Get.to(CategoryDetails(label: 'FOOD PROCESSING',table:'food_processing',isaudio:true),transition: Transition.rightToLeft);},

                      title: Text(
                        "FOOD PROCESSING".toUpperCase(),
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

