part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistEvent {}

class WhishListIniTialEvent extends WishlistEvent{


}

class WhishRemoveFromEvent extends WishlistEvent {
  final ProductDataModel productDataModel;
  WhishRemoveFromEvent({
    required this.productDataModel,
  });
}