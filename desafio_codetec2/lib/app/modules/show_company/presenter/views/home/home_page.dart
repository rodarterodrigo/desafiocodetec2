import 'package:desafio_codetec2/app/modules/show_company/domain/entities/company.dart';
import 'package:desafio_codetec2/app/modules/show_company/presenter/events/show_company_events.dart';
import 'package:desafio_codetec2/app/modules/show_company/presenter/routes/show_company_routes.dart';
import 'package:desafio_codetec2/app/modules/show_company/presenter/shared/widgets/custom_buttom.dart';
import 'package:desafio_codetec2/app/modules/show_company/presenter/states/show_company_states.dart';
import 'package:desafio_codetec2/app/modules/show_company/presenter/views/home/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Desafio Codetec2"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final bloc = Modular.get<HomeBloc>();

  @override
  void initState(){
    bloc.add(ShowCompanyEvent());
    super.initState();
  }

  @override
  void dispose() {
    bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text(widget.title)),
        ),
        body: StreamBuilder(
          initialData: LoadingState,
          stream: bloc,
          builder: (context, snapshot){
            final state = bloc.state;
            if(state is LoadingState) return Center(child: CircularProgressIndicator());
            if(state is ErrorState)
              return Center(child: Text(state.failureShowCompany.message),);
            final Company company = (state as LoadedSucessState).company;
            return  Center(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        company.name,
                        style: TextStyle(
                          fontSize: 18,
                          color: Theme.of(context).primaryColor
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomButton(onPressed:() => Modular.to.pushNamed(Routes.USERSLISTPAGE, arguments: company.users), text: "Colaboradores"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomButton(onPressed:() => Modular.to.pushNamed(Routes.SERVICELISTPAGE, arguments: company.services), text: "Serviços"),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}