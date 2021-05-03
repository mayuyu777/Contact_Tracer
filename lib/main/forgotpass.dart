import 'package:flutter/material.dart';
import 'package:contact_tracer/widgets/widgets.dart';

class ForgotPass extends StatefulWidget {
  @override
  _ForgotPassState createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
  final _emailcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        color: Colors.black,
        child: Stack(
          children: [
            appbar(context,1),
            Center(
              child: Container(
              margin: EdgeInsets.only(top:150),
              width: 360,
              child: Column(
                children: [
                  TextFormField(
                    controller:_emailcontroller,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.white),
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
                  SizedBox(height: 20,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.redAccent[700],
                      minimumSize: Size(391,55)
                    ),
                    child:Row(mainAxisAlignment: MainAxisAlignment.center,children:[Icon(Icons.send),Text(' Send Verification',style: TextStyle(color: Colors.white,fontSize: 18),)] ),
                    onPressed: (){}
                  ),
                 
                ],
              ),
                ),
            ),
          ],
        )
      )
    );
  }
}