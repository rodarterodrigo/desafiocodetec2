import 'package:bloc/bloc.dart';
import 'package:desafio_codetec2/app/modules/list_users/domain/usecases/show_company.dart';
import 'package:desafio_codetec2/app/modules/list_users/presenter/events/show_company_events.dart';
import 'package:desafio_codetec2/app/modules/list_users/presenter/states/show_company_states.dart';

class HomeBloc extends Bloc<ShowCompanyEvents, ShowCompanyState> {
  final ShowCompany showCompany;
  HomeBloc(this.showCompany) : super(LoadingState());

  @override
  Stream<ShowCompanyState> mapEventToState(ShowCompanyEvents event) async*{
    if(event is ShowCompanyEvent)
      yield* _mapCompanyToState(event);
  }

  Stream<ShowCompanyState> _mapCompanyToState(ShowCompanyEvent event) async* {
    yield LoadingState();
    final result = (await this.showCompany.showCompany());
    yield result.fold((l) => ErrorState(l), (r) => LoadedSucessState(r));
  }
}
