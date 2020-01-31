import 'package:flutter/material.dart';
import 'package:morse/morsecode.dart';

class ConvertBack extends StatefulWidget {
  @override
  _ConvertBackState createState() => _ConvertBackState();
}

class _ConvertBackState extends State<ConvertBack> {

  String convertedString = "";
  MorseCode m = MorseCode();
  TextEditingController _controller = TextEditingController();

  convertMessage(String s){
    s = s.substring(0,s.length-1);
    var a = s.split(" ");
    print(a);
    String msg = "";
    for(var i in a)
      msg = msg + m.morsetoEnglish[i];
    
    msg = msg[0] + msg.substring(1).toLowerCase();
    setState(() {
      convertedString = msg;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Morse Code to English"),),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          Text("Enter your message here:",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0),),
          TextField(
            controller: _controller,
            maxLines: 5,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Message'
            ),
          ),
          SizedBox(height: 10.0,),
          Center(
            child: RaisedButton(
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              color: Colors.white,
              child: Text("Convert",style: TextStyle(color: Colors.black),),
              onPressed: ()=>convertMessage(_controller.text),
            ),
          ),
          SizedBox(height: 15.0,),
          convertedString == "" ? Container() : Text("English Text is :"),
          SelectableText(convertedString,style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
}