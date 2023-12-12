import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class HomeNetwork {
  final dio = GetIt.I<Dio>();

  Future<Map<String, dynamic>> find(String url) async {
    try {
      var response = await dio.get(
        url,
      );
      return response.data;
    } on DioException catch (e) {
      throw DioException(
          message: e.message,
          response: e.response,
          requestOptions: e.requestOptions);
    }
  }
}
