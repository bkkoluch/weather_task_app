import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:weather_task_app/secrets/keys.dart';
import 'package:weather_task_app/services/network_service/network_service.dart';

@LazySingleton(as: NetworkService)
class NetworkServiceImpl implements NetworkService {
  final String _keyField = 'key';
  final String _qField = 'q';

  late final Dio _dio;

  NetworkServiceImpl() {
    _dio = _createDio();
  }

  Dio _createDio() => Dio()..interceptors.add(PrettyDioLogger());

  @override
  Future<Response> get({required String url}) => _dio.get(
        '${Keys.apiUrl}/$url.json',
        queryParameters: {
          _keyField: Keys.apiKey,
          // TODO: change hardcoded London if needed
          _qField: 'London',
        },
      );
}
