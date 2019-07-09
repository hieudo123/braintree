import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_begin/UI/Houses/HousesPage.dart';
import 'LoginUI.dart';
import 'package:flutter_begin/UI/News/GetAllNews/NewsPage.dart';
import 'PasswordField.dart';
import 'Profile/YourPage.dart';
import 'Showroom/ShowRoomPage.dart';
import 'SiginUI.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:badges/badges.dart';
class MainPage extends StatefulWidget  {
  var title;
  MainPage({Key key,this.title,}) : super(key: key);
  @override
  _MainPageState createState() => new _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _count = 0;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  void requestPermisstion()async{
    Map<PermissionGroup, PermissionStatus> permissions = await PermissionHandler()
        .requestPermissions([PermissionGroup.storage,PermissionGroup.location,PermissionGroup.camera]);

  }
  int _selectedIndex = 0;
   List<Widget> _WidgetOption = <Widget>[
    NewsPage(),
    HousesPage(),
    ShowRoomPage(),
    YourPage(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  void initState() {
    requestPermisstion();
      _firebaseMessaging.getToken().then((token){
        print("token: $token");
      });
      _firebaseMessaging.configure(
        onMessage: (Map<String, dynamic> message) async{
          print("onMessage: $message");
          final notification = message['notification'];
          setState(() {
            _count++;
          });
        },
        onLaunch: (Map<String, dynamic> message) async{

        },
        onResume: (Map<String, dynamic> message) async{

        },
      );
      _firebaseMessaging.requestNotificationPermissions(
          const IosNotificationSettings(sound: true,badge: true,alert: true)
      );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        automaticallyImplyLeading: false,
        title: new Text(
          widget.title,
          style: TextStyle(fontSize: 20.0, color: Colors.white),
        ),
        actions: <Widget>[
           Center(
             child: Container(
               margin:EdgeInsets.only(right: 20),
               child: new GestureDetector(
                 child: new Badge(
                   badgeContent: Text("$_count",style: TextStyle(color: Colors.white),),
                   child: Icon(Icons.notifications),
                   animationType: BadgeAnimationType.slide,
                   shape: BadgeShape.circle,
                   toAnimate: true,
                 ),
                 onTap: (){
                   setState(() {
                     _count =0;
                   });
                 },
               ),
             ),
           ),
        ],
      ),
      body: Center(
        child: _WidgetOption.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,//set màu cho 4 item
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.format_align_justify),
            title: Text('Trang chủ'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Nhà'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.weekend),
            title: Text('Nội thất'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Tôi'),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,

      ),
    );
  }
}

