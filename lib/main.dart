import 'package:flutter/material.dart';
import 'package:grocery_app_bloc/features/home/ui/home_page.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(

      debugShowCheckedModeBanner: false,


      theme: ThemeData(primaryColor: Colors.amberAccent),
      home: MyHompePage(),
    );
  }
}
