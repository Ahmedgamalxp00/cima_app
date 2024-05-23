import 'package:cima_app/core/networking/api_constants.dart';
import 'package:dio/dio.dart';

class ApiServices {
  final Dio _dio;
  ApiServices(this._dio);

  Future<Map<String, dynamic>> get(
      {required String endPoint, String param = ''}) async {
    var response = await _dio
        .get('${ApiConstants.baseUrl}$endPoint${ApiConstants.apiKey}$param');
    return response.data;
  }
}
