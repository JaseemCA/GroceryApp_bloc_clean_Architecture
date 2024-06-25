import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app_bloc/features/cart/ui/cart.dart';
import 'package:grocery_app_bloc/features/home/bloc/home_bloc.dart';
import 'package:grocery_app_bloc/features/wishlist/ui/whishlist.dart';

class MyHompePage extends StatefulWidget {
  const MyHompePage({super.key});

  @override
  State<MyHompePage> createState() => _MyHompePageState();
}

class _MyHompePageState extends State<MyHompePage> {
  final HomeBloc homeBloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,

      // ignore: unnecessary_type_check
      listenWhen: (previous, current) => current is HomeState,
      // ignore: unnecessary_type_check
      buildWhen: (previous, current) => current is! HomeState,
      listener: (context, state) {
        if (state is HomeNavigateToClartPageActionState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Cartpage()));
        } else if (state is HomeNavigateToWishListPageActionState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const WhishList()));
        }
      },
      builder: (context, state) {
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
        );
      },
    );
  }
}
