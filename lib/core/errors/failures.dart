import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure(this.message);

  final String message;

  @override
  String toString() => message;

  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure(String method)
      : super('Server failure occurred in $method');
}

class NoWeatherForecastFailure extends Failure {
  const NoWeatherForecastFailure() : super('API returned no forecast');
}
