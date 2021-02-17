import 'package:desafio_codetec2/app/modules/show_company/external/constants/settings.dart';
import 'package:desafio_codetec2/app/modules/show_company/infra/datasources/list_users_datasource.dart';
import 'package:desafio_codetec2/app/modules/show_company/infra/errors/datasource_error.dart';
import 'package:desafio_codetec2/app/modules/show_company/infra/models/user_model.dart';
import 'package:dio/dio.dart';

class ListUsersDatasource implements IListUsersDatasource{
  final Dio dio;

  ListUsersDatasource(this.dio);

  @override
  Future<List<UserModel>> listUsers() async {
    final response = await dio.get(Settings.apiUrl);
    return response.statusCode == 200? (response.data['users'] as List).map((e) => UserModel.fromMap(e)).toList(): throw DataSourceError();
  }
}