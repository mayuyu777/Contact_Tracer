import 'package:contact_tracer/main/landing.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  
 int pageindex = 0;
  final tabs = [
    Center(child: Text("QR CODE",style:TextStyle(fontSize:22)),),
    Center(child: Text("PLACES",style:TextStyle(fontSize:22)),),
    Center(child: Text("ACCOUNT",style:TextStyle(fontSize:22)),),
    Center(child: Text("NOTIFICATIONS",style:TextStyle(fontSize:22)),),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              backgroundColor: Colors.black,
              actions: [
                TextButton.icon(icon: Icon(Icons.login_outlined,size: 30,color: Colors.grey,),label: Text("Logout",style: TextStyle(fontSize: 17,color: Colors.grey),),onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Landing()));
                },),
                SizedBox(width: 20,)
              ],
            ),
            body: tabs[pageindex],
            bottomNavigationBar:  BottomNavigationBar(
              currentIndex: pageindex,
              selectedItemColor: Colors.redAccent[700],
              unselectedItemColor: Colors.grey[400],
            items:[
               BottomNavigationBarItem(icon: Icon(Icons.qr_code_outlined,size: 30,),label: 'QR Code',backgroundColor: Colors.transparent,),
               BottomNavigationBarItem(icon: Icon(Icons.place_outlined,size: 30,),label: 'Places',backgroundColor: Colors.transparent,),
               BottomNavigationBarItem(icon: Icon(Icons.person_outlined,size: 30,),label:'Account',backgroundColor: Colors.transparent,),
               BottomNavigationBarItem(icon: Icon(Icons.notifications_outlined,size: 30,),label: 'Notifications',backgroundColor: Colors.transparent,),

            ],
            onTap: (page){
              setState(() {
                pageindex = page;
              });
            },
          ),
    );
  }


}