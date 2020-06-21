import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/**
 * Simple calculator
 * Writen by yasin eryigit at 21.06.2020
 */

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculator",
      home: MyCalculator()
    );
  }

}

class MyCalculator extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    Calculator();
  }

}

class Calculator extends State<MyCalculator>{

  //TextFormField'e gelecek A ve B sayıları için conroller
  final controller_numberA = TextEditingController();
  final controller_numberB = TextEditingController();

  final my_form_key = GlobalKey<FormState>();
  String result = "";
  String textToShow = "";
  //toplam fonk.
  void sum(){
    //Formu kontrol et
    //Seçilen işlem var ise
    if(my_form_key.currentState.validate()){
      int numberA = int.parse(controller_numberA.text);
      int numberB = int.parse(controller_numberB.text);
      int result = numberA + numberB;

      setState(() {
        //Yapılan işlemi gösterecek olan text
        textToShow="$numberA + $numberB = $result";
      });
    }
  }

  void minus(){
    //Formu kontrol et
    //Seçilen işlem var ise
    if(my_form_key.currentState.validate()){
      int numberA = int.parse(controller_numberA.text);
      int numberB = int.parse(controller_numberB.text);
      int result = numberA - numberB;

      setState(() {
        //Yapılan işlemi gösterecek olan text
        textToShow="$numberA - $numberB = $result";
      });
    }
  }

  void times(){
    //Formu kontrol et
    //Seçilen işlem var ise
    if(my_form_key.currentState.validate()){
      int numberA = int.parse(controller_numberA.text);
      int numberB = int.parse(controller_numberB.text);
      int result = numberA * numberB;

      setState(() {
        //Yapılan işlemi gösterecek olan text
        textToShow="$numberA * $numberB = $result";
      });
    }
  }

  void divide(){
    //Formu kontrol et
    //Seçilen işlem var ise
    if(my_form_key.currentState.validate()){
      int numberA = int.parse(controller_numberA.text);
      int numberB = int.parse(controller_numberB.text);
      double result = numberA / numberB;

      setState(() {
        //Yapılan işlemi gösterecek olan text
        textToShow="$numberA / $numberB = $result";
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    //Tasarımı yapalım
    return Scaffold(
      body: Form(
        key: my_form_key,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //2 tane TextFieldForm oluşturalım

            TextFormField(
              controller: controller_numberA,
              validator: (value){
                if(value.isEmpty) return "Please enter a number";
              },
              decoration: InputDecoration(hintText: "Enter a number"),
              keyboardType: TextInputType.number),

            TextFormField(
                controller: controller_numberB,
                validator: (value){
                  if(value.isEmpty) return "Please enter a number";
                },
                decoration: InputDecoration(hintText: "Enter a number"),
                keyboardType: TextInputType.number),

            //Sonuç TexField'i oluşturma
            Text(textToShow,style: TextStyle(fontSize: 20.0),),

            //Buton dizisi oluşturalım
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: sum,
                  child: Text('+'),
                ),
                RaisedButton(
                  onPressed: minus,
                  child: Text('-'),
                ),
                RaisedButton(
                  onPressed: times,
                  child: Text('*'),
                ),
                RaisedButton(
                  onPressed: divide,
                  child: Text('/'),
                ),

              ],
            )
          ],
        ),
      )
    );
  }




}



