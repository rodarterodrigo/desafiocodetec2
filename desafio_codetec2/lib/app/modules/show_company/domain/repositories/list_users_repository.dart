import 'package:dartz/dartz.dart';
import 'package:desafio_codetec2/app/modules/show_company/domain/entities/user.dart';
import 'package:desafio_codetec2/app/modules/show_company/errors/company_errors.dart';

abstract class IListUsersRepository{
  Future<Either<FailureShowCompany, List<User>>> listUsers();
}