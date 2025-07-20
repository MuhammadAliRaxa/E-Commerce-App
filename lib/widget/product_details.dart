import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce_app/bloc/product_bloc/bloc_event.dart';
import 'package:flutter_e_commerce_app/bloc/product_bloc/bloc_state.dart';
import 'package:flutter_e_commerce_app/bloc/product_bloc/product_bloc.dart';
import 'package:flutter_e_commerce_app/data/models/product.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as Product;
    var Size(height:height,width:width)=MediaQuery.sizeOf(context);
    return Scaffold(
      body: BlocBuilder<ProductBloc,ProductState>(
        bloc: context.watch<ProductBloc>(),
        builder: (context, state) =>SafeArea(
          child: Container(
            color: const Color.fromARGB(232, 190, 187, 179),
            child: Column(
              children: [
             SizedBox(
              height: height*0.45,
                width: width,
               child: Container(
                height: 150,
                width: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(fit: BoxFit.contain,image: NetworkImage(product.image)),
                ),
               ),
             ),
             Padding(
              padding:EdgeInsets.all(5),
               child: Container(
                height: height*0.50,
                width: width,
                decoration: BoxDecoration(
                  color: Colors.white60,
                  borderRadius: BorderRadius.only(topLeft:Radius.circular(40) ,topRight: Radius.circular(40))
                ),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    spacing: 15,
                    children: [
                      Padding(padding: EdgeInsets.all(5)),
                      AnimationConfiguration.staggeredList(
                        position: 1,
                        duration:const Duration(milliseconds: 300),
                        child: SlideAnimation(
                          child: FadeInAnimation(
                            child: Row(
                              children: [
                                Expanded(flex:8,child: SizedBox(child: Text(product.name,style: GoogleFonts.anta(fontSize: 30),))),
                                Expanded(flex:2,child:Align(alignment: Alignment.centerRight,child:IconButton(onPressed: (){
                                  if(product.isFavourite==true){
                                    product.isFavourite=false;
                                  }else{
                                    product.isFavourite==true;
                                  }
                                },icon:Icon(product.isFavourite?Icons.favorite_rounded:Icons.favorite_outline_outlined)),))
                              ],
                            ),
                          ),
                        ),
                      ),
                      AnimationConfiguration.staggeredList(
                        position: 2,
                        duration: const Duration(milliseconds: 300),
                        child: SlideAnimation(
                          horizontalOffset: 100,
                          child: FadeInAnimation(
                            child: Align(alignment: Alignment.centerLeft,child: Row(
                              children: [
                                Icon(Icons.star_half_rounded),
                                Text(product.rating.toString(),style: GoogleFonts.anta(fontSize: 15),),
                              ],
                            )),
                          ),
                        ),
                      ),
                      Container(
                        height: 1,
                        width: double.infinity,
                        color: Colors.black45,
                      ),
                      AnimationConfiguration.staggeredList(
                        position: 3,
                        duration: const Duration(milliseconds: 300),
                        child: SlideAnimation(
                          horizontalOffset: 100,
                          child: FadeInAnimation(
                            child: Align(alignment: Alignment.bottomLeft
                            ,child: Text("Description",style: GoogleFonts.anta(fontSize: 20),)),
                          ),
                        ),
                      ),
                      AnimationConfiguration.staggeredList(
                        position: 4,
                        child: SlideAnimation(
                          horizontalOffset: 100,
                          child: FadeInAnimation(
                            child: Container(
                              child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                              style: GoogleFonts.anta(fontSize: 13),),
                            ),
                          ),
                        ),
                      ),
                      AnimationConfiguration.staggeredList(
                        position: 5,
                        child: SlideAnimation(
                          horizontalOffset: 100,
                          child: FadeInAnimation(
                            child: Row(
                              spacing: 20,
                              children: [
                                Text("Quantity",style: GoogleFonts.anta(fontSize: 20),),
                                Container(width: 150,height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30)
                                  ,color: const Color.fromARGB(232, 190, 187, 179),
                                ),
                                child: Row(
                                  children: [
                                     Expanded(flex: 2,child: TextButton(onPressed: (){
                                      context.read<ProductBloc>().add(const DecreamentProductQuantityEvent());
                                     }, child: Text('-',style: TextStyle(fontSize: 20,)))),
                                     Expanded(flex: 2,child: Align(alignment: Alignment.center,child: Text(state.quantity.toString(),style: GoogleFonts.anta(fontSize: 16),))),
                                     Expanded(flex: 2,child: TextButton(onPressed: (){
                                      context.read<ProductBloc>().add(const IncreamentProductQantityEvent());
                                     }, child: Text("+",style: TextStyle(fontSize: 20),)))
                                  ],
                                ),)
                              ],
                            ),
                          ),
                        ),
                        
                      ),
                      Container(
                        height: 1,
                        width: double.infinity,
                        color: Colors.black45,
                      ),
                      AnimationConfiguration.staggeredList(
                        position: 6,
                        child: FadeInAnimation(
                          child: SlideAnimation(
                            horizontalOffset: 100,
                            child: Row(
                              spacing: 25,
                              children: [
                                Column(
                                  children: [
                                    Text("total Price",style: GoogleFonts.anta(fontSize: 14,color: Colors.black26),),
                                    Text("Rs.${product.price}",style: GoogleFonts.anta(fontSize: 20),)
                                  ],
                                ),
                                Expanded(
                                  flex:7,
                                  child: SizedBox(
                                    height: 60,
                                    width: 250,
                                    child: ElevatedButton(style: ButtonStyle(backgroundColor:WidgetStateColor.resolveWith((states) => const Color.fromARGB(232, 190, 187, 179),)),onPressed: (){
                                      context.read<ProductBloc>().add(AddToCartEvent(product: product,quantity: state.quantity,context: context));
                                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Added Successfully  !")));
                                    }, child: Text("Add to Cart",style: GoogleFonts.anta(fontSize: 20,color: Colors.black),)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
               ),
             ),
            ],
            ),
          ),
        ),
      ),
    );
  }
}