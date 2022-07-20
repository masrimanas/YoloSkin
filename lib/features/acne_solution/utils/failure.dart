import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}

class DetectionFailure extends Failure {
  const DetectionFailure(super.message);
}

class ImageFailure extends Failure {
  const ImageFailure(super.message);
}
