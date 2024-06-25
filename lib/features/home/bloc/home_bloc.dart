import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:grocery_app_bloc/data/grocery_data.dart';
import 'package:grocery_app_bloc/features/home/models/home_products_model.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeblocEvent, HomeState> {
  HomeBloc() : super(HomeblocInitial()) {
    on<HomeInitialEvvent>(homeInitialEvvent);
    on<HomeProductWishlistButtonClickedEvent>(
        homeProductWishlistButtonClickedEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeWishListButtonNavigationEvent>(homeWishListButtonNavigationEvent);
    on<HomeCartButtonNavigationEvent>(homeCartButtonNavigationEvent);
  }
  FutureOr<void> homeInitialEvvent(
      HomeInitialEvvent event, Emitter<HomeState> emit) async {
    // print('worked');
    emit(HomeLoadingState());
    // print('successfully emitted');
    await Future.delayed(const Duration(seconds: 3));
    emit(HomeLoadedSucessState(
        products: Grocery.groceryProducts
            .map((e) => ProductDataModel(
                id: e['id'],
                name: e['name'],
                price: e['price'],
                imageurl: e['imageUrl']))
            .toList()));
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
