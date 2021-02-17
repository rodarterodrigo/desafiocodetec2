import 'package:desafio_codetec2/app/modules/show_company/external/datasources/show_company_datasource_impl.dart';
import 'package:desafio_codetec2/app/modules/show_company/infra/errors/datasource_error.dart';
import 'package:desafio_codetec2/app/modules/show_company/infra/models/company_model.dart';
import 'package:desafio_codetec2/app/modules/show_company/infra/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../utils/ListUsersResponse.dart';

class DioMock extends Mock implements Dio{}

final dio = DioMock();
final datasource = ShowCompanyDatasource(dio);

main(){
  test("Deve completar a request", (){
    when(dio.get(any)).thenAnswer((realInvocation) async => Response(data: ListUsersResponse, statusCode: 200));
    final result = datasource.showCompany();
    expect(result, completes);
  });

  test("Deve retornar uma lista do tipo CompanyModel", (){
    when(dio.get(any)).thenAnswer((realInvocation) async => Response(data: ListUsersResponse, statusCode: 200));
    final result = datasource.showCompany();
    expect(result, isA<Future<CompanyModel>>());
  });

  test("Deve retornar uma exceção do tipo DataSourceError", (){
    when(dio.get(any)).thenAnswer((realInvocation) async => Response(data: null, statusCode: 401));
    final result = datasource.showCompany();
    expect(result, throwsA(isA<DataSourceError>()));
  });
}