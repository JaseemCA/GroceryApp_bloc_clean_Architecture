import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app_bloc/features/cart/ui/cart.dart';
import 'package:grocery_app_bloc/features/home/bloc/home_bloc.dart';

import 'package:grocery_app_bloc/features/home/ui/product_tile_widget.dart';
import 'package:grocery_app_bloc/features/wishlist/ui/whishlist.dart';

class MyHompePage extends StatefulWidget {
  const MyHompePage({super.key});

  @override
  State<MyHompePage> createState() => _MyHompePageState();
}

class _MyHompePageState extends State<MyHompePage> {
  @override
  void initState() {
    homeBloc.add(HomeInitialEvvent());
    super.initState();
  }

  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToClartPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Cart()));
        } else if (state is HomeNavigateToWishListPageActionState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const WhishList()));
        } else if (state is HomeProductItemCartedActionState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Item Carted')));
        } else if (state is HomeProductItemWishlistedActionState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Item Wishlisted')));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState _:
            log('this also worked');
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );

          case HomeLoadedSucessState:
            final successState = state as HomeLoadedSucessState;
            return Scaffold(
              appBar: AppBar(
                title: const Text("Peters Shop"),
                backgroundColor: Colors.amberAccent,
                centerTitle: true,
                actions: [
                  IconButton(
                    onPressed: () {
                      homeBloc.add(HomeWishListButtonNavigationEvent());
                    },
                    icon: const Icon(Icons.favorite_border_outlined),
                  ),
                  IconButton(
                    onPressed: () {
                      homeBloc.add(HomeCartButtonNavigationEvent());
                    },
                    icon: const Icon(Icons.card_travel),
                  )
                ],
              ),
              body: ListView.builder(
                  itemCount: successState.products.length,
                  itemBuilder: (context, index) {
                    return productTileWidget(
                        homeBloc: homeBloc,
                        productDataModel: successState.products[index]);
                  }),
            );

          case HomeErrorState:
            return const Scaffold(
              body: Center(
                child: Text("ERROR"),
              ),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
