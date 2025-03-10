import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hive/hive.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

import '../../Dark mode.dart';
import '../../data/pref_data.dart';
import '../../res/common/app_methods.dart';
import '../../res/constant/app_routes_path.dart';
import '../../res/constant/app_strings.dart';
import '../../utils/data_fetcher.dart';
import '../../utils/themes.dart';
import '../Home/bottom.dart';
import 'onboarding_1.dart';



class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    _initializeData();
    super.initState();
  }

  init() async {
    bool isLogin = await PrefData.getLogin();
    try {
      await initializeHive(); // Open Hive boxes
      await fetchAndCacheAllData(); // Fetch and cache all data
    } catch (e) {
      print('Error initializing data: $e');
    }
    // Timer(const Duration(seconds: 3), () {
    //   // if (isLogin) {
    //   //   // Get.toNamed(RoutesPath.onBoardingPage);
    //   //   Get.off(LogInPage());
    //   // } else {
    //   //   Get.off(BottomBarScreen());
    //   // }
    //   Get.off(BottomBarScreen());
    // });
    Get.off(BottomBarScreen());
  }


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


    ];

    for (var tableName in tableNames) {
      final box = await Hive.openBox(tableName);

      if (box.get('data') != null) {
        // Data already exists in Hive, use it
        print('Using cached data from Hive for $tableName');
      } else {
        // Data doesn't exist in Hive, fetch from Supabase
        final response = await Supabase.instance.client
            .from(tableName)
            .select()
            .order('id', ascending: true)
            .execute();

        if (response.data != null) {
          final data = response.data as List<dynamic>;
          box.put('data', data);
          print('Fetched data from Supabase and cached it in Hive for $tableName');
        } else {
          print('Error fetching data from Supabase for $tableName');
        }
      }
    }

    Timer(const Duration(seconds: 3), () {
      Get.off(BottomBarScreen());
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(),
          Center(
            child: Column(
              children: [
                Column(
                  children: [
                    Center(
                      child: CommonMethods.imagesOfApp(
                        AppImages.splashLogo,
                        height: 300.h,


                      ),
                    ),
                    CommonMethods.sizedBox(height: 11.h),
                  ],
                ),
              ],
            ),
          ),
          SpinKitCircle(color: Themes.getPrimaryColor(context)),

        ],
      ),
    );
  }
}
