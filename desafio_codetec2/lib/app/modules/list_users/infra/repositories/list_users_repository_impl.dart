import 'package:dartz/dartz.dart';
import 'package:desafio_codetec2/app/modules/list_users/domain/entities/user.dart';
import 'package:desafio_codetec2/app/modules/list_users/domain/repositories/list_users_repository.dart';
import 'package:desafio_codetec2/app/modules/list_users/errors/company_errors.dart';
import 'package:desafio_codetec2/app/modules/list_users/infra/datasources/list_users_datasource.dart';
import 'package:desafio_codetec2/app/modules/list_users/infra/errors/datasource_error.dart';

class ListUsersRepository implements IListUsersRepository{
  final IListUsersDatasource datasource;

  ListUsersRepository(this.datasource):assert(datasource!=null);

  @override
  Future<Either<FailureShowCompany, List<User>>> listUsers() async {
    try{
      return Right(await datasource.listUsers());
    }
    on DataSourceError catch(Exception){
    return Left(Exception);
    }
    catch(e){
    return Left(DataSourceError(message: e.toString()));
    }
  }
}