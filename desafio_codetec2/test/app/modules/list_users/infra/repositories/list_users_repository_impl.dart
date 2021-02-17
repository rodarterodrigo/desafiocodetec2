import 'package:desafio_codetec2/app/modules/list_users/domain/entities/user.dart';
import 'package:desafio_codetec2/app/modules/list_users/infra/datasources/list_users_datasource.dart';
import 'package:desafio_codetec2/app/modules/list_users/infra/errors/datasource_error.dart';
import 'package:desafio_codetec2/app/modules/list_users/infra/models/user_model.dart';
import 'package:desafio_codetec2/app/modules/list_users/infra/repositories/list_users_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

class ListUsersDataSourceMock extends Mock implements IListUsersDatasource{}

final datasource = ListUsersDataSourceMock();
final repository = ListUsersRepository(datasource);

main(){
  test("Deve retornar uma lista de usuários", () async {
    when(datasource.listUsers()).thenAnswer((realInvocation) async => List<UserModel>());
    final result = await repository.listUsers();
    expect(result | null, isA<List<User>>());
  });

  test("Deve retornar uma exceção do tipo DataSourceError", () async {
    when(datasource.listUsers()).thenThrow(DataSourceError());
    final result = await repository.listUsers();
    expect(result.fold(id,id), isA<DataSourceError>());
  });
}