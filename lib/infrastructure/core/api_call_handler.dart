import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:github_challenge/domain/core/failure_response.dart';
import 'package:github_challenge/injection_container/injection.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class ApiCallHandler {
  final Dio _dio;

  ApiCallHandler(this._dio);

  delete({required String url, Map? header, body}) {}

  get({required String url, header, body}) async {
    _dio.options.baseUrl = sl<String>(instanceName: 'BaseUrl');
    final response = await _dio
        .get(
      url,
      queryParameters: body,
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
      return response.data;
    } else {
      throw UnknowFail(
        message: response.statusMessage ?? 'The server could not respond',
      );
    }
  }

  post({required String url, header, body}) async {
    _dio.options.baseUrl = sl<String>(instanceName: 'BaseUrlForLogin');
    final response = await _dio
        .post(
      url,
      data: jsonEncode(body),
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
      if (jasonObject['error'] != null)
        throw AouthFail(message: jasonObject['error_description']);
      return jasonObject;
    } else {
      throw UnknowFail(
        message: response.statusMessage ?? 'The server could not respond',
      );
    }
  }

  put({required String url, Map? header, body}) {}
}
