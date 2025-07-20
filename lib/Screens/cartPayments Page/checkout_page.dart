import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/data/models/cart_product.dart';
import 'package:flutter_e_commerce_app/data/models/cart_product.dart';
import 'package:flutter_e_commerce_app/widget/cart_product_details.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckoutPage extends StatelessWidget {
  final List<CartProduct> products;
  const CheckoutPage({required this.products,super.key});

  @override
  Widget build(BuildContext context) {
    var Size(:height,:width)=MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkout"),
      ),
      body: Column(
        children: [
          Container(
            height: 1,
            color: Colors.black38,
          ),
          Expanded(
            flex:2,
            child: Padding(
                padding: EdgeInsets.all(15),
                child: Container(
                  height: 140,
              
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child:Padding(
                    padding: EdgeInsets.all(20),
                    child: Row(
                      spacing: 20,
                      children: [
                        Expanded(
                          
                          child: CircleAvatar(
                            radius: width*0.06,
                            backgroundColor: Colors.black38,
                            child: Icon(Icons.location_on_rounded,),
                          ) 
                          ),
                          Expanded(
                            flex: 3,
                            child: Column(
                            spacing: 10,
                            children: [
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    children: [
                                      Expanded(flex: 8,child: SizedBox(child: Text("Home",style: GoogleFonts.anta(fontSize: 20),))),
                                      Expanded(child: Align(alignment: Alignment.bottomRight,child: IconButton(onPressed: (){},icon: Icon(Icons.edit_note_outlined,size: width*0.1,),),))
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    children: [
                                      Text("Home Addresss ")
                                    ],
                                  ),
                                ),
                            ],
                          ))
                      ],
                    ),
                  ),
                ),
            ),
          ),
          Container(
            height: 1,
            color: Colors.black38,
          ),
          Expanded(flex:8,child: ListView.builder(itemCount:products.length ,itemBuilder: (parent, index)=>
            //CartProductDetails(product:products[index])
            Padding(
          padding: EdgeInsets.all(15),
          child: Container(
            height: 140,
        
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20)
            ),
            child:Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                spacing: 20,
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(232, 190, 187, 179),
                        image: DecorationImage(image: NetworkImage(products[index].image))
                      ),
                    ) 
                    ),
                    Expanded(
                      flex: 6,
                      child: Column(
                      spacing: 10,
                      children: [
                          Expanded(
                            flex: 2,
                            child: Row(
                              children: [
                                Expanded(flex: 8,child: SizedBox(child: Text(products[index].name,style: GoogleFonts.anta(fontSize: 20),))),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Row(
                              children: [
                                Icon(Icons.star_half_outlined),
                                Text(products[index].rating.toString())
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Row(
                              children: [
                                Expanded(flex: 5,child: Text("Rs.${products[index].price}",style: GoogleFonts.anta(),)),
                                Expanded(
                                  flex: 4,
                                  child: Container(width: 70,height: 30,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30)
                                        ,color: const Color.fromARGB(232, 190, 187, 179),
                                      ),
                                      child: Row(
                                        children: [
                                           Expanded(flex: 2,child: TextButton(onPressed: (){
                                            //context.read<QuantityBloc>().add(const DecreamentQuantityEvent());
                                           }, child: Text('-',style: TextStyle(fontSize: 10,)))),
                                           Expanded(flex: 2,child: Align(alignment: Alignment.center,child: Text(products[index].quantity.toString(),style: GoogleFonts.anta(fontSize: 8),))),
                                           Expanded(flex: 2,child: TextButton(onPressed: (){
                                              //context.read<QuantityBloc>().add(IncreamentQantityEvent());
                                              
                                           }, child: Text("+",style: TextStyle(fontSize: 10),)))
                                        ],
                                      ),),
                                )
                              ],
                            ),
                          )
                      ],
                    ))
                ],
              ),
            ),
          ),
      ),
            ),)
        ],
      ),
      bottomNavigationBar: Container(
        height: height*0.11,
        width: width,
        color: Colors.white,
        child: Padding(padding: EdgeInsets.all(20),child: ElevatedButton(
          style: ButtonStyle(backgroundColor: WidgetStateColor.resolveWith((states) => Colors.black,)),
          onPressed: (){
            
          }, child: Text("Continue",style: GoogleFonts.anta(fontSize: 20,color: Colors.white),)),)
      ),
    );
  }
}