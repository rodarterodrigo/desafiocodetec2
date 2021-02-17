import 'package:dartz/dartz.dart';
import 'package:desafio_codetec2/app/modules/list_users/domain/entities/user.dart';
import 'package:desafio_codetec2/app/modules/list_users/errors/company_errors.dart';

abstract class IListUsersRepository{
  Future<Either<FailureShowCompany, List<User>>> listUsers();
}