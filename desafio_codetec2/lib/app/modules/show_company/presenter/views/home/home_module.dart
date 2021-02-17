import 'package:desafio_codetec2/app/modules/show_company/domain/usecases/show_company.dart';
import 'package:desafio_codetec2/app/modules/show_company/external/datasources/show_company_datasource_impl.dart';
import 'package:desafio_codetec2/app/modules/show_company/infra/repositories/show_company_repository_impl.dart';
import 'package:dio/dio.dart';

import 'home_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => Dio()),
        Bind((i) => ShowCompanyDatasource(i())),
        Bind((i) => ShowCompanyRepository(i())),
        Bind((i) => ShowCompany(i())),
        Bind((i) => HomeBloc(i())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}