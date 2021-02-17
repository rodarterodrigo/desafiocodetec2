import 'package:desafio_codetec2/app/modules/list_users/infra/models/user_model.dart';

abstract class IListUsersDatasource{
  Future<List<UserModel>> listUsers();
}