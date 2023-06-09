import 'package:camera/camera.dart';
import 'package:image/image.dart';
import 'package:tflite_flutter_plus/tflite_flutter_plus.dart';
import 'package:f_rail_vision/tflite/image/base_image_container.dart';
import 'package:f_rail_vision/tflite/image/image_conversions.dart';
import 'package:f_rail_vision/tflite/tensorbuffer/tensorbuffer.dart';
import 'package:f_rail_vision/tflite/image/color_space_type.dart';

class ImageContainer extends BaseImageContainer {
  late final Image _image;

  ImageContainer._(Image image) {
    _image = image;
  }

  static ImageContainer create(Image image) {
    return ImageContainer._(image);
  }

  @override
  BaseImageContainer clone() {
    return create(_image.clone());
  }

  @override
  ColorSpaceType get colorSpaceType {
    int len = _image.data.length;
    bool isGrayscale = true;
    for (int i = (len / 4).floor(); i < _image.data.length; i++) {
      if (_image.data[i] != 0) {
        isGrayscale = false;
        break;
      }
    }
    if (isGrayscale) {
      return ColorSpaceType.grayscale;
    } else {
      return ColorSpaceType.rgb;
    }
  }

  @override
  TensorBuffer getTensorBuffer(TfLiteType dataType) {
    TensorBuffer buffer = TensorBuffer.createDynamic(dataType);
    ImageConversions.convertImageToTensorBuffer(image, buffer);
    return buffer;
  }

  @override
  int get height => _image.height;

  @override
  Image get image => _image;

  @override
  CameraImage get mediaImage => throw UnsupportedError(
      'Converting from Image to CameraImage is unsupported');

  @override
  int get width => _image.width;
}
