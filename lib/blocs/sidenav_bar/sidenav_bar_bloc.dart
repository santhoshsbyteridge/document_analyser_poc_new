import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sidenav_bar_event.dart';
part 'sidenav_bar_state.dart';

class SidenavBarBloc extends Bloc<SidenavBarEvent, SidenavBarState> {
  SidenavBarBloc() : super(SidenavBarInitial()) {
    on<SidenavBarEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
