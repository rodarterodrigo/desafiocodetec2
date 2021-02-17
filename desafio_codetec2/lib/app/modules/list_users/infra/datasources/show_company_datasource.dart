import 'package:desafio_codetec2/app/modules/list_users/domain/entities/company.dart';

abstract class IShowCompanyDatasource{
  Future<Company> showCompany();
}