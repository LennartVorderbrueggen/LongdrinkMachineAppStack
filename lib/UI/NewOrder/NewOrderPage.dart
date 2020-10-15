import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:longdrinkmachine/models/colors.dart';
import 'package:longdrinkmachine/UI/EnterName/EnterNamePage.dart';
import 'package:http/http.dart' as http;

String url = "http://10.0.2.2:5000";

//"Jaegermeister","Vodka","Whiskey","Captain Morgan","Tequila Gold","Gin","Rum","Korn","Bacardi","Bacardi Razz","43",
//"Cola","Fanta","Sprite","Orangensaft","Energy","Lemon","Eistee","Milch"
String imageFactory(String beverage){
    String path = "";
    switch(beverage){
      case "Jaegermeister":
      {
        path = 'lib/img/alk/product_page_hero_bottle.png';
      }
      break;
            case "Vodka":
      {
        path = 'lib/img/alk/belvedere-vodka-2017_bear.png';
      }
      break;
            case "Whiskey":
      {
        path = 'lib/img/alk/jackdaniels_bear.png';
      }
      break;
            case "Captain Morgan":
      {
        path = 'lib/img/alk/captain-morgan_bear.png';
      }
      break;
            case "Tequila Gold":
      {
        path = 'lib/img/alk/tequila_bear.png';
      }
      break;
            case "Gin":
      {
        path = 'lib/img/alk/gin_bear.png';
      }
      break;
            case "Rum":
      {
        path = 'lib/img/alk/havana-club_bear.png';
      }
      break;
            case "Korn":
      {
        path = 'lib/img/alk/korn_bear.png';
      }
      break;
      case "Bacardi":
      {
        path = 'lib/img/alk/bacardi_bear.png';
      }
      break;
            case "Bacardi Razz":
      {
        path = 'lib/img/alk/bacardi-razz_bear.png';
      }
      break;
      case "43":
      {
        path = 'lib/img/alk/43_bear.png';
      }
      break;
      case "Cola":
      {
        path = 'lib/img/mische/cola_bear.png';
      }
      break;
      case "Fanta":
      {
        path = 'lib/img/mische/fanta_bear.png';
      }
      break;
      case "Sprite":
      {
        path = 'lib/img/mische/sprite_bear.png';
      }
      break;
      case "Orangensaft":
      {
        path = 'lib/img/mische/OJuice_bear.png';
      }
      break;
      case "Energy":
      {
        path = 'lib/img/mische/redbull.png';
      }
      break;
      case "Lemon":
      {
        path = 'lib/img/mische/lemon.jpg';
      }
      break;
      case "Eistee":
      {
        path = 'lib/img/mische/eistee_bear.png';
      }
      break;
      case "Milch":
      {
        path = 'lib/img/mische/milk_bear.png';
      }
      break;
    }
    return path;
}



List<Widget> getBeverageGrid(List<String> beverages,BuildContext context)
{
  List<Widget> list = new List<Widget>();
  for(var i = 0; i < beverages.length; i++){
      list.add(
        new ButtonTheme(
              minWidth: 25,
              height: 10,
              child: RaisedButton(
                color: Colors.white,
                highlightColor: Colors.blue[50],
                child: Image.asset(imageFactory(beverages[i])),
                onPressed: (){                            
                  var index = DefaultTabController.of(context).index;
                  DefaultTabController.of(context).animateTo(index+1);},
              ),
            ));
  }
  return list;
}

Future<String> requestFromApi() async {
    Future<String> beverage;
    var client = http.Client();
    try {
      var accountid = 11;
      var uriResponse = await client.post(url+'/api/Order',
        body: jsonEncode({"action":"request"}),
        );
      print(uriResponse.statusCode);
      print(uriResponse.body);
      final Map result = json.decode(uriResponse.body);
      var orderstatus = result["orderstatus"];
      print(orderstatus);
      //var response = await client.get('http://10.0.2.2:5000/api/SignIn');
      //print(response.body);
    } finally {
      client.close();
    }
    return beverage;
}

class AlkPage extends StatefulWidget{
  AlkPage(Map<String, String> order);
  @override
  State createState()=> AlkPageState();
}

class AlkPageState extends State<AlkPage>{
  List<String> beverages = ["Jaegermeister","Vodka","Korn"];
  @override
  Widget build(BuildContext context) {
      return CustomScrollView(
  primary: false,
  slivers: <Widget>[
    SliverPadding(
      padding: const EdgeInsets.all(20),
      sliver: SliverGrid.count(
        crossAxisSpacing: 10,
        mainAxisSpacing: 75,
        crossAxisCount: 2,
        children: getBeverageGrid(beverages,context)
      ),
    ),
  ],
);
  }
}

class MischePage extends StatefulWidget{
  @override
  State createState()=> MischePageState();
}

class MischePageState extends State<MischePage>{


  List<String> beverages = ["Cola","Fanta","Orangensaft"];


  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
  primary: false,
  slivers: <Widget>[
    SliverPadding(
      padding: const EdgeInsets.all(20),
      sliver: SliverGrid.count(
        crossAxisSpacing: 10,
        mainAxisSpacing: 75,
        crossAxisCount: 2,
        children: getBeverageGrid(beverages,context)
      ),
    ),
  ],
);
  }
}

class SliderPage extends StatefulWidget{
  @override
  State createState()=> SliderPageState();
}

class SliderPageState extends State<SliderPage>{
  Map<String, String> order = {
      "Alk" : "Korn",
      "Mische" : "Fanta",
      "Verhältnis" : "40",
  };
  double _currentSliderValue = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        ButtonBar(
          alignment: MainAxisAlignment.center,
          buttonHeight: 100,
          children: [
            ButtonTheme(
              height: 150,
              minWidth: 50,
              child: 
                RaisedButton(
                      color: Colors.white,
                      highlightColor: Colors.blue[50],
                      child: Text(order["Alk"]),
                      //child: Image.asset(imageFactory(order["Alk"])),
                      onPressed: (){
                        DefaultTabController.of(context).animateTo(0);
                      },                         
                ),
              ),
            ButtonTheme(
              height: 150,
              minWidth: 50,
              child: 
                RaisedButton(
                  color: Colors.white,
                  highlightColor: Colors.blue[50],
                  child: Text(order["Mische"]),
                  //child: Image.asset(imageFactory(order["Mische"])),
                  onPressed: (){
                    DefaultTabController.of(context).animateTo(1);
                  }                         
                ),
            ),
          ],
        ),
        Slider(
          activeColor: Enabled,
          value: _currentSliderValue,
          min: 0,
          max: 100,
          divisions: 25,
          label: _currentSliderValue.round().toString(),
          onChanged: (double value) {
            setState(() {
              _currentSliderValue = value;
            });
          },
        ),
        SizedBox(height: 100,),
        Container(
          //padding: EdgeInsets.all(75),
          height: 75,
          width: 250,
          child: 
          ButtonTheme(
              child: RaisedButton(
              onPressed: () {
                
              },
              shape: RoundedRectangleBorder(  
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.blue)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center, //Center Row contents horizontally,
                crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                children: [ 
                          Text("Bestellen"),
                          SizedBox(width: 10,),
                          Icon(Icons.send),
                          ],),
              color: Enabled,
              ),
            ),
        ),
      ],
    ),
    );
  }
}

class OrderPage extends StatefulWidget{
  @override
  State createState()=> OrderPageState();
}

class OrderPageState extends State<OrderPage>{
  Map<String, String> order = {
      "Alk" : "",
      "Mische" : "",
      "Verhältnis" : "",
  };
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      color: Colors.yellow,
      home: new DefaultTabController(
        length: 3,
        child: Builder(builder: (BuildContext context) {
          return Scaffold(
            body: TabBarView(
                  children: [
                    new Container(
                      //Order Page 1 generel information
                      margin: const EdgeInsets.only(top:50.0),
                      child: Container(child:
                                AlkPage(order),
                      ),
                    ),
                    new Container(
                      //Order Page 1 generel information
                      margin: const EdgeInsets.only(top:50.0),
                      child: Container(child:
                                MischePage(),
                      ),
                    ),
                    new Container(
                      //Order Page 1 generel information
                      margin: const EdgeInsets.only(top:50.0),
                      child: Container(child:
                                SliderPage(),
                      ),
                    ),
                    // new Container (
                    //   margin: const EdgeInsets.only(top:50.0,left: 30.0,right: 30.0),
                    //   child: Column(children: <Widget>[
                        
                    //   ]
                    //     ),
                    //   ),
                  ],
                ),
                appBar: TabBar(
              tabs: [
                Tab(
                  text: ("Alkohol"),
                  icon: new ImageIcon(
                    AssetImage('lib/img/icons/icons8-whiskey-64.png'),
                  )
                ),
                Tab(
                  text: ("Mische"),
                  icon: new ImageIcon(
                    AssetImage('lib/img/icons/icons8-limonade-50.png'),
                  )
                ),
                Tab(
                  text: ("Verhältnis"),
                  icon: new ImageIcon(
                    AssetImage('lib/img/icons/icons8-waage-50.png'),
                  )
                ),
                // Tab(
                //   text: ("Übersicht"),
                //   icon: new Icon(Icons.send),
                //   )
              ],
              
              labelColor: Enabled,
              unselectedLabelColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorPadding: EdgeInsets.all(5.0),
              indicatorColor: Enabled,
            ),
            backgroundColor: Colors.white,
            
              );
            }  
      )
    )
    );
  }
}


class NewOrderPage extends StatefulWidget{
  final String Name;
  const NewOrderPage ({ Key key, this.Name }): super(key: key);

  @override
  State createState()=> NewOrderPageState();
}

class NewOrderPageState extends State<NewOrderPage>{
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
                            child: Text(widget.Name[0], style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  ),
                  ),
                ],
               ),
               body: OrderPage(),
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
                            MaterialPageRoute(builder: (context) => EnterNamePage()),
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
                            MaterialPageRoute(builder: (context) => EnterNamePage()),
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
                            MaterialPageRoute(builder: (context) => EnterNamePage()),
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