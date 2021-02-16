abstract class FailureListUsers implements Exception{
  final dynamic message;
  FailureListUsers({this.message});
}

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