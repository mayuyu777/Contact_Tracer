import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:contact_tracer/main/register.dart';
import 'package:contact_tracer/main/login.dart';

class Landing extends StatelessWidget {
  const Landing({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: Carousel(
              dotSize: 6,
              dotSpacing: 20,
              dotBgColor: Colors.transparent,
              images: [
                Image.asset('lib/assets/2.jpg',fit: BoxFit.cover,),
                Image.asset('lib/assets/3.jpg',fit: BoxFit.cover,),
              ],
            )
          ),
          Container(
            padding: EdgeInsets.only(left: 10,right: 10),
            child: Container(
              child: Stack(
                children: [
                  AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    actions: [
                      TextButton(child: Text('Sign In',style: TextStyle(color: Colors.white,fontSize: 21),),onPressed: (){Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Login()));},),
                      TextButton(child: Text('Help',style: TextStyle(color: Colors.white,fontSize: 21),),onPressed: (){},),
                    ],
                  ),
                  Positioned(
                    bottom: 40,
                      child: Column(
                      children: [
                        SizedBox(height: 20,),
                        Text('Help stop the spread of Covid-19.',style: TextStyle(color: Colors.white,fontSize: 20.5,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                        Text('Sign up now',style: TextStyle(color: Colors.white,fontSize: 19),textAlign: TextAlign.center,),
                        SizedBox(height: 40,),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.redAccent[700],
                            minimumSize: Size(391,50)
                          ),
                          child:Text('GET STARTED',style: TextStyle(color: Colors.white,fontSize: 23),),
                          onPressed: (){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Register()));}
                        ),
                        SizedBox(height: 60,)
                      ],
                    ),
                  )
                ],
              ),
            )
          )
        ],
      )
    );
  }
}