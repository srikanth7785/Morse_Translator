import 'package:flutter/material.dart';
import './morsecode.dart';

class Convert extends StatefulWidget {
  @override
  _ConvertState createState() => _ConvertState();
}

class _ConvertState extends State<Convert> {

  String convertedString = "";
  MorseCode m = MorseCode();

  TextEditingController _controller = TextEditingController();

  convertMessage(String s){
    s = s.toUpperCase();
    print(s + "\n\n");
    String a = "";
    // print(m.english_to_morse);
    for(var i = 0; i < s.length; i++){
        a = a + m.englishtoMorse[s[i]] + "  ";

    a = a.substring(0,a.length-1);
        // print(m.english_to_morse[s[i]]);
        // print("\n\n");
    }
    setState(() {
      convertedString = a;
      print("Converted String is : $convertedString");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("English to Morse Code"),),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          Text("Enter your message here:",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.0),),
          SizedBox(height: 10.0,),
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
          convertedString == "" ? Container() : Text("Morse Code is :"),
          SelectableText(convertedString,style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
        ],
      ),
    );
  }
}