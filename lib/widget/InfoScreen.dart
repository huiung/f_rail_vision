import 'package:f_rali_vision/widget/MyCommonText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Padding(
            padding: EdgeInsets.only(left: 0),
            child: MyCommonText(
                text: 'Info',
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          titleSpacing: 22,
          elevation: 0,
          backgroundColor: Colors.white,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: SvgPicture.asset(
                  'assets/images/ic_close.svg',
                  width: 24,
                  height: 24,
                ),
            ),
            const SizedBox(width: 22),
          ],
        ),
        body: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            child: ListView(
              children: const [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 28),
                    MyCommonText(
                        text: "About RailVision",
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                    SizedBox(height: 12),
                    MyCommonText(
                        text: infoText1,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.black
                    ),
                    SizedBox(height: 24),
                    MyCommonText(
                        text: "About Team",
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black
                    ),
                    SizedBox(height: 12),
                    MyCommonText(
                        text: infoText2,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.black
                    ),
                    SizedBox(height: 30),
                  ],
                )
              ],
            ),
          )),
        );
  }
}

const String infoText1 =
    "Railways are susceptible to many things: such as pressure, oxidation, and corrosion. Flawed railways require professional knowledge and an expensive inspection system to prevent safety accidents. Our application is oriented toward groups that do not have their own railroad inspection system due to economic, technical, or political reasons. To check whether the railways are defective or not, users should just take a photo of potentially defective railways with this app. The result would show up on display whether the railway is defective or not. We developed an image classification deep learning model based on the VGG-16 model, which achieved 82% accuracy with a limited amount of data. We are planning to improve this app in terms of 1) model performance with additional data 2) new features like GPS tracking and object detection and 3) collaboration with other research groups in the future. ";

const String infoText2 =
    "We are students from South Korea, who designed/developed/published RailVision to provide a practical solution for railroad inspection. This application will help you to detect whether the train rail is flawed or not, by simply taking just one photo as input. We hope our app to be a solution to prevent any safety accident related to the railroad, and we are planning to keep improving it";
