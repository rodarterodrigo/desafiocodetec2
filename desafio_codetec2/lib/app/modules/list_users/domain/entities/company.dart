import 'package:desafio_codetec2/app/modules/list_users/domain/entities/user.dart';

class Company{
  final name;
  final List<User> users;

  Company({this.name, this.users});
}