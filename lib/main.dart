import 'package:flutter/material.dart';
import 'view/login_view.dart';
import 'view/Page1.dart' as page1;
import 'tool/HttpTool.dart';
import 'view/view1.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: MyHomePage(title: 'Flutter Demo Home Page'),
      //home: LoginPage(),
      home:View1(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<String> strings=["AAA","BBB","CCC"];
  String displayedString="";

  void onPressed(){
    setState(() {
      displayedString = strings[_counter];
      _counter=_counter<2?_counter+1:0;
    });
  }
  void onChanged(String str){
    setState(() {
      displayedString = str;
    });
  }


  void getData(){
    HttpTool().post("https://box.innokit.tw/test.jsp", callback:(Map<String, dynamic> result){
      print("test");

      if (!mounted) return;
      setState(() {
        displayedString = strings[_counter];
        _counter=_counter<2?_counter+1:0;

      });


    },errorCallback: (int httpCode,String errmsg){
      setState(() {
        displayedString = errmsg;
      });
    });


  }
  
  
  
  
  
  
  
  void navigationTest(){
    //Navigator.push(context,MaterialPageRoute(builder: (context) => page1.MyPage()));
//    Navigator.of(context).push(
//        MaterialPageRoute(
//            builder: (context) => SecondScreen())
//    );
    Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) => page1.MyPage())
    );
  }



  final myController = TextEditingController();

  @override
  void initState(){
    super.initState();
    myController.addListener(_printLatestValue);
    print("initState");
  }
  @override
  void dispose(){
    myController.dispose();
    super.dispose();
  }

  _printLatestValue() {
    print("Second text field: ${myController.text}");
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),backgroundColor: Colors.deepOrange,
      ),
      body: Container(
          child:Center(
            child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child:Text("press me!" ,style:TextStyle(color:Colors.white,fontStyle:FontStyle.italic,fontSize: 20.0 )),
                color:Colors.red,
                onPressed: navigationTest,
              ),
              Text(displayedString),
              Padding(padding: EdgeInsets.all(20.0),),
              Text("Item2"),
              RaisedButton(
                child:Text("press me!" ,style:TextStyle(color:Colors.white,fontStyle:FontStyle.italic,fontSize: 20.0 )),
                color:Colors.red,
                onPressed: onPressed,
              ),
              TextField(
                decoration: InputDecoration(hintText: "Type in here"),
                onChanged: onChanged,
              ),
              TextField(
                controller: myController,
              ),
              RaisedButton(
                child:Text("press me!" ,style:TextStyle(color:Colors.white,fontStyle:FontStyle.italic,fontSize: 20.0 )),
                color:Colors.red,
                onPressed: getData,
              ),
            ],
          )
        )
      )
    );
  }
}



class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}
