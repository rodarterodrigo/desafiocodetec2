import 'package:dartz/dartz.dart';
import 'package:desafio_codetec2/app/modules/list_users/domain/entities/user.dart';
import 'package:desafio_codetec2/app/modules/list_users/domain/errors/errors.dart';
import 'package:desafio_codetec2/app/modules/list_users/domain/repositories/list_user_repository.dart';
import 'package:desafio_codetec2/app/modules/list_users/domain/usecases/list_users.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class ListUsersRepositoryMock extends Mock implements IListUserRepository{}

final repository = ListUsersRepositoryMock();
final usecase = ListUsers(repository);

main(){
  test("Deve retornar uma lista de usuários", () async{
    when(repository.listUser()).thenAnswer((realInvocation) async => Right(List<User>()));
    final result = await usecase.listUser();
    expect(result | null, isA<List<User>>());
  });

  test("Deve retornar uma exceção do tipo GetListError", () async{
    when(repository.listUser()).thenThrow(GetListError());
    final result = await usecase.listUser();
    expect(result.fold(id,id), isA<GetListError>());
  });
}