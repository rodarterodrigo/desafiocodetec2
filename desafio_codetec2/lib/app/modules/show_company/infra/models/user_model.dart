import 'package:desafio_codetec2/app/modules/show_company/domain/entities/user.dart';

class UserModel extends User{
  UserModel({name, age, avatar, phone, office}):super(name: name, age: age, avatar: avatar, phone: phone, office: office);

  @override
  String toString() => '{ ${this.name}, ${this.age}, ${this.phone}, ${this.office} }';

  static UserModel fromMap(Map<String, dynamic> map) => map == null? null:
  UserModel(name: map['name'], age: map['age'], avatar: map['avatar'], phone: map['phone'], office: map['office']);
}