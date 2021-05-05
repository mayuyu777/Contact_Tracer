import 'package:contact_tracer/main/home.dart';
import 'package:flutter/material.dart';
import 'package:contact_tracer/widgets/widgets.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  static final List<String> items = <String>['Civilian','Establishment'];
  String value = items.first;
  final _emailcontroller = TextEditingController();
  final  _passwordcontroller = TextEditingController();
  final  _firstnamecontroller = TextEditingController();
  final  _lastnamecontroller = TextEditingController();
  final  _establishmentcontroller = TextEditingController();
  final  _addresscontroller = TextEditingController();
  final  _phonecontroller = TextEditingController();
  final  _confirmpasswordcontroller = TextEditingController();
  final dateController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  PageController pageController = PageController(initialPage: 0);
  bool isobscure = true;
  bool isobscure2 = true;
  int index = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.black,
    appBar: appbar(context,1),
    body: Form(
          key: _formKey,
          child: Stack(
          children: [
            PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: pageController,
              onPageChanged: (num){
                setState(() {
                  index = num;
                });
              },
              children: [
                userType(),
                secondForm(),
                thirdForm(),
              ],
            ),
            index==2?Container():Positioned(
            bottom: 20,
            right: 20,
            child: MaterialButton(
            color:  Color(0xff15191b),
            shape: CircleBorder(),
            onPressed: () {
              if(index==0){
                setState(() {
                  index = pageController.page.toInt() +1;
                  pageController.animateToPage(index,duration: Duration(milliseconds: 250),curve: Curves.easeIn);
                });
              }else{
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    setState(() {
                        index = pageController.page.toInt() +1;
                        pageController.animateToPage(index,duration: Duration(milliseconds: 250),curve: Curves.easeIn);
                    });
                    if(index==3){
                      print("MANA");
                    }
                  }
              }
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Icon(Icons.navigate_next_rounded,size: 40,),
            ),
            ),
          ),
          index==0?Container():Positioned(
            bottom: 20,
            left: 20,
            child: MaterialButton(
            color:  Color(0xff15191b),
            shape: CircleBorder(),
            onPressed: () {
              setState(() {
                 index = pageController.page.toInt()-1;
                 pageController.animateToPage(index,duration: Duration(milliseconds:250),curve: Curves.easeIn);
              });
              if(index==0){clearFields();}
             FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Icon(Icons.navigate_before_rounded,size: 40,),
            ),
            ),
          )
        ],
      ),
    ),
      );
  }

  void clearFields(){

    _emailcontroller.clear(); 
    _passwordcontroller.clear();
    _firstnamecontroller.clear(); 
    _lastnamecontroller.clear(); 
    _establishmentcontroller.clear(); 
    _addresscontroller.clear();
    _phonecontroller.clear(); 
    _confirmpasswordcontroller.clear();
    dateController.clear(); 

  }

  Widget userType(){
    return Container(
      width: double.maxFinite,
        height: 470,
        padding: EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          SizedBox(height: 100,),
          Container(child: Text('SELECT USER TYPE',style: TextStyle(color: Colors.grey[600],fontSize: 18.5),textAlign: TextAlign.center,)),
          SizedBox(height: 50,),
          Icon(Icons.person_outline,color:Colors.red[900],size:150),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(decoration: BoxDecoration(border: Border.all(color: Colors.black),borderRadius: BorderRadius.all(Radius.circular(5)),color:Colors.white),padding: EdgeInsets.symmetric(horizontal: 20),height: 50,width:340,
            child:DropdownButtonHideUnderline(
              child: DropdownButton(value: value,items: items.map((item)=>
              DropdownMenuItem<String>(
                child: Text(item,style: TextStyle(fontSize: 21,color: Colors.grey[900]),),
                value: item,
              )
              ).toList(),
              onChanged: (value)=>setState((){this.value = value;}),
              isExpanded: true,
              dropdownColor: Colors.white,
              icon: Icon(Icons.arrow_drop_down,color: Colors.grey,),
              ),
            )),
          ),
        ],
      ),
    );
  }

  Widget secondForm(){
    if(value == items.first){
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Container(
              height: 490,
              child: Column(
                children: [
                  SizedBox(height: 70,),
                  nameTextField(_firstnamecontroller,"Firstname",'Enter Firstname','Firstname must have at least 3 characters','Firstname must not exceed 10 characters'),
                  SizedBox(height: 10,),
                  nameTextField(_lastnamecontroller,"Lastname",'Enter Lastname','Lastname must have at least 3 characters','Lastname must not exceed 10 characters'),
                  SizedBox(height: 10,),
                   constantTextfield(Icon(Icons.place_outlined),_addresscontroller,"Home Address",'Enter Home Address',1),
                  SizedBox(height: 10,),
                  Center(child: TextField(
                    readOnly: true,
                    controller: dateController,
                    decoration: InputDecoration( hintText: 'Date of Birth', hintStyle: TextStyle(fontSize: 20),prefixIcon: Icon(Icons.calendar_today_outlined),
                    filled: true,fillColor: Colors.grey[900],border: OutlineInputBorder(),),
                    onTap: () async {
                    var date =  await showDatePicker(
                          context: context, 
                          initialDate:DateTime.now(),
                          firstDate:DateTime(1900),
                          lastDate: DateTime(2100));
                          dateController.text = date.toString().substring(0,10);      
                  },)),
                  SizedBox(height: 10,),
                ],
              ),
            ),
          ),
        );
    }else{
      return Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Container(
              height: 450,
              child: Column(
                children: [
                  SizedBox(height: 70,),
                  constantTextfield(Icon(Icons.store_outlined),_establishmentcontroller,"Establishment",'Enter name of Establishment',0),
                  SizedBox(height: 10,),
                  constantTextfield(Icon(Icons.place_outlined),_addresscontroller,"Store Address",'Enter Store Address',1),
                  SizedBox(height: 10,),
                  phoneTextField(_phonecontroller),
                ],
          ),
            ),
        ),
      );
    }
  }


  Widget thirdForm(){
    if(value == items.first){
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Container(
              height: 550,
              child: Column(
                children: [
                   SizedBox(height: 70,),
                   emailTextfield(_emailcontroller),
                   SizedBox(height: 10,),
                   phoneTextField(_phonecontroller),
                   SizedBox(height: 10,),
                   passwordTextField(_passwordcontroller,1,'Password'),
                   SizedBox(height: 10,),
                   passwordTextField(_confirmpasswordcontroller,2,'Confirm Password'),
                   SizedBox(height: 25,),
                   ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.redAccent[700],
                      minimumSize: Size(391,55)
                    ),
                    child:Row(mainAxisAlignment: MainAxisAlignment.center,children:[Icon(Icons.login),Text(' Register',style: TextStyle(color: Colors.white,fontSize: 19),)] ),
                    onPressed: (){
                       if (_formKey.currentState.validate() && _passwordcontroller==_confirmpasswordcontroller) {
                           _formKey.currentState.save();
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Homepage()));
                       }  
                     }
                  ),
                ],
              ),
            ),
          ),
        );
    }else{
      return Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Container(
              height: 550,
              child: Column(
                children: [
                   SizedBox(height: 70,),
                   emailTextfield(_emailcontroller),
                   SizedBox(height: 10,),
                   passwordTextField(_passwordcontroller,1,'Password'),
                   SizedBox(height: 10,),
                   passwordTextField(_confirmpasswordcontroller,2,'Confirm Password'),
                   SizedBox(height: 20,),
                   ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.redAccent[700],
                      minimumSize: Size(391,55)
                    ),
                    child:Row(mainAxisAlignment: MainAxisAlignment.center,children:[Icon(Icons.login),Text(' Register',style: TextStyle(color: Colors.white,fontSize: 19),)] ),
                    onPressed: (){
                       if (_formKey.currentState.validate()) {
                           _formKey.currentState.save();
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Homepage()));
                       }  
                    }
                  ),
                ],
          ),
            ),
        ),
      );
    }
  }


  Widget constantTextfield(Icon icon,TextEditingController mycontroller,String label, String message,int type){
    return TextFormField(
      controller:mycontroller,
      textInputAction: TextInputAction.done,
      style: TextStyle(fontSize: 20),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[900],
        border: OutlineInputBorder(),
        labelText: label,
        prefixIcon: icon,
      ),
      validator: (value){
        if (value.isEmpty) {
          return message;
        }else if(type==1 && value.length<10){
          return "Input should have at least 10 characters";
        }else{
          return null;
        }
      },
    );
  }

  Widget nameTextField(TextEditingController mycontroller,String label, String message1,String message2,String message3){
    return TextFormField(
      controller:mycontroller,
      textInputAction: TextInputAction.done,
      style: TextStyle(fontSize: 20),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[900],
        border: OutlineInputBorder(),
        labelText: label,
        prefixIcon: Icon(Icons.person_outline),
      ),
      validator: (value){
        if (value.isEmpty) {
          return message1;
        }  else if(value.length<3){
          return message2;
        }else if(value.length >10){
          return message3;
        }else{
          return null;
        }
      },
    );
  }


  Widget phoneTextField(TextEditingController mycontroller){
    return TextFormField(
      keyboardType: TextInputType.number,
      controller:mycontroller,
      textInputAction: TextInputAction.done,
      style: TextStyle(fontSize: 20),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[900],
        border: OutlineInputBorder(),
        labelText: "Phone Number",
        prefixIcon: Icon(Icons.phone_outlined),
      ),
      validator: (value){
        if (value.isEmpty) {
          return "Enter phone number";
        }else{
          return null;
        }
      },
    );
  }


  Widget emailTextfield(TextEditingController mycontroller){
    return TextFormField(
      controller:mycontroller,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.done,
      style: TextStyle(fontSize: 20),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[900],
        border: OutlineInputBorder(),
        labelText: "Email",
        prefixIcon: Icon(Icons.email_outlined),
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
    );
  }

  Widget passwordTextField(TextEditingController mycontroller,int type,String label){
    return TextFormField(
      controller: mycontroller,
      textInputAction: TextInputAction.done,
      style: TextStyle(fontSize: 20),
      decoration:  InputDecoration(
        filled: true,
        fillColor: Colors.grey[900],
        border: OutlineInputBorder(),
        labelText: label,
        prefixIcon: Icon(Icons.lock_outline),
        suffixIcon: IconButton( icon: Icon( isobscure ? Icons.visibility: Icons.visibility_off), onPressed: ()=>setState((){
            if(type==1){
              isobscure = !isobscure;
            }else if(type==2){
              isobscure2 = !isobscure2;
            }
          })),
      ),
      obscureText: type==1? isobscure: isobscure2,
      validator: (value){
        if(value.isEmpty){
          return 'Enter password';
        }else if (value.length < 8) {
          return 'Password must be at least 8 characters long';
        } else if(type==2 && _passwordcontroller.text!=value){
          return "Passwords does not match";
        }else {
          return null;
        }
      },
    );
  }


}