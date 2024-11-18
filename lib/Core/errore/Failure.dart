import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  Failure(this.errorMessage);
}

class ServerError extends Failure {
  ServerError(super.errorMessage);
  factory ServerError.fromjson(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerError('Connection timeout with ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerError('Send timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerError('Receive timeout with ApiServer');
      case DioExceptionType.badCertificate:
        return ServerError("badCertificate");
      case DioExceptionType.badResponse:
        ServerError.fromResponse(
            dioError.response!.statusCode!, dioError.response!);
      case DioExceptionType.cancel:
        return ServerError('Request to ApiServer was canceld');
      case DioExceptionType.connectionError:
        return ServerError('No Internet Connection');
      case DioExceptionType.unknown:
        return ServerError('Unexpected Error, Please try again!');
      default:
        return ServerError('Opps There was an Error, Please try again');
    }
    return ServerError('Opps There was an Error, Please try again');
  }
  factory ServerError.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerError(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerError('Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return ServerError('Internal Server error, Please try later');
    } else {
      return ServerError('Opps There was an Error, Please try again');
    }
  }
}
