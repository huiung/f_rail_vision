import 'dart:io';
import 'dart:math';
import 'package:f_rail_vision/tflite/classifier_float.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image/image.dart' as img;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:f_rail_vision/tflite/classifier.dart';
import 'package:logger/logger.dart';

import '../tflite/label/category.dart';
import 'MyElvatedButton.dart';

class InspectScreen extends StatefulWidget {
  const InspectScreen({Key? key, this.filePath}) : super(key: key);

  final String? filePath;

  @override
  State<InspectScreen> createState() => _InspectScreenState();
}

class _InspectScreenState extends State<InspectScreen> {
  late Classifier _classifier;

  var logger = Logger();

  File? _image;
  String _inspectButtonText = "Inspect";
  bool _resultIsPass = false;
  bool _isPredict = false;
  String _predictIconRes = "";

  final picker = ImagePicker();

  Image? _imageWidget;

  img.Image? fox;

  Category? category;

  @override
  void initState() {
    super.initState();
    _classifier = ClassifierFloat();

    if (widget.filePath != null) {
      _image = File(widget.filePath!);
      _imageWidget = Image.file(
        _image!,
        fit: BoxFit.contain,
      );
    }
  }

  void _predict() async {
    img.Image imageInput = img.decodeImage(_image!.readAsBytesSync())!;
    var pred = _classifier.predict(imageInput);

    setState(() {
      category = pred;
      _isPredict = true;

      if (category != null && category!.score >= 1.0) {
        _predictIconRes = 'assets/images/ic_pass.svg';
        _inspectButtonText = "Next Image";
        _resultIsPass = true;
      } else {
        _predictIconRes = 'assets/images/ic_fail.svg';
        _inspectButtonText = "Retry";
        _resultIsPass = false;
      }
    });
  }

  Future _getImageFromCamera() async {
    _isPredict = false;
    _inspectButtonText = "Inspect";

    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (context.mounted && pickedFile?.path != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => InspectScreen(filePath: pickedFile?.path),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: SvgPicture.asset(
              'assets/images/ic_arrow_left.svg',
              width: 24,
              height: 24,
            ),
          ),
        ),
        body: Container(
          color: Colors.white,
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Stack(
                      children: [
                        _imageWidget == null
                            ? const Text('No image selected.')
                            : Row(
                            children: [Expanded(child: _imageWidget!)],
                          ),
                        if (_isPredict)
                          Positioned(
                            top: 0,
                            left: 0,
                            bottom: 0,
                            right: 0,
                            child: Center(
                                child: SvgPicture.asset(
                                  _predictIconRes,
                                  width: 48,
                                  height: 48,
                                )),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Row(children: [
                    const SizedBox(
                      width: 22,
                    ),
                    Expanded(
                      child: SizedBox(
                          height: 60,
                          child: MyElevatedButton(
                              text: _inspectButtonText,
                              onPressed: () {
                                if (!_isPredict) {
                                  _predict();
                                } else if (_resultIsPass){
                                  _getImageFromCamera();
                                } else {
                                  Navigator.pop(context);
                                }
                              },
                              color: const Color(0xFF28B2FF))),
                    ),
                    const SizedBox(
                      width: 22,
                    ),
                  ]),
                  const SizedBox(
                    height: 22,
                  ),
                ],
              ),
            ],
          )
        ));
  }
}
