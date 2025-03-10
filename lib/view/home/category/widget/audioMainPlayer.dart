import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart'; // Import for the spinner

import '../../../../utils/themes.dart';

class AudioMainPlayerWidget extends StatefulWidget {

  final String url;

  AudioMainPlayerWidget({ required this.url});
  @override
  _AudioMainPlayerWidgetState createState() => _AudioMainPlayerWidgetState();
}

class _AudioMainPlayerWidgetState extends State<AudioMainPlayerWidget> {
  late AudioPlayer _audioPlayer;
  bool _isPlaying = false;
  String? _cachedAudioPath;
  bool _isDownloading = false;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _cacheAudio(widget.url);
  }

  Future<void> _cacheAudio(String url) async {
    setState(() {
      _isDownloading = true;
    });

    final directory = await getApplicationDocumentsDirectory();
    final fileName = _getFileNameFromUrl(url);
    final filePath = '${directory.path}/$fileName';
    final file = File(filePath);

    // Check if the file already exists
    if (await file.exists()) {
      setState(() {
        _cachedAudioPath = filePath;
        _isDownloading = false;
      });
      return;
    }

    // Download the audio file
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      await file.writeAsBytes(response.bodyBytes);
      setState(() {
        _cachedAudioPath = filePath;
        _isDownloading = false;
      });
    } else {
      // Handle the error, e.g., show a message to the user
      setState(() {
        _isDownloading = false;
      });
    }
  }

  String _getFileNameFromUrl(String url) {
    final bytes = utf8.encode(url);
    final digest = sha256.convert(bytes);
    return 'audio_${digest.toString()}.mp3';
  }

  void _playAudio() async {
    if (_cachedAudioPath == null) return;

    if (_isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play(_cachedAudioPath!, isLocal: true);
    }
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: _playAudio,
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color:Themes.getPrimaryColor(context), // Background color for better visibility
          ),
          child: _isDownloading
              ? SpinKitCircle(color:   Colors.grey[200],size: 30,) // Circular progress indicator
              : Icon(
            _cachedAudioPath != null ? Icons.volume_up : Icons.download, // Show download icon if not downloaded
            size: 30,
            color:Colors.grey[200]
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}
