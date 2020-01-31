import 'package:flutter/material.dart';
import './Convert.dart';
import './ConvertBack.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: Colors.black54,
      appBar: AppBar(
        title: Text("Morse code Encoder and Decoder"),
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: size.height * 0.17,),
          Image.asset("assets/morse_image.png",),

          SizedBox(height: size.height * 0.25,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              // Image.asset("assets/morse_image.png",width: size.width*0.6,fit: BoxFit.contain,),
              RaisedButton(
                shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                color: Colors.white,
                child: Text("English to Morse",style: TextStyle(color: Colors.black),),
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Convert())),
              ),
              RaisedButton(
                shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                color: Colors.white,
                child: Text("Morse to English",style: TextStyle(color: Colors.black),),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ConvertBack()));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
