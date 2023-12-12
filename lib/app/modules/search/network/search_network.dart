import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class SearchNetwork {
  final dio = GetIt.I<Dio>();

  Future<Map<String, dynamic>> filter(
      String url, Map<String, dynamic> query) async {
    try {
      var response = await dio.get(url, queryParameters: query);
      return response.data;
    } on DioException catch (e) {
      throw DioException(
          message: e.message,
          response: e.response,
          requestOptions: e.requestOptions);
    }
  }
}
