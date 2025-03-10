import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../paystack.dart';
import '../../../res/common/app_methods.dart';
import '../../../utils/themes.dart';

class DictionaryPage extends StatefulWidget {
  const DictionaryPage({super.key});

  @override
  State<DictionaryPage> createState() => _DictionaryPageState();
}

class _DictionaryPageState extends State<DictionaryPage>
    with WidgetsBindingObserver {
  final _searchController = TextEditingController();
  List<Map<String, dynamic>> _allData = [];
  List<Map<String, dynamic>> _searchResults = [];
  String? _userId;
  String? _hasPaid ;
  bool _isLoading = true;

  final Map<String, Box> _hiveBoxes = {
    'common_expressions': Hive.box('common_expressions'),
    'colors': Hive.box('colors'),
    'commerce': Hive.box('commerce'),
    'domestic_environment': Hive.box('domestic_environment'),
    'education': Hive.box('education'),
    'food_processing': Hive.box('food_processing'),
    'foods': Hive.box('foods'),
    'interpersonal_actions': Hive.box('interpersonal_actions'),
    'medical': Hive.box('medical'),
    'number': Hive.box('number'),
    'order': Hive.box('order'),
    'relationship': Hive.box('relationship'),
    'plants': Hive.box('plants'),
    'professions': Hive.box('professions'),
    'social': Hive.box('social'),
    'sports': Hive.box('sports'),
    'animals': Hive.box('animals'),
    'dimension': Hive.box('dimension'),
    'emotions': Hive.box('emotions'),
    'household_items': Hive.box('household_items'),
    'music': Hive.box('music'),
    'physical_features': Hive.box('physical_features'),
    'religion': Hive.box('religion'),
    'symbols': Hive.box('symbols'),
    'time': Hive.box('time'),
    'transport': Hive.box('transport'),
    'weather': Hive.box('weather'),
    'body_process': Hive.box('body_process'),
    'external_part': Hive.box('external_part'),
    'internal_part': Hive.box('internal_part'),
    'body_wears': Hive.box('body_wears'),
    'physical_actions': Hive.box('physical_actions'),
    'feel': Hive.box('feel'),
    'mental_actions': Hive.box('mental_actions'),
    'speech': Hive.box('speech'),
    'stage_life': Hive.box('stage_life'),
  };

  @override
  void initState() {
    super.initState();
    _loadData();
    _checkPaymentStatus();
  }

  void _loadData() async {
    final allData = <Map<String, dynamic>>{};
    try {
      for (var box in _hiveBoxes.values) {
        for (var element in box.values) {
          if (element is Map) {
            allData.add(Map<String, dynamic>.from(element));
          } else if (element is List) {
            for (var item in element) {
              if (item is Map) {
                allData.add(Map<String, dynamic>.from(item));
              }
            }
          }
        }
      }

      // Remove duplicates based on JSON representation
      final uniqueData = allData.toSet().toList();

      setState(() {
        _allData = uniqueData;
        _searchResults = uniqueData;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error loading data: $e')),
      );
    }
  }

  void _searchData() {
    final query = _searchController.text.toLowerCase();
    final results = <Map<String, dynamic>>{};

    for (var item in _allData) {
      if (item.values
          .any((value) => value.toString().toLowerCase().contains(query))) {
        results.add(item);
      }
    }

    setState(() {
      _searchResults = results.toList();
    });
  }
  Future<void> _checkPaymentStatus() async {
    final prefs = await SharedPreferences.getInstance();
    _hasPaid = prefs.getString('hasPaid');
    _userId = prefs.getString('userId');
    // Handle success and error cases
    if (_hasPaid != null) {
      setState(() {
        _hasPaid = 'true';
      });
    } else {
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
    return Scaffold(
      backgroundColor: Colors.white,
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
            color: Colors.white
          ),),
        title: Text("Dictionary".toUpperCase(),style: GoogleFonts.notoSans(fontSize: 17, color:Colors.white)),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: _hasPaid =='true'? FutureBuilder(
          future: Hive.openBox('dictionary'),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              var box = snapshot.data as Box?;
              var data = box?.get('data') as List<dynamic>?;

              if (data == null || data.isEmpty) {
                return Center(child: Text('No data available'));
              }

              List<Map<String, dynamic>> typedData = data
                  .map((e) => Map<String, dynamic>.from(e as Map))
                  .toList();

              return ListView.builder(
                itemCount: typedData.length,
                itemBuilder: (context, index) {
                  return animationFunction(
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
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailPage(
                                  data: typedData,
                                  initialIndex: index,
                                ),
                              ),
                            );
                          },
                          contentPadding: EdgeInsets.zero,
                          minLeadingWidth: 4,
                          horizontalTitleGap: 4,
                          title: Text(
                            data[index]['ENGLISH'] ?? '...',
                            style: GoogleFonts.notoSans(
                              color: Themes.getTextColor(context),
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 2,
                            textAlign: TextAlign.left,
                          ),
                          subtitle: Text(
                            data[index]['ỌRỌ'] ?? '...',
                            style: GoogleFonts.notoSans(
                              color: Color(0xFF808080),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w300,
                            ),
                            maxLines: 2,
                            textAlign: TextAlign.left,
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            size: 18,
                            color: Themes.getPrimaryColor(context),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ):Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment:MainAxisAlignment.center,
            crossAxisAlignment :CrossAxisAlignment.center,
            children: [
              Image.asset(
                  "assets/images/img_lock.png",
                  height: 300,
              ),
              SizedBox(height: 10,),
              Text('This page is Locked', style: TextStyle(
              color: Themes.getTextColor(context),
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
        ),),
              SizedBox(height: 20,),
              Card(
                color: Themes.getPrimaryColor(context).withOpacity(0.9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                child: GestureDetector(
                  onTap: () {
                    Get.to(PaymentPage(userId: _userId!),transition: Transition.rightToLeft);
                  },
                  child: ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        // Center(
                        //     child: Icon(
                        //       Icons.send,
                        //       color: Colors.white,
                        //     )),
                        // SizedBox(
                        //   width: MediaQuery.of(context).size.width * 0.03,
                        // ),
                        Center(
                            child: Text(
                              "Proceed to make payment",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.notoSans(
                                color: Colors.white,),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class DetailPage extends StatefulWidget {
  final List<Map<String, dynamic>> data;
  final int initialIndex;

  DetailPage({required this.data, required this.initialIndex});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late PageController _pageController;

  bool _isPlaying = false;
  late String _cachedAudioPath;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.initialIndex);

  }


  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Themes.getCardColor(context),
        elevation: 0.5,
        centerTitle: true,
        // title: Text(
        //   'Detail Page',
        //   style: GoogleFonts.notoSans(
        //     color: Themes.getTextColor(context),
        //   ),
        // ),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.data.length,
              itemBuilder: (context, index) {
                print( widget.data);
                return Container(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(
                        '${widget.data[index]['ENGLISH'] ?? ''}',
                        style: GoogleFonts.notoSans(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        '${widget.data[index]['ỌRỌ'] ?? ''}',
                        style: GoogleFonts.notoSans(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                          color: Themes.getPrimaryColor(context),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Divider(),
                      Text(
                        'Sentence:',
                        style: GoogleFonts.notoSans(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text(
                        '${widget.data[index]['SENTENCE'] ?? ''}',
                        style: GoogleFonts.notoSans(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),

                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        if (_pageController.page! > 0) {
                          _pageController.previousPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                        }
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.arrow_circle_left_outlined,
                            size: 30,
                            color: Themes.getTextColor(context),
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Previous',
                            style: GoogleFonts.notoSans(color: Themes.getTextColor(context)),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if (_pageController.page! < widget.data.length - 1) {
                          _pageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                        }
                      },
                      child: Row(
                        children: [
                          SizedBox(width: 10),
                          Text(
                            'Next',
                            style: GoogleFonts.notoSans(color: Themes.getTextColor(context)),
                          ),
                          SizedBox(width: 10),
                          Icon(
                            Icons.arrow_circle_right_outlined,
                            size: 30,
                            color: Themes.getTextColor(context),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}