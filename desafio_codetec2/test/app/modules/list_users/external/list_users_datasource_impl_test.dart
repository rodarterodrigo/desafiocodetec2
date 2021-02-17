import 'package:desafio_codetec2/app/modules/list_users/external/datasources/list_users_datasource_impl.dart';
import 'package:desafio_codetec2/app/modules/list_users/infra/errors/datasource_error.dart';
import 'package:desafio_codetec2/app/modules/list_users/infra/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../utils/ListUsersResponse.dart';

class DioMock extends Mock implements Dio{}

final dio = DioMock();
final datasource = ListUsersDatasource(dio);

main(){
  test("Deve completar a request", (){
    when(dio.get(any)).thenAnswer((realInvocation) async => Response(data: ListUsersResponse, statusCode: 200));
    final result = datasource.listUsers();
    expect(result, completes);
  });

  test("Deve retornar uma lista do tipo UserModel", (){
    when(dio.get(any)).thenAnswer((realInvocation) async => Response(data: ListUsersResponse, statusCode: 200));
    final result = datasource.listUsers();
    expect(result, isA<Future<List<UserModel>>>());
  });

  test("Deve retornar uma exceção do tipo DataSourceError", (){
    when(dio.get(any)).thenAnswer((realInvocation) async => Response(data: null, statusCode: 401));
    final result = datasource.listUsers();
    expect(result, throwsA(isA<DataSourceError>()));
  });
}