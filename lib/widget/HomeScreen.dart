import 'package:f_rali_vision/widget/InfoScreen.dart';
import 'package:f_rali_vision/widget/MyCommonText.dart';
import 'package:flutter/material.dart';
import 'package:f_rali_vision/Util.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'MyElvatedButton.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const MyCommonText(text: 'RailVision', fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
        actions: [
          SvgPicture.asset(
            'assets/images/ic_alarm.svg',
            width: 24,
            height: 24,
          ),
          const SizedBox(width: 28),
          SvgPicture.asset(
            'assets/images/ic_user.svg',
            width: 24,
            height: 24,
          ),
          const SizedBox(width: 22),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.0),
            child: MyLayoutBuilder()
        ),
      )
    );
  }
}

class MyLayoutBuilder extends StatelessWidget {
  const MyLayoutBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final width = (constraints.maxWidth - 16) * 0.5;
        const ratio = 252.0 / 150.0;
        final height = width * ratio;
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const InfoScreen(),
                  ),
                );
              },
              child: Container(
                color: Colors.transparent,
                child: Row(
                    children: [
                      const MyCommonText(text: 'Info', fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                      const Spacer(),
                      SvgPicture.asset(
                        'assets/images/ic_right.svg',
                        width: 24,
                        height: 24,
                      ),
                    ],
                ),
              ),
            ),
            const SizedBox(height: 39),
            const MyCommonText(text: 'Railroad inspection', fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
            const SizedBox(height: 20),
            Row(
              children: [
                SizedBox(
                    height: height,
                    width: width,
                    child: MyElevatedButton(
                        text: 'Gallery',
                        onPressed: () {  },
                        color: const Color(0xFF42CF48)
                    )
                ),
                const SizedBox(width: 16),
                SizedBox(
                  height: height,
                  width: width,
                  child: MyElevatedButton(
                      text: 'Camera',
                      onPressed: () {  },
                      color: const Color(0xFF28B2FF)
                  ),
                ),
              ],
            ),
            const SizedBox(height: 45)
          ],
        );
      }
    );
  }
}
