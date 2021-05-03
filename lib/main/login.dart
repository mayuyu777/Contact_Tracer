import 'package:contact_tracer/main/forgotpass.dart';
import 'package:flutter/material.dart';
import 'package:contact_tracer/widgets/widgets.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final _emailcontroller = TextEditingController();
  final  _passwordcontroller = TextEditingController();
  bool isobscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage('lib/assets/3.jpg'),fit: BoxFit.cover)),
        child: Stack(
          children: [
            appbar(context,2),
            Center(
              child: SingleChildScrollView(
                  child: Container(
                  margin: EdgeInsets.only(top:50),
                  width: 360,
                  child: Column(
                    children: [
                      TextFormField(
                        controller:_emailcontroller,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.done,
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                          labelStyle: TextStyle(color: Colors.white70),
                          filled: true,
                          fillColor: Colors.black45,
                          border: OutlineInputBorder(),
                          labelText: "Email",
                          prefixIcon: Icon(Icons.email),
                        ),
                        validator: (value){
                          final pattern = r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)';
                          final regExp = RegExp(pattern);

                          if (value.isEmpty) {
                            return 'Enter an email';
                          } else if (!regExp.hasMatch(value)) {
                            return 'Enter a valid email';
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: 10,),
                      TextFormField(
                        controller: _passwordcontroller,
                        textInputAction: TextInputAction.done,
                        style: TextStyle(fontSize: 20),
                        decoration:  InputDecoration(
                          labelStyle: TextStyle(color: Colors.white70),
                          filled: true,
                          fillColor:  Colors.black45,
                          border: OutlineInputBorder(),
                          labelText: "Password",
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: IconButton( icon: Icon( isobscure ? Icons.visibility: Icons.visibility_off), onPressed: ()=>setState((){
                                isobscure = !isobscure;
                            })),
                        ),
                        obscureText: isobscure,
                        validator: (value){
                          if(value.isEmpty){
                            return 'Enter password';
                          }else if (value.length < 8) {
                            return 'Password must be at least 8 characters long';
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: 50,),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.redAccent[700],
                          minimumSize: Size(391,55)
                        ),
                        child:Row(mainAxisAlignment: MainAxisAlignment.center,children:[Icon(Icons.login),Text(' LOGIN',style: TextStyle(color: Colors.white,fontSize: 19),)] ),
                        onPressed: (){}
                      ),
                      SizedBox(height: 20,),
                      TextButton(child: Text('Forgot Password', style: TextStyle(color: Colors.white70,fontSize: 17,fontWeight: FontWeight.bold)),onPressed: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => ForgotPass()));
                      },)

                    ],
                  ),
                ),
              ),
            ),
          ],
        )
      )
    );
  }
}