import 'package:flutter/material.dart';
import 'package:flutter_e_commerce_app/main.dart';
import 'package:flutter_e_commerce_app/Screens/HomePage/home_page.dart';
import 'package:flutter_e_commerce_app/Screens/login_User/login.dart';
import 'package:flutter_e_commerce_app/Screens/ProfilePage/profile_page.dart';
import 'package:flutter_e_commerce_app/configs/signIn_signUp_auth.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CreateAccount extends StatefulWidget{

  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  final _formKey=GlobalKey<FormState>();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  void _setupAuthListener() {
    supabase.auth.onAuthStateChange.listen((data) {
      final event = data.event;
      if (event == AuthChangeEvent.signedIn) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
      }
    });
  }
  @override
  void initState() {
    _setupAuthListener();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.sizeOf(context).height,
            minWidth: MediaQuery.sizeOf(context).width
          ),
          child: IntrinsicHeight(
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Expanded(flex: 2,child:SizedBox() ),
                  Expanded(flex: 3,child: SizedBox(
                    child: Text("Create your Account",style: TextStyle(fontSize: 50),),
                  )),
                  Expanded(flex: 1,child: SizedBox()),
                  Expanded(flex: 3,child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty ||
											!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
													.hasMatch(value)) {
										return 'Enter a valid email!';
									}
									return null;
                          },
                          controller: emailController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30),),
                            prefixIcon: Icon(Icons.email),
                            hintText: "Email"
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),TextFormField(
                          validator: (value) {
                            if(value!.isEmpty||value.length<8){
                              return "Please Enter Password at least 8 characters !";
                            }
                            return null;
                          },
                          controller: passwordController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30),),
                            prefixIcon: Icon(Icons.lock),
                            hintText: "Password"
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 50,
                          width: double.infinity,
                          child: ElevatedButton(onPressed: ()async{
                            if(_formKey.currentState!.validate()){
                              try {
                                final response=await SigninSignup.signUpwithEmailandPassword(email: emailController.text, password: passwordController.text);
                                if(response.user!=null){
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("success, Please Confirm Email that we sent to your gmail.")));   
                                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => ProfilePage(email: emailController.text,),));
                                }else{
                                  null;
                                }
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
                              }
                            }
                          },
                          style: ButtonStyle(backgroundColor: WidgetStateColor.resolveWith((states) => Colors.black54,)),
                           child: Text("Sign up",style: TextStyle(
                            fontSize: 15,color: Colors.white
                           ),) ),
                        )
                      ],
                    ),
                  )),
                  Expanded(flex: 1,child: Column(
                    children: [
                      Expanded(child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Container(
                              color: Colors.black38,
                              height: 2,
                            ),
                          ),
                          Expanded(flex: 3,child: Text("  or continue with",selectionColor: Colors.black38,)),
                          Expanded(flex: 3,child: Container(
                              color: Colors.black38,
                              height: 2,
                            ),)
                        ],
                      ))
                    ],
                  )
                  ),
                  Expanded(flex: 1,child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          SigninSignup.googleSignIn();
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(width: 2,color: Colors.black45),
                            image: DecorationImage(image: AssetImage("assets/google-logo.png"),fit: BoxFit.fill)
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(width: 2,color: Colors.black45),
                            image: DecorationImage(image: AssetImage("assets/Twitter-Old-Logo.jpg"),fit: BoxFit.cover)
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(width: 2,color: Colors.black45),
                            image: DecorationImage(image: AssetImage("assets/yahoo.png"),fit: BoxFit.cover)
                          ),
                        ),
                      ),
                    ],
                  )
                  ),
                  Expanded(flex: 1,
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account? ", style: TextStyle(color: Colors.black26,fontSize: 15),),
                        GestureDetector(
                          onTap: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginPage(),)),
                          child: Text('sign in',style: TextStyle(color: Colors.black,fontSize: 20),),
                        )
                      ],
                    ) 
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}