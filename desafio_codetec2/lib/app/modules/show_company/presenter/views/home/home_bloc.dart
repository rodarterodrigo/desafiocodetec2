import 'package:bloc/bloc.dart';
import 'package:desafio_codetec2/app/modules/show_company/domain/usecases/show_company.dart';
import 'package:desafio_codetec2/app/modules/show_company/presenter/events/show_company_events.dart';
import 'package:desafio_codetec2/app/modules/show_company/presenter/helpers/verify_connection.dart';
import 'package:desafio_codetec2/app/modules/show_company/presenter/states/show_company_states.dart';

class HomeBloc extends Bloc<ShowCompanyEvents, ShowCompanyState> {
  final ShowCompany showCompany;
  HomeBloc(this.showCompany) : super(LoadingState());

  @override
  Stream<ShowCompanyState> mapEventToState(ShowCompanyEvents event) async*{
    if(event is ShowCompanyEvent)
      yield* _mapCompanyToState(event);
  }

  Stream<ShowCompanyState> _mapCompanyToState(ShowCompanyEvent event) async* {
    if(await VerifyConnection.verifyConnection() == true) {
      yield LoadingState();
      final result = (await this.showCompany.showCompany());
      yield result.fold((l) => ErrorState(l), (r) => LoadedSucessState(r));
    }
  }
}