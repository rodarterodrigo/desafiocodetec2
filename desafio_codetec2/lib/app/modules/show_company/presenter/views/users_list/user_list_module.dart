import 'package:desafio_codetec2/app/modules/show_company/presenter/views/home/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
  ];

  @override
  List<ModularRouter> get routers => [
    ModularRouter(Modular.initialRoute, child: (_, args) => HomePage()),
  ];

  static Inject get to => Inject<HomeModule>.of();
}