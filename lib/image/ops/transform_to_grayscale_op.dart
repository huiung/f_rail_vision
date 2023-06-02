import 'dart:math';
import 'package:image/image.dart' as imagelib;
import 'package:f_rali_vision/image/image_operator.dart';
import 'package:f_rali_vision/image/tensor_image.dart';

class TransformToGrayscaleOp extends ImageOperator {
  @override
  TensorImage apply(TensorImage image) {
    final transformedImage = imagelib.grayscale(image.image);
    image.loadImage(transformedImage);
    return image;
  }

  @override
  int getOutputImageHeight(int inputImageHeight, int inputImageWidth) {
    return inputImageHeight;
  }

  @override
  int getOutputImageWidth(int inputImageHeight, int inputImageWidth) {
    return inputImageWidth;
  }

  @override
  Point<num> inverseTransform(
      Point<num> point, int inputImageHeight, int inputImageWidth) {
    return point;
  }
}
