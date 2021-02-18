import 'package:desafio_codetec2/app/modules/show_company/domain/entities/user.dart';
import 'package:desafio_codetec2/app/modules/show_company/presenter/routes/show_company_routes.dart';
import 'package:desafio_codetec2/app/modules/show_company/presenter/shared/enums/buttom_style.dart';
import 'package:desafio_codetec2/app/modules/show_company/presenter/shared/widgets/custom_buttom.dart';
import 'package:desafio_codetec2/app/modules/show_company/presenter/shared/widgets/user_detail_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
class UserDetailPage extends StatelessWidget {
  final User user;

  UserDetailPage(this.user);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Hero(
                  tag: user.avatar,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(80),
                    child: Image.network(
                      user.avatar,
                      height: MediaQuery.of(context).size.height/3,
                      width: MediaQuery.of(context).size.width,
                    ),
                  ),
                ),
                UserDetailRow(field: "Nome", value: user.name),
                UserDetailRow(field: "Cargo", value: user.office,),
                UserDetailRow(field: "Idade", value: user.age,),
                UserDetailRow(field: "Telefone", value: user.phone,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomButton(onPressed: () => Modular.to.pop(Routes.USERSLISTPAGE), text: "Voltar", buttonStyle: CustomButtonStyle.Secondary,),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
    );
  }
}