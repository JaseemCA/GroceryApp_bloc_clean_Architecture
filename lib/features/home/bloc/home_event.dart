part of 'home_bloc.dart';

@immutable
abstract class HomeblocEvent {}

class HomeInitialEvvent extends HomeblocEvent {}

class HomeProductWishlistButtonClickedEvent extends HomeblocEvent {
  final ProductDataModel clickedProduct;

  HomeProductWishlistButtonClickedEvent({required this.clickedProduct});
}

class HomeProductCartButtonClickedEvent extends HomeblocEvent {
  final ProductDataModel clickedProduct;

  HomeProductCartButtonClickedEvent({required this.clickedProduct});
}

class HomeWishListButtonNavigationEvent extends HomeblocEvent {}

class HomeCartButtonNavigationEvent extends HomeblocEvent {}
