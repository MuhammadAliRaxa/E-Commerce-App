import 'package:bloc/bloc.dart';
import 'package:flutter_e_commerce_app/data/models/product.dart';
import 'package:flutter_e_commerce_app/data/repoositries/product_repositry.dart';
import 'package:meta/meta.dart';

part 'home_products_event.dart';
part 'home_products_state.dart';

class HomeProductsBloc extends Bloc<HomeProductsEvent, HomeProductsState> {
  ProductRepositry repositry=ProductRepositry();
  HomeProductsBloc() : super(HomeProductsState(isAll: true,isBag: false,  isClothes:false ,isElectronics: false,isShoes: false)) {
    on<FetchProducts>((event, emit) async{
      emit(HomeProductsLoading(isAll: true,isBag: false,  isClothes:false ,isElectronics: false,isShoes: false));
      try {
        var prod=await repositry.getAllProducts();
        emit(HomeProductsLoaded(products: prod,isAll: true,isBag: false,  isClothes:false ,isElectronics: false,isShoes: false));
      } catch (e) {
        emit(HomeProductsError());
      }
    });
    on<FetchShoes>((event, emit) async{
      emit(HomeProductsLoading(isAll: false,isBag: false,  isClothes:false ,isElectronics: false,isShoes: true));
      try {
        var p=await repositry.getAllProducts();
        var prod=repositry.shoesProducts(p);
        emit(HomeProductsLoaded(products: prod,isAll: false,isBag: false,  isClothes:false ,isElectronics: false,isShoes: true));
      } catch (e) {
        emit(HomeProductsError());
      }
    });
    on<FetchClothes>((event, emit) async{
      emit(HomeProductsLoading(isAll: false,isBag: false,  isClothes:true ,isElectronics: false,isShoes: false));
      try {
        var p=await repositry.getAllProducts();
        var prod=repositry.clothesProducts(p);
        emit(HomeProductsLoaded(products: prod,isAll: false,isBag: false,  isClothes:true ,isElectronics: false,isShoes: false));
      } catch (e) {
        emit(HomeProductsError());
      }
    });
    on<FetchBags>((event, emit) async{
      emit(HomeProductsLoading(isAll: false,isBag: true,  isClothes:false ,isElectronics: false,isShoes: false));
      try {
        var p=await repositry.getAllProducts();
        var prod=repositry.bagsProducts(p);
        emit(HomeProductsLoaded(products: prod,isAll: false,isBag: true,  isClothes:false ,isElectronics: false,isShoes: false));
      } catch (e) {
        emit(HomeProductsError());
      }
    });
    on<FetchElectronics>((event, emit) async{
      emit(HomeProductsLoading(isAll: false,isBag: false,  isClothes:false ,isElectronics: true,isShoes: false));
      try {
        var p=await repositry.getAllProducts();
        var prod=repositry.electronicsProducts(p);
        emit(HomeProductsLoaded(products: prod, isAll: false,isBag: false,  isClothes:false ,isElectronics: true,isShoes: false));
      } catch (e) {
        emit(HomeProductsError());
      }
    });
    on<FetchFavourites>((event, emit) async{
      emit(HomeProductsLoading(isAll: false,isBag: false,  isClothes:false ,isElectronics: false,isShoes: false));
      try {
        var p=await repositry.getAllProducts();
        var prod=repositry.favouriteProducts(p);
        emit(HomeProductsLoaded(products: prod,isAll: false,isBag: false,  isClothes:false ,isElectronics: false,isShoes: false));
      } catch (e) {
        emit(HomeProductsError());
      }
    });
    

  }
}
