import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_task_app/secrets/keys.dart';
import 'package:weather_task_app/services/network_service/network_service.dart';

@LazySingleton(as: NetworkService)
class NetworkServiceImpl implements NetworkService {
  static const String _keyField = 'key';

  late final Dio _dio;

  NetworkServiceImpl() {
    _dio = _createDio();
  }

  Dio _createDio() => Dio();

  // Uncomment to log responses/requests, commented out as
  // it clutters the logs significantly
  // ..interceptors.add(PrettyDioLogger());

  @override
  Future<Response> get({
    required String url,
    Map<String, dynamic>? queryParameters,
  }) =>
      _dio.get(
        '${Keys.apiUrl}/$url.json',
        queryParameters: {
          _keyField: Keys.apiKey,
          if (queryParameters != null) ...queryParameters
        },
      );
}
