import 'package:dio/dio.dart';
import 'package:mitch_designs_task/core/api_service/api_end_points.dart';


class DioFinalHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: EndPoints.baseUrl,
        receiveDataWhenStatusError: true,

      ),
    );
  }


  static Future<dynamic> getData({
    required String method,
    Map<String, dynamic>? query,
  }) async {
    return await dio.get(
      method,
      data: query,
    );
  }
}
