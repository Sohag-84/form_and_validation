
import 'package:flutter/material.dart';

import 'package:flutter_neumorphic/flutter_neumorphic.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
   const HomePage({Key? key}) : super(key: key);



  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final formKey = GlobalKey<FormState>();
  String name = '';
  String phoneNumberValidate = r'^(?:[+0]9)?[0-9]{11}$';
  String emailValidate = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  @override
  Widget build(BuildContext context) {


    final double height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.only(left: 40,right: 40),
        child: Form(
          key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height*0.04),
                const Text("Here to get",style: TextStyle(fontSize: 28,color: Colors.grey),),
                const Text("Welcomed !",style: TextStyle(fontSize: 28,color: Colors.grey),),
                SizedBox(height: height*0.05,),
                TextFormField(
                  decoration: const InputDecoration(
                    fillColor: Colors.transparent,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    labelText: "Enter your name",

                  ),
                  validator: (value){  //r'^[A-Z a-z]+$'
                    if(value!.isEmpty || !RegExp(r'^[A-Z a-z]+$').hasMatch(value)){
                      return "Enter correct name";
                    }else{
                      return null;
                    }
                  },
                ),
                SizedBox(height: height*0.05,),
                TextFormField(
                  decoration: const InputDecoration(
                      fillColor: Colors.transparent,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      labelText: "Enter your Phone number"
                  ),
                  validator: (value){
                    if(value!.isEmpty || !RegExp(phoneNumberValidate).hasMatch(value!)){
                      return "Enter correct number";
                    }else{
                      return null;
                    }
                  },
                ),
                SizedBox(height: height*0.05,),
                TextFormField(
                  decoration: const InputDecoration(
                      fillColor: Colors.transparent,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      labelText: "Enter your Email"
                  ),
                  validator: (value){  //r'^[A-Z a-z]+$'
                    if(value!.isEmpty || !RegExp(emailValidate).hasMatch(value!)){
                      return "Enter correct Email";
                    }else{
                      return null;
                    }
                  },
                ),

                SizedBox(height: height*0.05,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Sign Up',style: TextStyle(fontSize: 20,color: Colors.grey),),
                    NeumorphicButton(
                      margin: const EdgeInsets.only(top: 13),
                      onPressed: (){
                        if(formKey.currentState!.validate()){
                          const snackBar = SnackBar(content: Text('Submitting form'));
                          _scaffold.currentState!.showSnackBar(snackBar);
                        }
                      },
                      style: const NeumorphicStyle(
                        color: Colors.deepPurpleAccent,
                        shape: NeumorphicShape.flat,
                        boxShape: NeumorphicBoxShape.circle(),
                      ),
                      child: const Icon(Icons.arrow_forward,color: Colors.white,),
                    )
                    ],
                ),
                SizedBox(height: height*0.07,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Sign in',style: TextStyle(color: Colors.grey),),
                    Text('Forgot password',style: TextStyle(color: Colors.grey),),
                    ],
                )
              ],
            )
        ),
      )
    );
  }
}
