import 'package:flutter/material.dart';
import 'package:longdrinkmachine/UI/MainPage/MainPage.dart';
import 'package:longdrinkmachine/UI/NewOrder/NewOrderPage.dart';

class EnterNamePage extends StatefulWidget{
  @override
  State createState()=> EnterNamePageState();
}

class EnterNamePageState extends State<EnterNamePage>{
  Map<String, String> Name = {
    'Name': "",
  };
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    final conName = TextEditingController();
    return (new Scaffold(
      body: Column(
        children: [
        Padding(
            padding: const EdgeInsets.only(
                      left: 50,
                      top: 200,
                      right: 50,
                      bottom: 20,
            ),
            child: TextField(
                    controller: conName,
                    onSubmitted: (value) {
                      print(value[0]);
                      Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => NewOrderPage(Name: value,)),
                            );
                    },
                    // onSubmitted: ()=> print(Name["Name"]),
                    decoration: new InputDecoration(
                        hintText: "Dein Name",
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 2.0),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width: 5.0),
                        ),
                      ),
              ),
          )
      ],)
    ));
  }
}