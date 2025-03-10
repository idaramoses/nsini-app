import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../res/common/app_methods.dart';
import '../../utils/data_fetcher.dart';
import '../../utils/themes.dart';
import 'category/widget/audioPlayer.dart';

class CategoryDetails extends StatefulWidget {
  final String label;
  final String table;
  final bool isaudio;

  CategoryDetails({
    required this.label,
    required this.table,
    required this.isaudio,
  });

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  late Future<List<Map<String, dynamic>>> _dataFuture;

  // @override
  // void initState() {
  //   super.initState();
  //   _dataFuture = _fetchData();
  // }

  Future<List<Map<String, dynamic>>> _fetchData() async {
    try {
      return await getCachedData(widget.table);
    } catch (e) {
      print('Fetching from cache failed: $e');
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Themes.getCardColor(context),
        elevation: 0.5,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Image.asset(
            "assets/images/arrow-narrow-left (1).png",
            scale: 3,
            color: Themes.getTextColor(context),
          ),
        ),
        title: Text(
          widget.label.toUpperCase(),
          style: GoogleFonts.notoSans(
            fontSize: 17,
            color: Themes.getTextColor(context),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: FutureBuilder(
          future: Hive.openBox(widget.table),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              final box = snapshot.data;
              final data = box?.get('data');

              return ListView.builder(
                itemCount: data.length,
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
                          trailing:  data[index]['audio'] ==null|| data[index]['audio'] =='NULL'|| data[index]['audio'] ==''?Container(height:40,width:40): Container(height:40,width:40, child:Center(child: AudioPlayerWidget(url: data[index]['audio'],)))

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
        ),
      ),
    );
  }
}
