import 'package:contact_tracer/main/login.dart';
import 'package:contact_tracer/main/register.dart';
import 'package:flutter/material.dart';
import 'package:contact_tracer/main/landing.dart';

Widget appbar(BuildContext context,int type){
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: Container(padding:EdgeInsets.only(left: 10),child: IconButton(icon: Icon(Icons.arrow_back_sharp,size: 30,color: Colors.white,),onPressed: (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Landing()));
    },)),
    actions: [
      type==1?TextButton(child: Text('Sign In',style: TextStyle(color: Colors.white,fontSize: 21),),onPressed: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Login()));},):
      TextButton(child: Text('Sign Up',style: TextStyle(color: Colors.white,fontSize: 21),),onPressed: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Register()));},),
      TextButton(child: Text('Help',style: TextStyle(color: Colors.white,fontSize: 21),),onPressed: (){},),
      SizedBox(width: 10,)
    ],
  );
}