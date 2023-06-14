import 'package:f_rail_vision/tflite/common/operator.dart';

/// Processes [T] object with prepared [Operator].
abstract class Processor<T> {
  T process(T input);
}
