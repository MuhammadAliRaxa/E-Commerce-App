import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_e_commerce_app/bloc/counter_quantity/bloc_event.dart';
import 'package:flutter_e_commerce_app/bloc/counter_quantity/quantity_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class ShippingAddress extends StatefulWidget {
  const ShippingAddress({super.key});

  @override
  State<ShippingAddress> createState() => _ShippingAddressState();
}

class _ShippingAddressState extends State<ShippingAddress> {
  TextEditingController address= TextEditingController();
  final formState=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var Size(:height,:width)=MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("shipping Address",style: GoogleFonts.anta(),),
      ),
      body:Padding(
        padding: EdgeInsets.all(25),
        child: Form(key: formState,child: Column(
          spacing: 15,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: address,
              validator: (value) {
                if(value!.isNotEmpty){
                  return null;
                }
                return "Field cannot be Empty"; 
              },
              decoration: InputDecoration(hintText: "Enter Address",border: OutlineInputBorder(borderRadius: BorderRadius.circular(50))),
            ),
            TextFormField(
              
              validator: (value) {
                if(value!.isNotEmpty){
                  return null;
                }
                return "Field cannot be Empty"; 
              },
              decoration: InputDecoration(hintText: "Enter Postal Address",border: OutlineInputBorder(borderRadius: BorderRadius.circular(50))),
            ),
            Padding(padding: EdgeInsets.all(15)),
            SizedBox(
              height: height*0.07,
              width: width,
              child: ElevatedButton(
                style: ButtonStyle(backgroundColor: WidgetStateColor.resolveWith((states) => Colors.black,)),
                onPressed: (){
                  if(formState.currentState!.validate()){
                    context.read<QuantityBloc>().add(onAddressEvent(address: address.text));
                    Navigator.pop(context);
                  }
              }, child: Text("Add Address",style: GoogleFonts.anta(color: Colors.white),)),
            )
          ],
        )),
      ),
    );
  }
}