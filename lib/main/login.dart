import 'package:flutter/material.dart';
import 'package:contact_tracer/widgets/widgets.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final _emailcontroller = TextEditingController();
  final  _passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        decoration: BoxDecoration(image: DecorationImage(image: AssetImage('lib/assets/3.jpg'),fit: BoxFit.cover)),
        child: Stack(
          children: [
            appbar(context,2),
            Center(
        
            )
          ],
        )
      )
    );
  }
}