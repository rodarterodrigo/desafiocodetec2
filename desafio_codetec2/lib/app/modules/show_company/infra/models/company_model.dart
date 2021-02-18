import 'package:desafio_codetec2/app/modules/show_company/domain/entities/company.dart';
import 'package:desafio_codetec2/app/modules/show_company/infra/models/service_model.dart';
import 'package:desafio_codetec2/app/modules/show_company/infra/models/user_model.dart';

class CompanyModel extends Company{
  CompanyModel({name, users, services}):super(name: name, users: users, services: services);

  static CompanyModel fromJson(dynamic map) => map == null? null: CompanyModel(name: map['company'],
      users: (map['users'] as List).map((e) => UserModel.fromMap(e)).toList(),
      services: (map['services'] as List).map((e) => ServiceModel.fromMap(e)).toList());
}