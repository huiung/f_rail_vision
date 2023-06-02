import 'dart:math';

import 'package:f_rali_vision/common/support_preconditions.dart';
import 'package:f_rali_vision/common/tensor_operator.dart';
import 'package:f_rali_vision/image/image_operator.dart';
import 'package:f_rali_vision/image/tensor_image.dart';
import 'package:f_rali_vision/tensorbuffer/tensorbuffer.dart';

/// The adapter that makes a TensorOperator able to run with TensorImage.
///
/// See [TensorOperator]
/// See [TensorImage]
class TensorOperatorWrapper implements ImageOperator {
  final TensorOperator _tensorOp;

  /// Wraps a [TensorOperator] object as an [ImageOperator], so that the
  /// [TensorOperator] could handle [TensorImage] objects by handling its underlying
  /// [TensorBuffer].
  ///
  /// Requirement: The [op] should not change coordinate system when applied on an image.
  TensorOperatorWrapper(TensorOperator op) : _tensorOp = op;

  @override
  TensorImage apply(TensorImage image) {
    SupportPreconditions.checkNotNull(image,
        message: "Op cannot apply on null image.");

    TensorBuffer initial = image.tensorBuffer;
    TensorBuffer processed = _tensorOp.apply(initial);
    image.loadTensorBuffer(processed);

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
