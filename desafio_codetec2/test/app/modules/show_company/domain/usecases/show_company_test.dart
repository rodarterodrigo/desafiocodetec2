import 'package:dartz/dartz.dart';
import 'package:desafio_codetec2/app/modules/show_company/domain/entities/company.dart';
import 'package:desafio_codetec2/app/modules/show_company/domain/errors/show_company_error.dart';
import 'package:desafio_codetec2/app/modules/show_company/domain/repositories/show_company_repository.dart';
import 'package:desafio_codetec2/app/modules/show_company/domain/usecases/show_company.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class ShowCompanyRepositoryMock extends Mock implements IShowCompanyRepository{}

final repository = ShowCompanyRepositoryMock();
final usecase = ShowCompany(repository);

main(){
  test("Deve retornar um objeto do tipo Company", () async{
    when(repository.showCompany()).thenAnswer((realInvocation) async => Right(Company()));
    final result = await usecase.showCompany();
    expect(result | null, isA<Company>());
  });

  test("Deve retornar uma exceção do tipo ShowCompanyError", () async{
    when(repository.showCompany()).thenThrow(ShowCompanyError());
    final result = await usecase.showCompany();
    expect(result.fold(id,id), isA<ShowCompanyError>());
  });
}