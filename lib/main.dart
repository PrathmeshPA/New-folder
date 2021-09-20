// ignore: avoid_web_libraries_in_flutter
//import 'dart:js';

import 'dart:core';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

    late int firstnum;
    late int secondnum;
     late String display="";
    late String result;
    late String operator;

  void clicked(String buttonm){
    if(buttonm == "C"){
      display="";
      firstnum=0;
      secondnum=0;
      result="";
    }
    else if(buttonm == "+" || buttonm == "-" || buttonm == "*" || buttonm == "/"){
      firstnum =int.parse(display);
      result="";
      operator=buttonm;
    }
    else if(buttonm == "="){
      secondnum = int.parse(display);
      if(operator == "+"){
        result =(firstnum + secondnum).toString();
      }
      if(operator == "-"){
        result =(firstnum - secondnum).toString();
      }
      if(operator == "*"){
        result =(firstnum * secondnum).toString();
      }
      if(operator == "/"){
        result =(firstnum / secondnum).toString();
      }

    }else {
      result =int.parse(display + buttonm).toString();
    }
    setState(() {
      display =result;
    });

  }

   Widget customButton(String buttonm){
     return Expanded(
       // ignore: deprecated_member_use
       child: OutlineButton(
         padding: EdgeInsets.all(25),
         onPressed: ()=>clicked(buttonm),
         child: Text(
           "$buttonm",
           style: TextStyle(
             fontSize: 20,
             fontWeight: FontWeight.w500
           ),
           ),
         )
      );

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
        backgroundColor: Colors.red,
        
        ),
        body: Container(
          child: Column( 
            mainAxisAlignment: MainAxisAlignment.end,
            children:<Widget> [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.bottomRight,
                  child: Text(
                    "$display",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 25,
                      ),
                  ),
                  ),
              ),
            Row ( children :<Widget> [
              customButton("9"),
              customButton("8"),
              customButton("7"),
              customButton("C"),
            ],
            ),
            Row ( children :<Widget> [
              customButton("6"),
              customButton("5"),
              customButton("4"),
              customButton("/"),
            ],

            ),
            Row ( children :<Widget> [
              customButton("3"),
              customButton("2"),
              customButton("1"),
              customButton("*"),
            ],

            ),
            Row ( children :<Widget> [
              customButton("0"),
              customButton("="),
              customButton("+"),
              customButton("-"),
            ],

            )
          ],),
        ),
      
    );
  }
}