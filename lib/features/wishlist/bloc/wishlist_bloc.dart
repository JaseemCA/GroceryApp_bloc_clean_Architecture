import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:grocery_app_bloc/data/wishlist_item.dart';
import 'package:grocery_app_bloc/features/home/models/home_products_model.dart';
import 'package:grocery_app_bloc/features/wishlist/ui/whishlist.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistEvent>(wishlistInitiaEvent);
  }

  FutureOr<void> wishlistInitiaEvent(
      WishlistEvent event, Emitter<WishlistState> emit) {
    emit(WishListSuccessState(whishListItems: wishlistItems));
  }
}
