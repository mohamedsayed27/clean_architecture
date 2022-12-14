import 'package:clean_arch_ug/movies_module/core/network/error_message_model.dart';

class ServerModelException implements Exception{
  final ErrorMessageModel errorMessageModel;

  ServerModelException({required this.errorMessageModel});
}

class DatabaseException implements Exception{
  final String message;

  DatabaseException({required this.message});
}