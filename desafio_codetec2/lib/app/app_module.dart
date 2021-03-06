import 'package:desafio_codetec2/app/modules/show_company/presenter/routes/show_company_routes.dart';
import 'app_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:desafio_codetec2/app/app_widget.dart';

import 'modules/show_company/presenter/views/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppBloc()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Routes.HOME, module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}