import 'package:dartz/dartz.dart';
import 'package:desafio_codetec2/app/modules/list_users/domain/entities/user.dart';
import 'package:desafio_codetec2/app/modules/list_users/domain/errors/errors.dart';

abstract class IListUserRepository{
  Future<Either<FailureListUsers, List<User>>> listUser();
}