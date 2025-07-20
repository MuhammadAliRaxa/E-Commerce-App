// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_e_commerce_app/BLOC/page_view_bloc/page_view_bloc.dart';
// import 'package:flutter_e_commerce_app/screens/HomePage/home_page.dart';

// class Generateroute {
//   Route<dynamic> generate(RouteSettings settings){
//     var args=settings.arguments;
//     switch (settings.name) {
//       case "/":
//         return MaterialPageRoute(builder: (context) => BlocProvider<PageViewBloc>.value(value: PageViewBloc() ,
//         child: HomePage()
//         )
//         );
//       default: 
//       return MaterialPageRoute(builder: (context) => Center(child: Text("Error"),));  
//     }
    
//     }
// }