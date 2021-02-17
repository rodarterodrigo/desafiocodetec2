import 'package:desafio_codetec2/app/modules/list_users/domain/entities/company.dart';
import 'package:desafio_codetec2/app/modules/list_users/infra/models/user_model.dart';

class CompanyModel extends Company{
  CompanyModel({name, users}):super(name: name, users: users);

  static CompanyModel fromJson(dynamic map) => map == null? null: CompanyModel(name: map['company'], users: (map['users'] as List).map((e) => UserModel.fromMap(e)).toList());
}