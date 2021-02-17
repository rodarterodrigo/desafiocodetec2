import 'package:dartz/dartz.dart';
import 'package:desafio_codetec2/app/modules/list_users/domain/entities/user.dart';
import 'package:desafio_codetec2/app/modules/list_users/domain/errors/get_list_error.dart';
import 'package:desafio_codetec2/app/modules/list_users/domain/repositories/list_users_repository.dart';

abstract class IListUsers{
  Future<Either<FailureListUsers, List<User>>>listUsers();
}

class ListUsers implements IListUsers{
  final IListUsersRepository repository;

  ListUsers(this.repository):assert(repository != null);

  @override
  Future<Either<FailureListUsers, List<User>>> listUsers() async {
    try {
      return await repository.listUsers();
    }
    catch(e){
      return Left(GetListError(message: e.toString()));
    }
  }
}