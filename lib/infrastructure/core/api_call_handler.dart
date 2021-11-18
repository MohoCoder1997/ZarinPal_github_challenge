import 'package:dio/dio.dart';
import 'package:github_challenge/domain/core/failure_response.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class ApiCallHandler {
  final Dio _dio;
  ApiCallHandler(this._dio);

  delete({required String url, Map? header, body}) {}

  get({required String url, header}) async {
    final response = await _dio
        .get(
      url,
      options: Options(
        headers: header != null ? header : null,
      ),
    )
        .onError((error, stackTrace) {
      if (error is DioError) {
        if (error.response != null)
          throw UnknowFail(
            message: error.response!.data['message'] ??
                'The server could not respond',
          );
        throw UnknowFail(message: 'The server could not respond');
      } else
        throw UnknowFail(message: 'The server could not respond');
    });

    if (response.statusCode == 200) {
      var jasonObject = response.data;
      return jasonObject;
    } else {
      throw UnknowFail(
        message: response.statusMessage ?? 'The server could not respond',
      );
    }
  }

  post({required String url, header, body}) async {}

  put({required String url, Map? header, body}) {}
}
