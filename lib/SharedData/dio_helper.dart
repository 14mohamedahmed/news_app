import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:news_app/SharedData/constants.dart';

class DioHelper {
  // intialize all Possible requests to easly use it.
  final Dio _dio = Dio();
  Future<Response> sendRequestToAPI({
    String category,
    @required String requestType,
    Map<String, dynamic> data,
    Map<String, dynamic> headers,
  }) async {
    var queryParameters = {
      'country': 'eg',
      'category': category?.toLowerCase(),
      'apiKey': Constants.API_KEY,
    };
    print(queryParameters);
    return await _dio.request(
      'https://newsapi.org/v2/top-headlines',
      queryParameters: queryParameters,
      data: data,
      options: Options(
        headers: headers,
        method: requestType.toUpperCase(),
      ),
    );
  }
}
