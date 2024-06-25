// import 'package:flutter/material.dart';
// import 'package:grocery_app_bloc/features/cart/bloc/cart_bloc.dart';

// class Cartpage extends StatefulWidget {
//   const Cartpage({super.key});

//   @override
//   State<Cartpage> createState() => _CartpageState();
// }

// class _CartpageState extends State<Cartpage> {
//   @override
//   Widget build(BuildContext context) {
//     final CartBloc cartBloc = CartBloc();
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("CART ITEMS"),
//         backgroundColor: Colors.amberAccent,
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:grocery_app_bloc/features/cart/bloc/cart_bloc.dart';
import 'package:grocery_app_bloc/features/cart/ui/cart_tile_widget.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartBloc cartBloc = CartBloc();
  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.amberAccent,
        title:const Text('Cart Items'),
      ),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,
        listener: (context, state) {
          
        },
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is! CartActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartSuccessState:
              final successState = state as CartSuccessState;
              return ListView.builder(
                  itemCount: successState.cartItems.length,
                  itemBuilder: (context, index) {
                    return CartTileWidget(
                        cartBloc: cartBloc,
                        productDataModel: successState.cartItems[index]);
                  });

            default:
          }
          return Container();
        },
      ),
    );
  }
}