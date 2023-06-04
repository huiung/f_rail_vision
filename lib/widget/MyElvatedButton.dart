import 'package:flutter/material.dart';

import 'MyCommonText.dart';

class MyElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final double radius = 24.0;

  const MyElevatedButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      required this.color
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius), // 모서리 반지름 설정
          ),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(color), // 배경색 설정
      ),
      onPressed: onPressed,
      child: MyCommonText(text: text, fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white,),
    );
  }
}
