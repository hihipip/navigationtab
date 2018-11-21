import 'package:flutter/material.dart';
import 'base.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class ColorDetailPage extends StatefulWidget{
  Color color;
  String title;
  ColorDetailPage({Key key,this.color,this.title}) : super(key:key);
  @override
  ColorDetailPageState createState() => ColorDetailPageState();

}

class ColorDetailPageState extends State<ColorDetailPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title:"Detail"),
      body: Container(
        child: Center(
          child:Text("Detail Object")
        ),
      )
    );

  }
}








class DetailPage2 extends StatefulWidget{
  Color color;
  String title;
  DetailPage2({Key key,this.color,this.title}) : super(key:key);
  @override
  DetailPage2State createState() => DetailPage2State();

}

class DetailPage2State extends State<DetailPage2>{

  @override
  void initState() {
    super.initState();
  }



  var dataString = 'Loading';
  void _getIPAddress() async {
    var url = 'https://httpbin.org/ip';
    var httpClient = new HttpClient();
    String result;
    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      if (response.statusCode == HttpStatus.OK) {
        var json = await response.transform(utf8.decoder).join();
        var data = jsonDecode(json);
        result = data['origin'];
      } else {
        result =
        'Error getting IP address:\nHttp status ${response.statusCode}';
      }
    } catch (exception) {
      result = 'Failed getting IP address';
    }

    // If the widget was removed from the tree while the message was in flight,
    // we want to discard the reply rather than calling setState to update our
    // non-existent appearance.
    if (!mounted) return;

    setState(() {
      dataString = result;
    });
  }



  //抓取資料一筆
  Future<Post> fetchPost() async {
    final response =
    await http.get('https://box.innokit.tw/test.jsp');
    if (response.statusCode == 200) {
      return Post.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }



  //https://zhuanlan.zhihu.com/p/39999205
  //待研究
  /*
  Future<String> getAJoke() {
    return new Future<String>(() {
      final response = http.get('https://box.innokit.tw/test.jsp');
      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception('Failed to load post');
      }
    });
  }
  */





  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(title:"Detail2"),
        body: Container(
          child:Center(
              child:Column(
                children: <Widget>[
                  Text(dataString),
                  RaisedButton(
                    child:Text("press me!" ,style:TextStyle(color:Colors.white,fontStyle:FontStyle.italic,fontSize: 20.0 )),
                    color:Colors.red,
                    onPressed: (){
                      setState(() {
                        dataString = "Loading...";
                      });
                      //_getIPAddress();
                      print("START");
                      Future<Post> post=fetchPost();
                      print("----------");
                    },
                  )
                ],
              )
          )
        )
    );

  }
}





class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body1'],
    );
  }
}