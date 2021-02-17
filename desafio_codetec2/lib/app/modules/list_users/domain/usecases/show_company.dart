import 'package:dartz/dartz.dart';
import 'package:desafio_codetec2/app/modules/list_users/domain/entities/company.dart';
import 'package:desafio_codetec2/app/modules/list_users/domain/errors/get_list_error.dart';
import 'package:desafio_codetec2/app/modules/list_users/domain/repositories/show_company_repository.dart';
import 'package:desafio_codetec2/app/modules/list_users/errors/company_errors.dart';

abstract class IShowCompany{
  Future<Either<FailureShowCompany, Company>>showCompany();
}

class ShowCompany implements IShowCompany{
  final IShowCompanyRepository repository;

  ShowCompany(this.repository):assert(repository != null);

  @override
  Future<Either<FailureShowCompany, Company>> showCompany() async {
    try {
      return await repository.showCompany();
    }
    catch(e){
      return Left(ShowCompanyError(message: e.toString()));
    }
  }
}