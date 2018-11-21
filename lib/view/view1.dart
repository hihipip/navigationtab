import 'package:flutter/material.dart';
import "package:pointycastle/pointycastle.dart";
import "package:pointycastle/signers/rsa_signer.dart";
import "package:pointycastle/digests/sha256.dart";
import 'dart:convert';
import 'package:crypto_keys/crypto_keys.dart';
import 'dart:async';







class View1 extends StatefulWidget{
  @override
  _View1State createState() => new _View1State();
}

class _View1State extends State<View1>{

  void sign() async{

    Digest sha256 = new SHA256Digest();
    var rsaSigner = RSASigner(new SHA256Digest(), "0609608648016503040201");


  }


  @override
  Widget build(BuildContext context){




    final loginbtn = FlatButton(
      child: new Text("Login"),
      onPressed: null,

    );

    final regbtn = FlatButton(
        child: new Text("Register"),
        onPressed: (){
          sign();
          print("register");
        },
    );


    return Scaffold(
        backgroundColor: Colors.white,
        body:Container(
          padding: EdgeInsets.only(left:24.0,right:24.0),
          child:Center(
            child:Column(
              children: <Widget>[
                loginbtn,
                SizedBox(height:48.0),
                regbtn,
                SizedBox(height:48.0),
                Align(
                  alignment: FractionalOffset.bottomRight,
                  child: new Image.network('http://up.qqjia.com/z/25/tu32710_11.jpg'),
                ),
              ],
            )
          )
        )
      );




  }
}

