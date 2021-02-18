import 'package:desafio_codetec2/app/modules/show_company/domain/entities/user.dart';
import 'package:desafio_codetec2/app/modules/show_company/presenter/routes/show_company_routes.dart';
import 'package:desafio_codetec2/app/modules/show_company/presenter/shared/enums/buttom_style.dart';
import 'package:desafio_codetec2/app/modules/show_company/presenter/shared/widgets/custom_buttom.dart';
import 'package:desafio_codetec2/app/modules/show_company/presenter/shared/widgets/user_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class UsersListPage extends StatelessWidget {
  final List<User> users;

  UsersListPage({this.users});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Container(),
          centerTitle: true,
          elevation: 8,
          title: Text(
            "Colaboradores"
          )
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height/1.4,
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    elevation: 8,
                    color: Theme.of(context).primaryColor,
                    child: ListView.separated(
                      itemBuilder: (context, index){
                        return Padding(
                          padding: EdgeInsets.all(8),
                          child: UserCard(
                            onTap: () => Modular.to.pushNamed(Routes.USERDETAILPAGE, arguments: users[index]),
                            office: users[index].office,
                            image: users[index].avatar,
                            heroTag: users[index].avatar,
                            name: users[index].name,
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => Divider(color: Colors.transparent,),
                      itemCount: users.length,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomButton(onPressed: () => Modular.to.pop(Routes.HOME), text: "Voltar", buttonStyle: CustomButtonStyle.Secondary,),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}