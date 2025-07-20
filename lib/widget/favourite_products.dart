import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/data/models/product.dart';
import 'package:flutter_e_commerce_app/widget/products.dart';

class FavouriteProducts extends StatelessWidget {
  final List<Product> FavouriteList;
  const FavouriteProducts({required this.FavouriteList,super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text("My Wishlist",style: TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.bold
            ),),
          ),
          Products(productList: FavouriteList)
        ],
      ),
    );
  }
}