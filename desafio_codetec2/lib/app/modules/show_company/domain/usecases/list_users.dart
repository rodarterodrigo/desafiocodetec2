import 'package:dartz/dartz.dart';
import 'package:desafio_codetec2/app/modules/show_company/domain/entities/user.dart';
import 'package:desafio_codetec2/app/modules/show_company/domain/errors/get_list_error.dart';
import 'package:desafio_codetec2/app/modules/show_company/domain/repositories/list_users_repository.dart';
import 'package:desafio_codetec2/app/modules/show_company/errors/company_errors.dart';

abstract class IListUsers{
  Future<Either<FailureShowCompany, List<User>>>listUsers();
}

class ListUsers implements IListUsers{
  final IListUsersRepository repository;

  ListUsers(this.repository):assert(repository != null);

  @override
  Future<Either<FailureShowCompany, List<User>>> listUsers() async {
    try {
      return await repository.listUsers();
    }
    catch(e){
      return Left(GetListError(message: e.toString()));
    }
  }
}