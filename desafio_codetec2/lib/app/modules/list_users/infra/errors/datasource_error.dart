import 'package:desafio_codetec2/app/modules/list_users/errors/failure_list_users.dart';

class DataSourceError implements FailureListUsers{
  @override
  final dynamic message;
  DataSourceError({this.message});

  String toString() {
    Object message = this.message;
    if (message == null) return "DataSourceError";
    return "DataSourceError: $message";
  }
}