import 'package:dartz/dartz.dart';
import 'package:desafio_codetec2/app/modules/show_company/domain/entities/company.dart';
import 'package:desafio_codetec2/app/modules/show_company/errors/company_errors.dart';

abstract class IShowCompanyRepository{
  Future<Either<FailureShowCompany, Company>> showCompany();
}