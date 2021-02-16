import 'package:dartz/dartz.dart';
import 'package:desafio_codetec2/app/modules/list_users/domain/entities/user.dart';
import 'package:desafio_codetec2/app/modules/list_users/domain/errors/errors.dart';
import 'package:desafio_codetec2/app/modules/list_users/domain/repositories/list_user_repository.dart';

abstract class IListUsers{
  Future<Either<FailureListUsers, List<User>>>listUser();
}

class ListUsers implements IListUsers{
  final IListUserRepository repository;

  ListUsers(this.repository):assert(repository != null);

  @override
  Future<Either<FailureListUsers, List<User>>> listUser() async {
    try {
      return await repository.listUser();
    }
    catch(e){
      return Left(GetListError(message: e.toString()));
    }
  }
}