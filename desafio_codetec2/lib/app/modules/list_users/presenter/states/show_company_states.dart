import 'package:desafio_codetec2/app/modules/list_users/domain/entities/company.dart';
import 'package:desafio_codetec2/app/modules/list_users/errors/company_errors.dart';

abstract class ShowCompanyState{
  const ShowCompanyState();
}

class EmptyState extends ShowCompanyState {
  const EmptyState();
}

class InitialState extends ShowCompanyState {
  const InitialState();
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