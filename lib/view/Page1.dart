import 'package:flutter/material.dart';
import '../tool/TabHelper.dart';
import 'ColorDetailPage.dart';
import 'base.dart';



class BottomNavWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyPage()
    );
  }
}

class MyPage extends StatefulWidget {
  String title="MyPage";
  MyPage({Key key}) : super(key:key);
  @override
  MyPageState createState() => MyPageState();
}
class MyPageState extends State<MyPage> with AutomaticKeepAliveClientMixin{

  @override
  bool get wantKeepAlive => true;


  int _selectedIndex=0;
  TabItem currentTab = TabItem.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(title:widget.title),
        body: _buildBody(),
        bottomNavigationBar: BottomNavigationBar(
          items:<BottomNavigationBarItem>[
            BottomNavigationBarItem(icon:Icon(Icons.home),title:Text("Home")),
            BottomNavigationBarItem(icon:Icon(Icons.business),title:Text("Business")),
            BottomNavigationBarItem(icon:Icon(Icons.school),title:Text("School")),
          ],
          currentIndex: _selectedIndex,
          fixedColor: Colors.deepPurple,
          onTap: _onItemTapped,
        ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

/*
  Widget _buildList(){
    return ListView.builder(itemBuilder: (BuildContext context,int index){

    });
  }
  */
  
  
  

  void _push(){
    /*
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ColorDetailPage(
      color:TabHelper.getColor(currentTab),
      title: TabHelper.getDescription(currentTab),
    )));

    Navigator.push(context,MaterialPageRoute(builder: (context) => ColorDetailPage(
      color:TabHelper.getColor(currentTab),
      title: TabHelper.getDescription(currentTab),
    )));
    */
    Navigator.push(context,MaterialPageRoute(builder: (context) => DetailPage2(
      color:TabHelper.getColor(currentTab),
      title: TabHelper.getDescription(currentTab),
    )));


  }



  Widget _buildnav(){
    return Navigator(
      onGenerateRoute: (routeSettings){
        return MaterialPageRoute(
          builder: (context) => _buildList()
        );
      },
    );


  }






  final email = TextFormField(
    keyboardType: TextInputType.emailAddress,
    autofocus: false,
    initialValue: 'hihipip@ibosscom.com',
    decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border:OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0)
        )
    ),
  );


  Widget _buildBody(){
    print("buildBody");
    return Container(
      color:TabHelper.getColor(currentTab),
      alignment: Alignment.center,
      child:Column(
        children: <Widget>[
          FlatButton(
            child:Text(
              'PUSH${_selectedIndex}',
              style:TextStyle(fontSize: 32.0,color:Colors.white)
            ),
            onPressed: _push,
          ),
          email
        ],
      )

    );
  }






  List<Member> members=[
    Member('A','01'),
    Member('B','02'),
    Member('C','03'),
    Member('D','04'),
    Member('E','05'),];

  Widget _buildList(){
    return ListView(
      children: <Widget>[
        getCard(),
        getCard(),
        Text("TEST"),
        RaisedButton(
          child:Text("Press me"),
          onPressed: _push,
        ),

      ],
    );

    /*
    return ListView.builder(
      itemCount: members.length,
      itemBuilder: (BuildContext context,int index){
      Member member = members[index];
      return Container(
        child:ListTile(
          title : Text("name=${member.name}",style:TextStyle(fontSize: 20.0)),
          trailing: Icon(Icons.chevron_right),
          onTap: (){
            _push();
          }
          //onTap: () => _push
        )
      );
    });
    */
  }



  Widget getCard(){
    return Card(
      child:Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              leading: Icon(Icons.album),
              title: Text('The Enchanted Nightingale'),
              subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
            ),
            ButtonTheme.bar( // make buttons use the appropriate styles for cards
              child: ButtonBar(
                children: <Widget>[
                  FlatButton(
                    child: const Text('BUY TICKETS'),
                    onPressed: () { /* ... */ },
                  ),
                  FlatButton(
                    child: const Text('LISTEN'),
                    onPressed: () { /* ... */ },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }






}


class WidgetTest extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    print("WidgetTest");
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Welcome to Flutter'),
        ),
        body: new Center(
          child: new Text('Hello World'),
        ),
      ),
    );
  }
}





class Member{
  String name;
  String phone;
  Member(this.name,this.phone);
}


class TabNavigatorRoutes {
  static const String root = '/';
  static const String detail = '/detail';
}




