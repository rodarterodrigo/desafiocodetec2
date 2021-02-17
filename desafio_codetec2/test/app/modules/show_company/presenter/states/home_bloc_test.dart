import 'package:dartz/dartz.dart';
import 'package:desafio_codetec2/app/modules/show_company/domain/entities/company.dart';
import 'package:desafio_codetec2/app/modules/show_company/domain/errors/get_list_error.dart';
import 'package:desafio_codetec2/app/modules/show_company/domain/usecases/show_company.dart';
import 'package:desafio_codetec2/app/modules/show_company/presenter/events/show_company_events.dart';
import 'package:desafio_codetec2/app/modules/show_company/presenter/states/show_company_states.dart';
import 'package:desafio_codetec2/app/modules/show_company/presenter/views/home/home_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class ShowCompanyMock extends Mock implements ShowCompany{}

final usecase = ShowCompanyMock();
final bloc = HomeBloc(usecase);

main(){
  test("Deve retornar os estados em ordem.", (){
    when(usecase.showCompany()).thenAnswer((realInvocation) async => Right(Company()));
    expect(bloc, emitsInOrder([
      isA<LoadingState>(),
      isA<LoadedSucessState>(),
    ]));
    bloc.add(ShowCompanyEvent());
  });

  test("Deve retornar um estado de erro.", (){
    when(usecase.showCompany()).thenAnswer((realInvocation) async => Left(ShowCompanyError()));
    expect(bloc, emitsInOrder([
      isA<LoadingState>(),
      isA<ErrorState>(),
    ]));
    bloc.add(ShowCompanyEvent());
  });
}