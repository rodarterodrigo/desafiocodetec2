import 'package:desafio_codetec2/app/modules/list_users/errors/failure_list_users.dart';

class GetListError implements FailureListUsers{
  @override
  final dynamic message;
  GetListError({this.message});

  String toString() {
    Object message = this.message;
    if (message == null) return "GetListError";
    return "GetListError: $message";
  }
}