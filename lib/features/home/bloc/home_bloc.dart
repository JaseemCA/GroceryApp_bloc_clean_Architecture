import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeblocEvent, HomeState> {
  HomeBloc() : super(HomeblocInitial()) {
    on<HomeProductWishlistButtonClickedEvent>(
        homeProductWishlistButtonClickedEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeWishListButtonNavigationEvent>(homeWishListButtonNavigationEvent);
    on<HomeCartButtonNavigationEvent>(homeCartButtonNavigationEvent);
  }

  FutureOr<void> homeProductWishlistButtonClickedEvent(
      HomeProductWishlistButtonClickedEvent event, Emitter<HomeState> emit) {
    // print("wishList Clicked");
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
    // print("cart Clicke");
  }

  FutureOr<void> homeWishListButtonNavigationEvent(
      HomeWishListButtonNavigationEvent event, Emitter<HomeState> emit) {
    // print(("wish Navigation"));
    emit(HomeNavigateToWishListPageActionState());
  }

  FutureOr<void> homeCartButtonNavigationEvent(
      HomeCartButtonNavigationEvent event, Emitter<HomeState> emit) {
    // print("cart Navigation");
    emit(HomeNavigateToClartPageActionState());
  }
}
