import 'package:desafio_codetec2/app/modules/show_company/domain/entities/services.dart';
import 'package:desafio_codetec2/app/modules/show_company/domain/entities/user.dart';

class Company{
  final name;
  final List<User> users;
  final List<Service> services;

  Company({this.name, this.users, this.services});
}