import 'package:flutter/material.dart';
import 'package:longdrinkmachine/models/colors.dart';
import 'package:longdrinkmachine/UI/EnterName/EnterNamePage.dart';

class MainPage extends StatefulWidget{
  @override
  State createState()=> MainPageState();
}



class MainPageState extends State<MainPage>{
  var name = "";
  @override
  Widget build(BuildContext context) {
    return (new SafeArea(child: 
    Scaffold(
               resizeToAvoidBottomInset: false,
               appBar: AppBar(
                 backgroundColor: MainColor,
                 iconTheme: new IconThemeData(color: Colors.black),
                 title: Text("Longdrink Machine",style: TextStyle(color: Colors.black),),
                 centerTitle: true,
                actions: <Widget>[
                  SafeArea(child:
                  ButtonTheme(
                    child: RaisedButton(
                      onPressed: (){
                        print("object");
                      },
                      color: Colors.white,
                      child: CircleAvatar(
                            backgroundColor: Colors.orange,
                            child: Text(name, style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  ),
                  ),
                ],
               ),
               body: EnterNamePage(),
               drawer: Drawer(
                  child: ListView(
                    // Important: Remove any padding from the ListView.
                    padding: EdgeInsets.zero,
                    children: <Widget>[
                      Container(
                        child: DrawerHeader(
                        child: Text('Longdrink Maschine',style: TextStyle(fontSize: 25.0,color: Colors.black,fontWeight: FontWeight.bold),textAlign: TextAlign.left),
                        decoration: new BoxDecoration(
                          shape: BoxShape.rectangle,
                        ),
                      ),
                      ),
                      ListTile(
                        leading: Icon(Icons.add),
                        title: Text('Neue Bestellung'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MainPage()),
                          );
                        },
                        
                      ),
                      ListTile(
                        leading: Icon(Icons.history),
                        title: Text('Meine Historie'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => EnterNamePage()),
                          );
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.equalizer),
                        title: Text('Bestenliste'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => EnterNamePage()),
                            
                          );
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.timeline),
                        title: Text('Mein Trinkverhalten'),
                        onTap: () {
                          Navigator.push(
                            context,
                            //MaterialPageRoute(builder: (context) => SettingPage()),
                            MaterialPageRoute(builder: (context) => MainPage()),
                          );
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.gamepad),
                        title: Text('Spiele'),
                        onTap: () {
                          Navigator.push(
                            context,
                            //MaterialPageRoute(builder: (context) => SettingPage()),
                            MaterialPageRoute(builder: (context) => MainPage()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            )
    );
  }
}