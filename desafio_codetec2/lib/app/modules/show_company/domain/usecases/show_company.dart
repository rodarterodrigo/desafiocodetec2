import 'package:dartz/dartz.dart';
import 'package:desafio_codetec2/app/modules/show_company/domain/entities/company.dart';
import 'package:desafio_codetec2/app/modules/show_company/domain/errors/show_company_error.dart';
import 'package:desafio_codetec2/app/modules/show_company/domain/repositories/show_company_repository.dart';
import 'package:desafio_codetec2/app/modules/show_company/errors/company_errors.dart';

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