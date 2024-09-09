part of 'sidenav_bar_bloc.dart';

sealed class SidenavBarState extends Equatable {
  const SidenavBarState();
  
  @override
  List<Object> get props => [];
}

final class SidenavBarInitial extends SidenavBarState {}
