part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

abstract class HomeActionState extends HomeState {}

final class HomeblocInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedSucessState extends HomeState {
  final List<ProductDataModel> products;

  HomeLoadedSucessState({required this.products});
}

class HomeErrorState extends HomeState {}

class HomeNavigateToWishListPageActionState extends HomeActionState {}

class HomeNavigateToClartPageActionState extends HomeActionState {}

class HomeProductItemWishlistedActionState extends HomeActionState {}

class HomeProductItemCartedActionState extends HomeActionState {}
