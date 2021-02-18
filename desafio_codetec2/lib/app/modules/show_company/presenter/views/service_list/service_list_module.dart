import 'package:desafio_codetec2/app/modules/show_company/presenter/routes/show_company_routes.dart';
import 'package:desafio_codetec2/app/modules/show_company/presenter/views/home/home_page.dart';
import 'package:desafio_codetec2/app/modules/show_company/presenter/views/service_list/service_list_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ServiceListModule extends ChildModule {
  @override
  List<Bind> get binds => [
  ];

  @override
  List<ModularRouter> get routers => [
    ModularRouter(Routes.SERVICELISTPAGE, child: (context, args) => ServiceListPage(args.data)),
    ModularRouter(Routes.HOME, child: (context, args) => HomePage()),
  ];

  static Inject get to => Inject<ServiceListModule>.of();
}