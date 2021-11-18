
import 'package:equatable/equatable.dart';

abstract class HttpFail extends Equatable {
  final String? message;
  const HttpFail(this.message);

  @override
  List<Object?> get props => [message];
}

class NoNextPageFail  extends HttpFail {
  const NoNextPageFail ({required String message}) : super(message);
}

class UnknowFail extends HttpFail {
  const UnknowFail({required String message}) : super(message);
}

class NoConectionFail extends HttpFail {
  const NoConectionFail({required String message}) : super(message);

}class AouthFail extends HttpFail {
  const AouthFail({required String message}) : super(message);
}