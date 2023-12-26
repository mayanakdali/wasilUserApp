import 'package:dio/dio.dart';

import '../local/shared_prefrenses_helper.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
          baseUrl: 'https://admin.wasiljo.com/public/api/v1/',
          receiveDataWhenStatusError: true),
    );
  }

  static Future<Response> getData(
      {required String url, Map<String, dynamic>? query, String? token}) async {
    dio.options.headers = {
      'Accept-Encoding': 'gzip, deflate, br',
      'User-Agent': 'PostmanRuntime/7.32.3',
      'Content-Type': 'application/json',
      'Accept': 'Mainapplication/json',
      'Authorization': CachHelper.getData(key: 'token') == null
          ? ''
          : 'Bearer' + ' ' + CachHelper.getData(key: 'token'),
    };
    return await dio.get(url, queryParameters: query);
  }

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio.options.headers = {
      'Accept-Language': 'application/json',
      'Access-Control-Request-Headers': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': CachHelper.getData(key: 'token') == null
          ? ''
          : 'Bearer'+ CachHelper.getData(key: 'token'),
    };

    return await dio.post(url, queryParameters: query, data: data);
  }

  static Future<Response> postFormData({
    required String url,
    required FormData data,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio.options.headers = {
      'Accept-Encoding': 'gzip, deflate, br',
      'User-Agent': 'PostmanRuntime/7.32.3',
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': CachHelper.getData(key: 'token') == null
          ? ''
          : 'Bearer'+CachHelper.getData(key: 'token'),
    };

    return await dio.post(url, queryParameters: query, data: data);
  }

  static Future<Response> updateData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio.options.headers = {
      'Accept': 'application/json',
      'Authorization': CachHelper.getData(key: 'token') == null
          ? ''
          : 'Bearer'+CachHelper.getData(key: 'token'),
    };

    return await dio.put(url, data: data, queryParameters: query);
  }

  static Future<Response> updateFormData({
    required String url,
    required FormData data,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio.options.headers = {
      'Accept-Encoding': 'gzip, deflate, br',
      'User-Agent': 'PostmanRuntime/7.32.3',
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': CachHelper.getData(key: 'token') == null
          ? ''
          : 'Bearer' + ' ' + CachHelper.getData(key: 'token'),
    };

    return await dio.put(url, queryParameters: query, data: data);
  }

  static Future<Response> DeleteData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
    Map<String, dynamic>? data,
  }) async {
    dio.options.headers = {
      'Accept-Encoding': 'gzip, deflate, br',
      'User-Agent': 'PostmanRuntime/7.32.3',
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': CachHelper.getData(key: 'token') == null
          ? ''
          : 'Bearer' + ' ' + CachHelper.getData(key: 'token'),
    };
    return await dio.delete(url, queryParameters: query, data: data);
  }

  static Future<Response> updateFormDataUsePatch({
    required String url,
    required FormData data,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio.options.headers = {
      'Accept-Encoding': 'gzip, deflate, br',
      'User-Agent': 'PostmanRuntime/7.32.3',
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': CachHelper.getData(key: 'token') == null
          ? ''
          : 'Bearer' + ' ' + CachHelper.getData(key: 'token'),
    };

    return await dio.patch(url, queryParameters: query, data: data);
  }
}
