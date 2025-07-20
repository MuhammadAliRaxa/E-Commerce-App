import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce_app/bloc/cart_product/cart_bloc.dart';
import 'package:flutter_e_commerce_app/bloc/counter_quantity/quantity_bloc.dart';
import 'package:flutter_e_commerce_app/bloc/home_products/home_products_bloc.dart';
import 'package:flutter_e_commerce_app/bloc/page_view_bloc/page_view_bloc.dart';
import 'package:flutter_e_commerce_app/bloc/product_bloc/product_bloc.dart';
import 'package:flutter_e_commerce_app/Configs/firebase_options.dart';
import 'package:flutter_e_commerce_app/Screens/SplashScreen/splash_screen.dart';
import 'package:flutter_e_commerce_app/Configs/sharedPreferances.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedpreferancesHelper.makeInstance();
  runApp(const MyApp());
  Future.microtask(()async {
    await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  await Supabase.initialize(
    url:"https://nfbxobdfcsgxopvhvljs.supabase.co", 
    anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5mYnhvYmRmY3NneG9wdmh2bGpzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDk3MjIwNTgsImV4cCI6MjA2NTI5ODA1OH0.fkcO8MYpHOGFIyl_OtrTNHxL1c5kBE9Gb6JHxcdWukk");
  },);
}
Future<void> initfirebase(void _)async{
  await SharedpreferancesHelper.makeInstance();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  await Supabase.initialize(
    url:"https://nfbxobdfcsgxopvhvljs.supabase.co", 
    anonKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5mYnhvYmRmY3NneG9wdmh2bGpzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDk3MjIwNTgsImV4cCI6MjA2NTI5ODA1OH0.fkcO8MYpHOGFIyl_OtrTNHxL1c5kBE9Gb6JHxcdWukk");
} 
final supabase=Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CartBloc>(create: (_) => CartBloc()),
        BlocProvider<QuantityBloc>(create: (context) => QuantityBloc(),),
        BlocProvider<ProductBloc>(create:(context) => ProductBloc(),),
        BlocProvider<PageViewBloc>(create:  (context) => PageViewBloc(),),
        BlocProvider<HomeProductsBloc>(create:  (context) => HomeProductsBloc(),),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        ),
        home: SplashScreen(),
      ),
    );
  }
}