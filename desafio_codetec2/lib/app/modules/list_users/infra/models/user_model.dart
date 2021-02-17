import 'package:desafio_codetec2/app/modules/list_users/domain/entities/user.dart';

class UserModel extends User{
  UserModel({name, age, avatar, phone}):super(name: name, age: age, avatar: avatar, phone: phone);

  @override
  String toString() => '{ ${this.name}, ${this.age}, ${this.phone} }';

  static UserModel fromMap(Map<String, dynamic> map) => map == null? null: UserModel(name: map['name'], age: map['age'], avatar: map['avatar'], phone: map['phone']);
}