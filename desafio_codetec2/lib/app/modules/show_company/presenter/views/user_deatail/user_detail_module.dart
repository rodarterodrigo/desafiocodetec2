import 'package:desafio_codetec2/app/modules/show_company/presenter/routes/show_company_routes.dart';
import 'package:desafio_codetec2/app/modules/show_company/presenter/views/user_deatail/user_detail_page.dart';
import 'package:desafio_codetec2/app/modules/show_company/presenter/views/users_list/users_list_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UsersDetailModule extends ChildModule {
  @override
  List<Bind> get binds => [
  ];

  @override
  List<ModularRouter> get routers => [
    ModularRouter(Routes.USERDETAILPAGE, child: (context, args) => UserDetailPage(args.data)),
    ModularRouter(Routes.USERSLISTPAGE, child: (context, args) => UsersListPage()),
  ];

  static Inject get to => Inject<UsersDetailModule>.of();
}