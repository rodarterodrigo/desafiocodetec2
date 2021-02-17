import 'package:dartz/dartz.dart';
import 'package:desafio_codetec2/app/modules/list_users/domain/entities/user.dart';
import 'package:desafio_codetec2/app/modules/list_users/errors/failure_list_users.dart';

abstract class IListUsersRepository{
  Future<Either<FailureListUsers, List<User>>> listUsers();
}