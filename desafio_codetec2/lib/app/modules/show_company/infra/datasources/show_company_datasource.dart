import 'package:desafio_codetec2/app/modules/show_company/domain/entities/company.dart';

abstract class IShowCompanyDatasource{
  Future<Company> showCompany();
}