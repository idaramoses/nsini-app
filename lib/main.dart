import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sharkhub/res/constant/app_routes_path.dart';
import 'package:sharkhub/utils/data_fetcher.dart';


import 'package:sharkhub/view/home/controller/home_controller.dart';

import 'package:showcaseview/showcaseview.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../utils/themes.dart';
import 'data/service_api.dart';



Future<void> main() async {
  await Supabase.initialize(
    url: 'https://obzfbnbzdtychidmhrtm.supabase.co',
    anonKey:
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9iemZibmJ6ZHR5Y2hpZG1ocnRtIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjEzMDc3NzksImV4cCI6MjAzNjg4Mzc3OX0.54rbyYV4vczNhoebggxaivcjs1nnhCBLR9_OMQ6GCGo',
  );
  // Initialize Hive

  await Hive.initFlutter();
  await Hive.openBox('common_expressions');
  await Hive.openBox('colors');
  await Hive.openBox('commerce');
  await Hive.openBox('domestic_environment');
  await Hive.openBox('education');
  await Hive.openBox('food_processing');
  await Hive.openBox('foods');
  await Hive.openBox('interpersonal_actions');
  await Hive.openBox('medical');
  await Hive.openBox('number');
  await Hive.openBox('order');
  await Hive.openBox('relationship');
  await Hive.openBox('plants');
  await Hive.openBox('professions');
  await Hive.openBox('social');
  await Hive.openBox('sports');
  await Hive.openBox('animals');
  await Hive.openBox('dimension');
  await Hive.openBox('emotions');
  await Hive.openBox('household_items');
  await Hive.openBox('music');
  await Hive.openBox('physical_features');
  await Hive.openBox('religion');
  await Hive.openBox('symbols');
  await Hive.openBox('time');
  await Hive.openBox('transport');
  await Hive.openBox('weather');
  await Hive.openBox('body_process');
  await Hive.openBox('external_part');
  await Hive.openBox('internal_part');
  await Hive.openBox('body_wears');
  await Hive.openBox('physical_actions');
  await Hive.openBox('feel');
  await Hive.openBox('mental_actions');
  await Hive.openBox('speech');
  await Hive.openBox('stage_life');

  await Hive.openBox('consonants');
  await Hive.openBox('vowels');
  await Hive.openBox('diphthongs');
  await Hive.openBox('questionWords');
  await Hive.openBox('pronouns');
  await Hive.openBox('relationalWords');
  await Hive.openBox('adverbials');

  runApp(const MyApp());
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
}
final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return ShowCaseWidget(
          builder: Builder(
            builder: (context) => GetMaterialApp(
              title: 'Nsini',
              debugShowCheckedModeBanner: false,
              theme: Themes.lightTheme,
              routes: RoutesPath.routes,
              initialBinding: BindingsBuilder(() {
                Get.put(SuperbaseService());
                Get.put(HomeController());
              }),
              initialRoute: RoutesPath.splashPage,
              onGenerateRoute: (settings) {
                return RoutesPath.routesFactory(settings);
              },
            ),
          ),
        );
      },
    );
  }
}
