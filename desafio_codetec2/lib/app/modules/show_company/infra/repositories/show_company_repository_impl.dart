import 'package:dartz/dartz.dart';
import 'package:desafio_codetec2/app/modules/show_company/domain/entities/company.dart';
import 'package:desafio_codetec2/app/modules/show_company/domain/repositories/show_company_repository.dart';
import 'package:desafio_codetec2/app/modules/show_company/errors/company_errors.dart';
import 'package:desafio_codetec2/app/modules/show_company/infra/datasources/show_company_datasource.dart';
import 'package:desafio_codetec2/app/modules/show_company/infra/errors/datasource_error.dart';

class ShowCompanyRepository implements IShowCompanyRepository{
  final IShowCompanyDatasource datasource;

  ShowCompanyRepository(this.datasource):assert(datasource!=null);

  @override
  Future<Either<FailureShowCompany, Company>> showCompany() async {
    try{
      return Right(await datasource.showCompany());
    }
    on DataSourceError catch(Exception){
      return Left(Exception);
    }
    catch(e){
      return Left(DataSourceError(message: e.toString()));
    }
  }
}