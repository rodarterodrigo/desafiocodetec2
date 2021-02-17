import 'package:desafio_codetec2/app/modules/show_company/domain/entities/company.dart';
import 'package:desafio_codetec2/app/modules/show_company/errors/company_errors.dart';

abstract class ShowCompanyState{
  const ShowCompanyState();
}

class LoadingState extends ShowCompanyState {
  const LoadingState();
}

class ErrorState extends ShowCompanyState {
  final FailureShowCompany failureShowCompany;
  const ErrorState(this.failureShowCompany);
}

class LoadedSucessState extends ShowCompanyState {
  final Company company;
  const LoadedSucessState(this.company);
}