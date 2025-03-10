import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:external_app_launcher/external_app_launcher.dart';

import '../../../res/common/app_methods.dart';
import '../../../utils/themes.dart';

class About extends StatelessWidget {
  About();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Themes.getPrimaryColor(context),
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child:  Image.asset(
            "assets/images/arrow-narrow-left (1).png",
            scale: 3,
            color:Colors.white,
          ),),
        title: Text("Settings".toUpperCase(),style: GoogleFonts.notoSans(fontSize: 17, color:Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
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
                        onTap: () {Get.to(Aboutapp(),transition: Transition.rightToLeft);},

                        title: Text(
                          "ABOUT THE APP",
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

              const SizedBox(height: 10),
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
                        onTap: () {Get.to(Crew(),transition: Transition.rightToLeft);},

                        title: Text(
                          "THE CREW",
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

              const SizedBox(height: 10),
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
                        onTap: () {Get.to(Feedback(),transition: Transition.rightToLeft);},

                        title: Text(
                          "FEEDBACK",
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

              const SizedBox(height: 10),
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
                        onTap: () {Get.to(SUGEST(),transition: Transition.rightToLeft);},

                        title: Text(
                          "SUGGEST A WORD",
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

              const SizedBox(height: 30),

            ],
          ),
        ),
      ),
    );
  }
}

class Aboutapp extends StatelessWidget {
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
          title: Text("About",style: GoogleFonts.notoSans(fontSize: 17, color:Themes.getTextColor(context))),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text('ABOUT THE PRODUCT',
                          style: GoogleFonts.notoSans(
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 20.0, bottom: 40.0),
                        child: RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'INTRODUCTION\n\n',
                                  style: GoogleFonts.notoSans(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                              TextSpan(
                                  text:
                                  'NSỊÑI ỌRỌ is a registered language learning software developed by Justice Effiong Isaac Nkereuwem Centre for the Development of Ọrọ Cultural Heritage (JEIN-C-DOCH). The application facilitates the learning of Ọrọ language which is the mother tongue of the Ọrọ people that inhabit the south-eastern region of Akwa Ibom State, Nigeria.\n\n',
                                  style: GoogleFonts.notoSans(fontSize: 16, color: Colors.black)),
                              TextSpan(
                                  text:
                                  'NSỊÑI ỌRỌ contains over 2,000 Ọrọ words, most of which are voiced. Some of its sections also have pictorial illustrations. The product is endorsed by Ọrọ Language Association (ỌLA), and its contents are based on the Ọrọ language orthography developed by ỌLA.\n\n',
                                  style: GoogleFonts.notoSans(fontSize: 16, color: Colors.black)),
                              TextSpan(
                                  text: 'CONTENTS\n',
                                  style: GoogleFonts.notoSans(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                              TextSpan(
                                  text:
                                  "This application is segmented into the following sections: \n\n",
                                  style: GoogleFonts.notoSans(fontSize: 16, color: Colors.black)),
                              TextSpan(
                                  text: '(i)	GRAMMAR:\n',
                                  style: GoogleFonts.notoSans(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                              TextSpan(
                                  text:
                                  "Concerned with the fundamentals of the language. It is divided into: Consonants; Vowels; Diphthongs & Triphthongs; Pronouns; and Question Words. \n\n",
                                  style: GoogleFonts.notoSans(fontSize: 16, color: Colors.black)),
                              TextSpan(
                                  text: '(ii)	PHYSIO:\n',
                                  style: GoogleFonts.notoSans(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                              TextSpan(
                                  text:
                                  "Concerned with the human body. It is divided into: Internal Body Parts; External Body Parts; and Body Processes. \n\n",
                                  style: GoogleFonts.notoSans(fontSize: 16, color: Colors.black)),
                              TextSpan(
                                  text: '(iii)	SOCIAL: \n',
                                  style: GoogleFonts.notoSans(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                              TextSpan(
                                  text:
                                  "Concerned with our interactions with others. It is divided into: Stages of Life; Relationship; Professions; Interpersonal Actions; Emotions; Music; Sports; and Common Expressions.\n\n ",
                                  style: GoogleFonts.notoSans(fontSize: 16, color: Colors.black)),
                              TextSpan(
                                  text: '(iv)	ENVIRONMENT:\n',
                                  style: GoogleFonts.notoSans(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                              TextSpan(
                                  text:
                                  "Concerned with our immediate and remote environment. It is divided into: Household Items; Domestic Environment; Physical Features; Weather; Time; Dimension; and Colour.\n\n",
                                  style: GoogleFonts.notoSans(fontSize: 16, color: Colors.black)),
                              TextSpan(
                                  text: '(v)	AGRICULTURE: \n',
                                  style: GoogleFonts.notoSans(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                              TextSpan(
                                  text:
                                  "It is divided into: Animals; Plants; Food & Drinks; and Food Processing.\n\n",
                                  style: GoogleFonts.notoSans(fontSize: 16, color: Colors.black)),
                              TextSpan(
                                  text: '(vi)	NUMBERS AND SYMBOLS:\n',
                                  style: GoogleFonts.notoSans(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                              TextSpan(
                                  text:
                                  "Concerned with numerals and measurement. It is divided into: Counting of Numbers; Common Arithmetical Symbols; and Orders & Quantifiers.\n\n",
                                  style: GoogleFonts.notoSans(fontSize: 16, color: Colors.black)),
                              TextSpan(
                                  text: '(vii)	GLOSSARY: \n',
                                  style: GoogleFonts.notoSans(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                              TextSpan(
                                  text:
                                  "It contains vocabularies of various fields such as Education; Religion & Culture; Commerce & Transport; Medical; What We Wear; Physical and Mental Actions; Feel and Speech. It is the only section where words are not voiced. \n\n",
                                  style: GoogleFonts.notoSans(fontSize: 16, color: Colors.black)),
                              TextSpan(
                                  text: '(viii)	HYMNS: \n',
                                  style: GoogleFonts.notoSans(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                              TextSpan(
                                  text:
                                  "It contains the Ọrọ Anthem and 10 popular hymns rendered in Ọrọ language. \n\n",
                                  style: GoogleFonts.notoSans(fontSize: 16, color: Colors.black)),
                              TextSpan(
                                  text: '\nALL RIGHTS RESERVED\n\n',
                                  style: GoogleFonts.notoSans(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                              TextSpan(
                                  text: 'CONTACT\n',
                                  style: GoogleFonts.notoSans(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                              TextSpan(
                                  text:
                                  "+1 678-428-3374; +1 706-536-7235; \n+1 404-661-4689; +234 809-189-8308;\n+234 902-659-5853; nsinioro@gmail.com\n\n",
                                  style: GoogleFonts.notoSans(fontSize: 16, color: Colors.black)),
                            ],
                          ),
                        )),
                  ],
                ))));
  }
}

class Crew extends StatelessWidget {
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
          title: Text("CREW MEMBERS",style: GoogleFonts.notoSans(fontSize: 17, color:Themes.getTextColor(context))),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text('THE CREW',
                          style: GoogleFonts.notoSans(
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 20.0, bottom: 40.0),
                        child: RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'PRODUCER \n',
                                  style: GoogleFonts.notoSans(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                              TextSpan(
                                  text:
                                  'Justice Effiong Isaac Nkereuwem Centre for the Development of Ọrọ Cultural Heritage \n(JEIN-C-DỌCH).\n\n',
                                  style: GoogleFonts.notoSans(fontSize: 16, color: Colors.black)),

                              TextSpan(
                                  text: 'FACILITATOR \n',
                                  style: GoogleFonts.notoSans(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                              TextSpan(
                                  text: "Mr. Nukak Nkereuwem. \n\n",
                                  style: GoogleFonts.notoSans(fontSize: 16, color: Colors.black)),
                              TextSpan(
                                  text: 'DEVELOPERS \n',
                                  style: GoogleFonts.notoSans(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                              TextSpan(
                                  text: "Rex Bassey; Idara Moses. \n\n",
                                  style: GoogleFonts.notoSans(fontSize: 16, color: Colors.black)),
                              TextSpan(
                                  text: 'CONTRIBUTORS\n',
                                  style: GoogleFonts.notoSans(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                              TextSpan(
                                  text:
                                  "Dr. Golden Ekpo; Stella & Schola Bassey; Matthew Ekpe; members, Ọrọ Language Association. \n\n",
                                  style: GoogleFonts.notoSans(fontSize: 16, color: Colors.black)),
                              TextSpan(
                                  text: 'APPRECIATION \n',
                                  style: GoogleFonts.notoSans(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                              TextSpan(
                                  text:
                                  "Rt. Hon. (Chief) Uno E. Uno; Hon. (Crown Prince) Chris Abasieyo; Engr. Etekamba Willie; Micheal Atansek. \n\n",
                                  style: GoogleFonts.notoSans(fontSize: 16, color: Colors.black)),
                              TextSpan(
                                  text: 'DEDICATION \n',
                                  style: GoogleFonts.notoSans(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
                              TextSpan(
                                  text:
                                  "Dedicated to departed Ọrọ language activists/enthusiasts.\n\n",
                                  style: GoogleFonts.notoSans(fontSize: 16, color: Colors.black)),
                            ],
                          ),
                        )),
                  ],
                ))));
  }
}

class Feedback extends StatefulWidget {
  @override
  _FeedbackState createState() => _FeedbackState();
}

class _FeedbackState extends State<Feedback> {
  launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchURLMail() async {
    const url =
        'mailto:nsinioro@gmail.com?subject=LifePlusApp&body=Your sugestions%20or Feedback..';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  late String name;
  late String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Themes.getCardColor(context),
        elevation: 0.5,
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Image.asset("assets/images/arrow-narrow-left (1).png",scale: 3,color: Themes.getTextColor(context),)),
        title: Text('FEEDBACK',style: GoogleFonts.notoSans(fontSize: 17, color:Themes.getTextColor(context))),
      ),

      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 14.0, horizontal: 13),
              child: Text(
                "Leave us a message and we will get in contact with you as soon as possible. ",
                style: GoogleFonts.notoSans(
                  fontSize: 17.5,
                  height: 1.3,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                onChanged: (val) {
                  if (val != null || val.length > 0) name = val;
                },
                controller: t1,
                decoration: InputDecoration(
                  fillColor: Color(0xffe6e6e6),
                  filled: true,
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  hintText: 'Your name',
                  hintStyle: GoogleFonts.notoSans(
                      color: Colors.blueGrey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                    borderSide: BorderSide(color:  Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                    borderSide: BorderSide(color:  Colors.grey),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.0001,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                onChanged: (val) {
                  if (val != null || val.length > 0) message = val;
                },
                textAlign: TextAlign.start,
                controller: t2,
                decoration: InputDecoration(
                  fillColor: Color(0xffe6e6e6),
                  filled: true,
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 35, horizontal: 20),
                  hintText: 'Your message',
                  hintStyle: GoogleFonts.notoSans(
                    color: Colors.blueGrey,

                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(17),
                    ),
                    borderSide: BorderSide(color:  Colors.grey),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(17),
                    ),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(17),
                    ),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Card(
              color: Color(0xFFC2261F),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    t1.clear();
                    t2.clear();
                    launchUrl(
                        "mailto:nsinioro@gmail.com?subject=From $name&body=$message");
                  });
                },
                child: ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(
                          child: Icon(
                            Icons.send,
                            color: Colors.white,
                          )),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.03,
                      ),
                      Center(
                          child: Text(
                            "Send",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.notoSans(
                                color: Colors.white,),
                          )),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
            ),
          ],
        ),
      ),
    );
  }
}
class SUGEST extends StatefulWidget {
  @override
  _SUGESTState createState() => _SUGESTState();
}

class _SUGESTState extends State<SUGEST> {
  launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchURLMail() async {
    const url =
        'mailto:nsinioro@gmail.com?subject=LifePlusApp&body=Your sugestions%20or Feedback..';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  late String name;
  late String message;

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
        title: Text('SUGGEST WORD(S)',style: GoogleFonts.notoSans(fontSize: 17, color:Themes.getTextColor(context))),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(

              padding:
              const EdgeInsets.symmetric(vertical: 14.0, horizontal: 13),
              child: Text(
                "Please you could suggest word(s) not contained in this App. Thank you.",
                style: GoogleFonts.notoSans(
                  fontSize: 17.5,
                  height: 1.3,

                ),
                textAlign: TextAlign.justify,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                onChanged: (val) {
                  if (val != null || val.length > 0) name = val;
                },
                controller: t1,
                decoration: InputDecoration(
                  fillColor: Color(0xffe6e6e6),
                  filled: true,
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  hintText: 'ENGLISH',
                  hintStyle: GoogleFonts.notoSans(
                      color: Colors.blueGrey, ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.0001,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                onChanged: (val) {
                  if (val != null || val.length > 0) message = val;
                },
                textAlign: TextAlign.start,
                controller: t2,
                decoration: InputDecoration(
                  fillColor: Color(0xffe6e6e6),
                  filled: true,
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 35, horizontal: 20),
                  hintText: 'ỌRỌ',
                  hintStyle: GoogleFonts.notoSans(
                    color: Colors.blueGrey,

                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(17),
                    ),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(17),
                    ),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(17),
                    ),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Card(
              color: Color(0xFFC2261F),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    t1.clear();
                    t2.clear();
                    launchUrl(
                        "mailto:nsinioro@gmail.com?subject=From $name&body=$message");
                  });
                },
                child: ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(
                          child: Icon(
                            Icons.send,
                            color: Colors.white,
                          )),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.03,
                      ),
                      Center(
                          child: Text(
                            "Send",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.notoSans(
                                color: Colors.white),
                          )),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
            ),
          ],
        ),
      ),
    );
  }
}