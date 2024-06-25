part of 'home_bloc.dart';

@immutable
abstract class HomeState {}


abstract class HomeActionState extends HomeState{}

final class HomeblocInitial extends HomeState {}

class HomeLoadingState extends HomeState{}


class HomeLoadedSucessState extends HomeState{}

class HomeErrorState extends HomeState{}

class HomeNavigateToWishListPageActionState extends HomeActionState{}


class HomeNavigateToClartPageActionState extends HomeActionState{}
