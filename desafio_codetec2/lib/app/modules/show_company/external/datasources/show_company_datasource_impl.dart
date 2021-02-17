import 'package:desafio_codetec2/app/modules/show_company/external/constants/settings.dart';
import 'package:desafio_codetec2/app/modules/show_company/infra/datasources/show_company_datasource.dart';
import 'package:desafio_codetec2/app/modules/show_company/infra/errors/datasource_error.dart';
import 'package:desafio_codetec2/app/modules/show_company/infra/models/company_model.dart';
import 'package:dio/dio.dart';

class ShowCompanyDatasource implements IShowCompanyDatasource{
  final Dio dio;

  ShowCompanyDatasource(this.dio);

  @override
  Future<CompanyModel> showCompany() async {
    final response = await dio.get(Settings.apiUrl);
    return response.statusCode == 200? CompanyModel.fromJson(response.data): throw DataSourceError();
  }
}