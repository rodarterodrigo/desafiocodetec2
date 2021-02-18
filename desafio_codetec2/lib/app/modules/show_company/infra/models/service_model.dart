import 'package:desafio_codetec2/app/modules/show_company/domain/entities/services.dart';

class ServiceModel extends Service{
  ServiceModel({name}):super(name: name);

  @override
  String toString() => '{ ${this.name} }';

  static ServiceModel fromMap(Map<String, dynamic> map) => map == null? null: ServiceModel(name: map['name']);
}