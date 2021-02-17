import 'package:desafio_codetec2/app/modules/show_company/domain/entities/company.dart';
import 'package:desafio_codetec2/app/modules/show_company/infra/datasources/show_company_datasource.dart';
import 'package:desafio_codetec2/app/modules/show_company/infra/errors/datasource_error.dart';
import 'package:desafio_codetec2/app/modules/show_company/infra/models/company_model.dart';
import 'package:desafio_codetec2/app/modules/show_company/infra/repositories/show_company_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

class ShowCompanyDataSourceMock extends Mock implements IShowCompanyDatasource{}

final datasource = ShowCompanyDataSourceMock();
final repository = ShowCompanyRepository(datasource);

main(){
  test("Deve retornar um objeto do tipo Company", () async {
    when(datasource.showCompany()).thenAnswer((realInvocation) async => CompanyModel());
    final result = await repository.showCompany();
    expect(result | null, isA<Company>());
  });

  test("Deve retornar uma exceção do tipo DataSourceError", () async {
    when(datasource.showCompany()).thenThrow(DataSourceError());
    final result = await repository.showCompany();
    expect(result.fold(id,id), isA<DataSourceError>());
  });
}