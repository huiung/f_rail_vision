import 'package:f_rali_vision/classifier.dart';

import 'common/ops/normailze_op.dart';

class ClassifierFloat extends Classifier {
  ClassifierFloat({int? numThreads}) : super(numThreads: numThreads);

  @override
  String get modelName => 'model.tflite';

  @override
  NormalizeOp get preProcessNormalizeOp => NormalizeOp(127.5, 127.5);

  @override
  NormalizeOp get postProcessNormalizeOp => NormalizeOp(0, 1);
}