
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:sharkhub/utils/themes.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../Dark mode.dart';
import '../Dictionary/main/notification_page.dart';
import '../Settings/main/settings.dart';

import '../hymns/main/hymns.dart';

import 'home.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int currentIndex = 0;
  List<Widget> myChildren = [
    AuthChecker(),
    DictionaryPage(),
    About(),
  ];
  @override
  void initState() {
    _initializeData();
    super.initState();
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
      "dictionary",


    ];

    for (var tableName in tableNames) {
      var box = await Hive.openBox(tableName);

      final response = await Supabase.instance.client
          .from(tableName)
          .select()
          .execute();

      final data = response.data as List<dynamic>;

      box.put('data', data);
    }
  }
  ColorNotifire notifier = ColorNotifire();
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: Align(
      //   alignment: const Alignment(0,0.99),
      //   child: FloatingActionButton(
      //     onPressed: () {
      //       setState(() {
      //         currentIndex = 2;
      //       });
      //     },
      //     backgroundColor: const Color(0xff6B39F4),
      //     child: const Image(
      //         image: AssetImage("assets/images/Floating action.png"),
      //         height: 20,
      //         width: 20,
      //     ),
      //   ),
      // ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor:  Themes.getCardColor(context),
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        elevation: 0,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        selectedItemColor: Themes.getPrimaryColor(context),
        unselectedItemColor: Themes.getTextColor(context),
        unselectedLabelStyle: const TextStyle(
          fontFamily: "Manrope_bold",
          fontSize: 10,
          letterSpacing: 0.2,
        ),
        selectedLabelStyle:  TextStyle(
          fontFamily: "Manrope_bold",
          fontSize: 10,
          fontWeight: FontWeight.w700,
          color: notifier.textColor,
          letterSpacing: 0.2,
        ),
        items: [
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 8),
      child: Icon(
        Icons.home,
        color:Themes.getTextColor(context),
      ),
              ),
              activeIcon: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Icon(
                  Icons.home,
                  color:Themes.getPrimaryColor(context),
                ),
              ),
              label: "Home",
          ),
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Icon(
                  Icons.book_outlined,
                  color:Themes.getTextColor(context),
                ),
              ),
              activeIcon: Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child:  Icon(
                  Icons.book_outlined,
                  color:Themes.getPrimaryColor(context),
                ),
              ),
              label: "Dictionary"),


          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Icon(
                  Icons.info_outline,
                  color:Themes.getTextColor(context),
                ),
              ),
              activeIcon: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Icon(
                  Icons.info_outline,
                  color:Themes.getPrimaryColor(context),
                ),
              ),
              label: "About"),
        ],
      ),
      body: myChildren.elementAt(currentIndex),
    );
  }
}
