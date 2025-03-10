// ignore_for_file: camel_case_types

import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharkhub/view/home/controller/home_controller.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';
import '../../paystack.dart';
import '../../res/common/app_methods.dart';
import '../../utils/themes.dart';

import '../../config/common.dart';


import 'package:flutter/services.dart';
import 'package:flutter/rendering.dart';

import 'category/Agriculture.dart';
import 'category/Environment.dart';
import 'category/GlossaryPage.dart';
import 'category/Grammar.dart';
import 'category/NumbersSymbolsPage.dart';
import 'category/Physio.dart';
import 'category/Socials.dart';

class AuthChecker extends StatefulWidget {
  @override
  _AuthCheckerState createState() => _AuthCheckerState();
}

class _AuthCheckerState extends State<AuthChecker> {
  String? _userId;
  String? _hasPaid;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initializeUserId();
  }

  Future<void> _initializeUserId() async {
    final prefs = await SharedPreferences.getInstance();
    _userId = prefs.getString('userId');

    if (_userId == null) {
      _userId = Uuid().v4();
      await prefs.setString('userId', _userId!);
      await createUserRecord(_userId!);
    }

    _checkPaymentStatus();
  }

  Future<void> createUserRecord(String userId) async {
    final response = await Supabase.instance.client
        .from('users')
        .upsert({'user_id': userId})
        .execute();

    // if (response.error != null) {
    //   print('Error creating user record: ${response.error.message}');
    // }
  }

  Future<void> _checkPaymentStatus() async {
    final prefs = await SharedPreferences.getInstance();
    _hasPaid = prefs.getString('hasPaid');

    // Handle success and error cases
    if (_hasPaid != null) {
      setState(() {
        _hasPaid = 'true';
      });
    } 
    else {
      setState(() {
        _hasPaid = 'false';
      });

    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
    return home(userId: _userId!, hasPaid: _hasPaid!);
  }
}

class home extends StatefulWidget {
  final String userId;
  final String hasPaid;

  home({required this.userId, required this.hasPaid});
  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> with WidgetsBindingObserver {
  final SupabaseClient supabase = Supabase.instance.client;
  int _unreadCount = 0;

  final ScrollController _scrollController = ScrollController();
  final HomeController controller = Get.put(HomeController());
  final GlobalKey _one = GlobalKey();
  final GlobalKey _two = GlobalKey();
  final GlobalKey _three = GlobalKey();
  final GlobalKey _four = GlobalKey();
  final GlobalKey _five = GlobalKey();

  @override
  void initState() {
    super.initState();
    _initializeData();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   Future.delayed(Duration(milliseconds: 200), () {
    //     _checkShowcaseStatus();
    //   });
    // });
    WidgetsBinding.instance.addObserver(this);
  }

  Future<void> _checkShowcaseStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool showcaseSeen = prefs.getBool('showcaseSeen') ?? false;

    if (!showcaseSeen) {
      Future.delayed(Duration(milliseconds: 200), () {
        _startShowcase();
      });
    }
  }

  void _startShowcase() {
    ShowCaseWidget.of(context)?.startShowCase([_one, _two, _three, _four, _five,]);
    _setShowcaseSeen();
  }

  Future<void> _setShowcaseSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('showcaseSeen', true);
  }

  void _scrollToCenter(GlobalKey key) {
    // final RenderBox renderBox = key.currentContext!.findRenderObject() as RenderBox;
    // final position = renderBox.localToGlobal(Offset.zero).dy;
    // final screenHeight = MediaQuery.of(context).size.height;
    // final offset = position - (screenHeight / 2 - renderBox.size.height / 2);
    // _scrollController.animateTo(
    //   offset + _scrollController.offset,
    //   duration: Duration(milliseconds: 500),
    //   curve: Curves.easeInOut,
    // );
  }
  Future<void> fetchUnreadCount() async {
    final response = await supabase
        .from('notification')
        .select('id')
        .eq('read', false)
        .execute();
    if (response.data == null) {
    }
    setState(() {
      _unreadCount = (response.data as List).length;
    });
  }

  void _setupSubscription() {
    supabase
        .from('notification')
        .stream(primaryKey: ['id'])
        .listen((List<Map<String, dynamic>> data) {
      fetchUnreadCount();
      _setupSubscription();
    });
  }



  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // controller.fetchData();
      // controller.fetchVerification();
      // _setupSubscription();
      print("Resume data");
    });
    print("Resume");
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      // Perform actions when app resumes from background
      print("App resumed from background----------------------");
    }
    if (state == AppLifecycleState.paused) {
      // Perform actions when app resumes from background
      print("App paused from background---------------------");
    }
  }

  int currentindex = 0;
  int selectIndex = 0;





  Future<void> _initializeData() async {
    final tableNames = [
      "common_expressions",
      "colors",
      "commerce",
      "domestic_environment",
      "education",
      "food_processing",
      "foods",
      "interpersonal_actions",
      "medical",
      "number",
      "order",
      "relationship",
      "plants",
      "professions",
      "social",
      "sports",
      "animals",
      "dimension",
      "emotions",
      "household_items",
      "music",
      "physical_features",
      "religion",
      "symbols",
      "time",
      "transport",
      "weather",
      "body_process",
      "external_part",
      "internal_part",
      "body_wears",
      "physical_actions",
      "feel",
      "mental_actions",
      "speech",
      "stage_life",
      "consonants",
      "vowels",
      "diphthongs",
      "questionWords",
      "questionWords",
      "relationalWords",
      "adverbials",
      "dictionary",


    ];

    for (var tableName in tableNames) {
      var box = await Hive.openBox(tableName);

      final response = await Supabase.instance.client
          .from(tableName)
          .select()
          .order('id', ascending: true)
          .execute();

      final data = response.data as List<dynamic>;

      box.put('data', data);
    }
  }


  @override
  Widget build(BuildContext context) {
    
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    // Get the current hour
    final hour = DateTime.now().hour;

    // Determine the appropriate greeting based on the hour
    String greeting;
    if (hour < 12) {
      greeting = 'Good Morning';
    } else if (hour < 18) {
      greeting = 'Good Afternoon';
    } else {
      greeting = 'Good Evening';
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Themes.getPrimaryColor(context),
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(Icons.menu,color:Colors.white)),
        title: Text("NSịÑI ỌRỌ",style: TextStyle(fontSize: 17, color:Colors.white)),
      ),
      body:  ListView(
        controller: _scrollController,
        children: [

          Container(
            height: 130.h,
            width: double.infinity,
            color:  Themes.getPrimaryColor(context),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 30.h,
                vertical: 4.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Hello, $greeting",
                    style: TextStyle(
                      color: Color(0xffffffff),
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  AppConstants.Height(10),
                  Text(
                    'What do are u learning today?',
                    style: TextStyle(fontSize: 17.sp, color: Color(0xffFFFFFF)),
                  ),
                ],
              ),
            ),
          ),
          Stack(
            children: [
              Container(
                height: 50.h,
                width: double.infinity,
                color:  Themes.getPrimaryColor(context),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20.h, ),
                child: Column(
                  children: [
                    CommonMethods.sizedBox(height: 10.h),
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
                              onTap: () {Get.to(GrammarPage(),transition: Transition.rightToLeft);},
                              leading: Container(
                                alignment: Alignment.center,
                                height: 50.h,
                                width: 50.h,

                                child:  Icon(Icons.language,size:20, color: Themes.getPrimaryColor(context)),
                              ),
                              title: Text(
                                "Grammar",
                                style: TextStyle(
                                  color: Themes.getTextColor(context),
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                                maxLines: 2,
                                textAlign: TextAlign.left,
                              ),
                              subtitle: CommonMethods.appTexts(
                                context,
                                'Master the Rules of Language.',
                                color: const Color(0xFF808080),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w300,
                                maxLines: 2,
                              ),
                              trailing: Icon(Icons.arrow_forward_ios,size: 15,),

                            ),
                          ),
                        )),

                    CommonMethods.sizedBox(height: 5.h),
                    animationFunction(
                        1,
                        slideDuration: Duration(milliseconds: 2200),
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
                              onTap: () {
                               widget.hasPaid =='true' ? Get.to(PhysioPage(),transition: Transition.rightToLeft):Get.to(PaymentPage(userId: widget.userId),transition: Transition.rightToLeft);
                              },
                              leading: Container(
                                alignment: Alignment.center,
                                height: 50.h,
                                width: 50.h,

                                child:  Icon(Icons.directions_run,size:20, color: Themes.getPrimaryColor(context)),
                              ),

                              title: CommonMethods.appTexts(
                                context,
                                'Physio',
                                color: Themes.getTextColor(context),
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600,
                              ),
                              subtitle: CommonMethods.appTexts(
                                context,
                                'Communicate with Your Body.',
                                color: const Color(0xFF808080),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w300,
                                maxLines: 2,
                              ),
                                trailing: widget.hasPaid =='true'? Icon(Icons.arrow_forward_ios,size: 16,):Icon(Icons.lock_outline,size: 16,),

                            ),
                          ),
                        )),

                    CommonMethods.sizedBox(height: 5.h),
                    animationFunction(
                        1,
                        slideDuration: Duration(milliseconds: 2200),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 5.h),
                          child: Card(
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
                                onTap: () {
                                  widget.hasPaid =='true'? Get.to(SocialsPage(),transition: Transition.rightToLeft):Get.to(PaymentPage(userId: widget.userId),transition: Transition.rightToLeft);

                                },
                                leading: Container(
                                  alignment: Alignment.center,
                                  height: 50.h,
                                  width: 50.h,

                                  child:  Icon(Icons.people,size:20, color: Themes.getPrimaryColor(context)),
                                ),
                                title: CommonMethods.appTexts(
                                  context,
                                  'Social',
                                  color: Themes.getTextColor(context),
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                                subtitle: CommonMethods.appTexts(
                                  context,
                                  'Engage in Meaningful Conversations.',
                                  color: const Color(0xFF808080),
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w300,
                                  maxLines: 2,
                                ),
                                trailing: widget.hasPaid =='true'? Icon(Icons.arrow_forward_ios,size: 16,):Icon(Icons.lock_outline,size: 16,),
                              ),
                            ),
                          ),
                        )),

                    CommonMethods.sizedBox(height: 5.h),
                    animationFunction(
                        1,
                        slideDuration: Duration(milliseconds: 2200),
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
                              onTap: () {
                                widget.hasPaid =='true'? Get.to(EnvrionmentPage(),transition: Transition.rightToLeft):Get.to(PaymentPage(userId: widget.userId),transition: Transition.rightToLeft);

                              },
                              leading: Container(
                                alignment: Alignment.center,
                                height: 50.h,
                                width: 50.h,

                                child:  Icon(Icons.eco,size:20, color: Themes.getPrimaryColor(context)),
                              ),

                              title: CommonMethods.appTexts(
                                context,
                                'Environment',
                                color: Themes.getTextColor(context),
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600,
                              ),
                              subtitle: CommonMethods.appTexts(
                                context,
                                'Describe the World Around You.',
                                color: const Color(0xFF808080),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w300,
                                maxLines: 2,
                              ),
                              trailing: widget.hasPaid =='true'? Icon(Icons.arrow_forward_ios,size: 16,):Icon(Icons.lock_outline,size: 16,),
                            ),
                          ),
                        )),

                    CommonMethods.sizedBox(height: 5.h),
                    animationFunction(
                        1,
                        slideDuration: Duration(milliseconds: 2200),
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
                              onTap: () {
                                widget.hasPaid =='true'? Get.to(AgriculturePage(),transition: Transition.rightToLeft):Get.to(PaymentPage(userId: widget.userId),transition: Transition.rightToLeft);

                              },
                              leading: Container(
                                alignment: Alignment.center,
                                height: 50.h,
                                width: 50.h,

                                child:  Icon(Icons.agriculture,size:20, color: Themes.getPrimaryColor(context)),
                              ),
                              title: CommonMethods.appTexts(
                                context,
                                'Agriculture',
                                color: Themes.getTextColor(context),
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600,
                              ),
                              subtitle: CommonMethods.appTexts(
                                context,
                                'Speak the Language of the Land',
                                color: const Color(0xFF808080),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w300,
                                maxLines: 2,
                              ),
                              trailing: widget.hasPaid =='true'? Icon(Icons.arrow_forward_ios,size: 16,):Icon(Icons.lock_outline,size: 16,),

                            ),
                          ),
                        )),
                    CommonMethods.sizedBox(height: 5.h),
                    animationFunction(
                        1,
                        slideDuration: Duration(milliseconds: 2200),
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
                              onTap: () {
                                widget.hasPaid =='true'? Get.to(NumbersSymbolsPage(),transition: Transition.rightToLeft):Get.to(PaymentPage(userId: widget.userId),transition: Transition.rightToLeft);

                              },

                              leading: Container(
                                alignment: Alignment.center,
                                height: 50.h,
                                width: 50.h,

                                child:  Icon(Icons.format_list_numbered,size:20, color: Themes.getPrimaryColor(context)),
                              ),
                              title: CommonMethods.appTexts(
                                context,
                                'Number and Symbols',
                                color: Themes.getTextColor(context),
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600,
                              ),
                              subtitle: CommonMethods.appTexts(
                                context,
                                'Understand Numbers and Symbols',
                                color: const Color(0xFF808080),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w300,
                                maxLines: 2,
                              ),
                              trailing: widget.hasPaid =='true'? Icon(Icons.arrow_forward_ios,size: 16,):Icon(Icons.lock_outline,size: 16,),

                            ),
                          ),
                        )),
                    CommonMethods.sizedBox(height: 5.h),
                    animationFunction(
                        1,
                        slideDuration: Duration(milliseconds: 2200),
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
                              onTap: () {
                                widget.hasPaid =='true'? Get.to(GlossaryPage(),transition: Transition.rightToLeft):Get.to(PaymentPage(userId: widget.userId),transition: Transition.rightToLeft);

                              },
                              leading: Container(
                                alignment: Alignment.center,
                                height: 50.h,
                                width: 50.h,

                                child:  Icon(Icons.book,size:20, color: Themes.getPrimaryColor(context)),
                              ),
                              title: CommonMethods.appTexts(
                                context,
                                'Glossary',
                                color: Themes.getTextColor(context),
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w600,
                              ),
                              subtitle: CommonMethods.appTexts(
                                context,
                                'Your Essential Language Reference',
                                color: const Color(0xFF808080),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w300,
                                maxLines: 2,
                              ),
                              trailing: widget.hasPaid =='true'? Icon(Icons.arrow_forward_ios,size: 16,):Icon(Icons.lock_outline,size: 16,),

                            ),
                          ),
                        )),

                    CommonMethods.sizedBox(height: 20.h),

                  ],
                ),
              ),
            ],
          ),

        ],
      ),

    );
  }

}
// Helper function to convert img.Image to ui.Image
// Image imgToImage(img.Image image) {
//   final completer = Completer<Image>();
//   ui.decodeImageFromPixels(
//     image.getBytes(),
//     image.width,
//     image.height,
//     ui.PixelFormat.rgba8888,
//         (ui.Image img) {
//       completer.complete(img);
//     },
//   );
//   return completer.future as Image;
// }