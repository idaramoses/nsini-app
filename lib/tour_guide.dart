import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';

class TourGuide extends StatefulWidget {
  @override
  _TourGuideState createState() => _TourGuideState();
}

class _TourGuideState extends State<TourGuide> {
  final GlobalKey _one = GlobalKey();
  final GlobalKey _two = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(milliseconds: 200), () {
        ShowCaseWidget.of(context)?.startShowCase([_one, _two]);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ShowcaseView Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Showcase(
              key: _one,
              description: 'This is Button 1',
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Button 1'),
              ),
            ),
            SizedBox(height: 20),
            Showcase(
              key: _two,
              description: 'This is Button 2',
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Button 2'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
