import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app_bloc/features/cart/bloc/cart_bloc.dart';
import 'package:grocery_app_bloc/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:grocery_app_bloc/features/wishlist/ui/wishlist_tile.dart';

class WhishList extends StatefulWidget {
  const WhishList({super.key});

  @override
  State<WhishList> createState() => _WhishListState();
}

class _WhishListState extends State<WhishList> {
  final WishlistBloc wishlistBloc = WishlistBloc();

  @override
  void initState() {
    // cartBloc.add(CartInitialEvent());
    wishlistBloc.add(WhishListIniTialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wish List Items"),
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
      ),
      body: BlocConsumer<WishlistBloc, WishlistState>(
        bloc: wishlistBloc,
        listener: (context, state) {},
        listenWhen: (previous, current) => current is whishListActionState,
        buildWhen: (previous, current) => current is! whishListActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case WishListSuccessState:
              final successState = state as WishListSuccessState;
              return ListView.builder(
                  itemCount: successState.whishListItems.length,
                  itemBuilder: (context, index) {
                    return Whishlist(
                        wishlistBloc: wishlistBloc,
                        productDataModel: successState.whishListItems[index]);
                  });

            default:
          }
          return Container();
        },
      ),
    );
  }
}
