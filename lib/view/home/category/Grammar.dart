// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sharkhub/view/home/category/widget/Consonats.dart';
import 'package:sharkhub/view/home/category/widget/Diphthongs.dart';
import 'package:sharkhub/view/home/category/widget/Vowels.dart';

import '../../../config/common.dart';
import '../../../res/common/app_methods.dart';
import '../../../utils/themes.dart';
import '../../Home/categoryDetails.dart';


class GrammarPage extends StatefulWidget {
  const GrammarPage({super.key});

  @override
  State<GrammarPage> createState() => _GrammarPageState();
}

class _GrammarPageState extends State<GrammarPage> {
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
        title: Text("Grammar",style: GoogleFonts.notoSans(fontSize: 17, color:Themes.getTextColor(context))),
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
                      onTap: () {Get.to(Consonants(),transition: Transition.rightToLeft);},

                      contentPadding: EdgeInsets.zero,
                      minLeadingWidth: 4,
                      horizontalTitleGap: 4,

                      title: Text(
                        "CONSONANTS",
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
                      onTap: () {Get.to(Vowels(),transition: Transition.rightToLeft);},

                      title: Text(
                        "VOWELS",
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
                      onTap: () {Get.to(Diphthongs(),transition: Transition.rightToLeft);},
                      title: Text(
                        "Diphthongs".toUpperCase(),
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
                      onTap: () {Get.to(CategoryDetails(label: 'QUESTION WORDS',table:'questionWords',isaudio:true),transition: Transition.rightToLeft);},
                      title: Text(
                        "QUESTION WORDS",
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
                      onTap: () {Get.to(CategoryDetails(label: 'PRONOUNS',table:'pronouns',isaudio:true),transition: Transition.rightToLeft);},
                      title: Text(
                        "PRONOUNS",
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
                      onTap: () {Get.to(CategoryDetails(label:  "RELATIONALS AND PREPOSITIONS",table:'relationalWords',isaudio:true),transition: Transition.rightToLeft);},

                      title: Text(
                        "RELATIONALS AND PREPOSITIONS",
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
                      onTap: () {Get.to(CategoryDetails(label:  "ADVERBIALS",table:'adverbials',isaudio:true),transition: Transition.rightToLeft);},

                      title: Text(
                        "ADVERBIALS",
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

