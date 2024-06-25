part of 'home_bloc.dart';

@immutable
abstract class HomeblocEvent {}

class HomeInitialEvvent extends HomeblocEvent {

  
}

class HomeProductWishlistButtonClickedEvent extends HomeblocEvent {}

class HomeProductCartButtonClickedEvent extends HomeblocEvent {}

class HomeWishListButtonNavigationEvent extends HomeblocEvent {}

class HomeCartButtonNavigationEvent extends HomeblocEvent {}
