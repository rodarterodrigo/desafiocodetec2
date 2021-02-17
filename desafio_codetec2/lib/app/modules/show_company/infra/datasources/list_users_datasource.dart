import 'package:desafio_codetec2/app/modules/show_company/infra/models/user_model.dart';

abstract class IListUsersDatasource{
  Future<List<UserModel>> listUsers();
}