import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_e_commerce_app/data/models/cart_product.dart';

import '../models/product.dart';

class ProductSourceData {
  final db = FirebaseFirestore.instance;
  Future<List<Product>> getAllProducts()async{
    return await db.collection("products").get().then((value) => value.docs.map((e)=>Product.fromJson(e.data())).toList(),);
  }
  List<Product> shoesProducts(List<Product> list){
    List<Product> shoes=[];
    for(int i=0;i<list.length;i++){
      if(list[i].isShoes==true){
          shoes.add(list[i]);
      }
    }
    return shoes;
  }

  List<Product> favouriteProduct(List<Product> list){
    List<Product> favourite=[];
    for(int i=0;i<list.length;i++){
      if(list[i].isFavourite==true){
          favourite.add(list[i]);
      }
    }
    return favourite;
  }
  List<Product> bagsProducts(List<Product> list){
    List<Product> shoes=[];
    for(int i=0;i<list.length;i++){
      if(list[i].isBags==true){
          shoes.add(list[i]);
      }
    }
    return shoes;
  }
  List<Product> clothesProducts(List<Product> list){
    List<Product> favourite=[];
    for(int i=0;i<list.length;i++){
      if(list[i].isClothes==true){
          favourite.add(list[i]);
      }
    }
    return favourite;
  }
  List<Product> electronicsProducts(List<Product> list){
    List<Product> shoes=[];
    for(int i=0;i<list.length;i++){
      if(list[i].isElectronics==true){
          shoes.add(list[i]);
      }
    }
    return shoes;
  }
  Future<void> removeProductInCart(String product)async{
    try {
      var p=await db.collection("cart_products").doc("${product}").get();
      if(p.exists){
        await db.collection("cart_products").doc("${product}").delete();
      }
    } catch (e) {
      throw Exception(e);
    }
  }
  Future<List<CartProduct>> getAllCartProducts()async{
    return db.collection("cart_products").get().then((value) => value.docs.map((e) => CartProduct.fromJson(e.data(),e.id),).toList(),);
  }
  Future<void> addCartProduct(Product product,int quantity)async{
    try {
      CartProduct cart=CartProduct(name: product.name, price: product.price, image: product.image, quantity: 1, rating: product.rating);
      var exist=await db.collection("cart_products").doc("${product.id}").get();
      if(!exist.exists){
        var cartProduct=await db.collection("cart_products").doc("${product.id}").set(cart.toJson());
        print("${product.id}");
      }else{
        throw Exception("Already available");
      }
        } catch (e) {
      throw Exception(e.toString());
    }
  }
}