part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistState {}


abstract class whishListActionState extends WhishList{}


final class WishlistInitial extends WishlistState {}



class WishListSuccessState extends  WishlistState{
  final List<ProductDataModel> whishListItems;
  WishListSuccessState({
    required this.whishListItems,
  });
}