import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../../../../res/common/app_methods.dart';
import '../../../../utils/data_fetcher.dart';
import '../../../../utils/themes.dart';
import 'audioMainPlayer.dart';
import 'audioPlayer.dart';

class Consonants extends StatefulWidget {
  const Consonants({super.key});

  @override
  State<Consonants> createState() => _ConsonantsState();
}

class _ConsonantsState extends State<Consonants> {
  late Future<List<Map<String, dynamic>>> _dataFuture;

  @override
  void initState() {
    super.initState();
    _dataFuture = _fetchData();
  }

  Future<List<Map<String, dynamic>>> _fetchData() async {
    try {
      return await getCachedData('consonants');
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
          'Consonants',
          style: GoogleFonts.notoSans(
            fontSize: 17,
            color: Themes.getTextColor(context),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: FutureBuilder(
          future: Hive.openBox('consonants'),
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
                            '${typedData[index]['Consonant'] ?? ''}${typedData[index]['Sound'] ?? ''}',
                            style: GoogleFonts.notoSans(
                              color: Themes.getTextColor(context),
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
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
  late AudioPlayer _audioPlayer;
  bool _isPlaying = false;
  late String _cachedAudioPath;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.initialIndex);
    _audioPlayer = AudioPlayer();

  }

  Future<void> _cacheAudio(String url) async {
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/audio.mp3';
    final file = File(filePath);

    // Check if the file already exists
    if (await file.exists()) {
      setState(() {
        _cachedAudioPath = filePath;
      });
      return;
    }

    // Download the audio file
    final response = await http.get(Uri.parse(url));
    await file.writeAsBytes(response.bodyBytes);
    setState(() {
      _cachedAudioPath = filePath;
    });
  }

  void _playAudio() async {
    if (_cachedAudioPath == null) return;

    if (_isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(_cachedAudioPath, isLocal: true);
    }
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }
  @override
  void dispose() {
    _pageController.dispose();
    _audioPlayer.dispose();
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          '${widget.data[index]['Consonant'] ?? ''}${widget.data[index]['Sound'] ?? ''}',
                          style: GoogleFonts.notoSans(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          '${widget.data[index]['English'] ?? ''}',
                          style: GoogleFonts.notoSans(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Themes.getPrimaryColor(context),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 300,
                        width: double.infinity,
                        child: CachedNetworkImage(
                          imageUrl: widget.data[index]['img'] ?? '',
                          placeholder: (context, url) => CircularProgressIndicator(),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                        ),
                      ),
                     Spacer(),

                      widget.data[index]['audio'] ==null|| widget.data[index]['audio'] =='NULL'|| widget.data[index]['audio'] ==''?Container():  Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(height:50,width:50, child:Center(child: AudioMainPlayerWidget(url: widget.data[index]['audio'],)))

                        ],
                      ),
                      // Add more details as needed
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
