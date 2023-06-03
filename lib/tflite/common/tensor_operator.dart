import 'package:f_rali_vision/tflite/common/operator.dart';
import 'package:f_rali_vision/tflite/tensorbuffer/tensorbuffer.dart';

/// Applies some operation on TensorBuffers.
abstract class TensorOperator extends Operator<TensorBuffer> {
  /// See [Operator.apply].
  @override
  TensorBuffer apply(TensorBuffer input);
}
