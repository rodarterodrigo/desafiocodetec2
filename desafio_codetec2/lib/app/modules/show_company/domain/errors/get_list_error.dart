import 'package:desafio_codetec2/app/modules/show_company/errors/company_errors.dart';

class GetListError implements FailureShowCompany{
  @override
  final dynamic message;
  GetListError({this.message});

  String toString() {
    Object message = this.message;
    if (message == null) return "GetListError";
    return "GetListError: $message";
  }
}

class ShowCompanyError implements FailureShowCompany{
  @override
  final dynamic message;
  ShowCompanyError({this.message});

  String toString() {
    Object message = this.message;
    if (message == null) return "ShowCompanyError";
    return "ShowCompanyError: $message";
  }
}