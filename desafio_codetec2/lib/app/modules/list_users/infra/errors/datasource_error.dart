import 'package:desafio_codetec2/app/modules/list_users/errors/company_errors.dart';

class DataSourceError implements FailureShowCompany{
  @override
  final dynamic message;
  DataSourceError({this.message});

  String toString() {
    Object message = this.message;
    if (message == null) return "DataSourceError";
    return "DataSourceError: $message";
  }
}