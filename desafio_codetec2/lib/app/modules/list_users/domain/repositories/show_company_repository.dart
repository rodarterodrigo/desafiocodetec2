import 'package:dartz/dartz.dart';
import 'package:desafio_codetec2/app/modules/list_users/domain/entities/company.dart';
import 'package:desafio_codetec2/app/modules/list_users/errors/company_errors.dart';

abstract class IShowCompanyRepository{
  Future<Either<FailureShowCompany, Company>> showCompany();
}