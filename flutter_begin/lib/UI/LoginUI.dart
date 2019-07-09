import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_begin/model/User.dart';
import 'package:http/http.dart' as http;
import 'CustomInputField.dart';
import 'MainUI.dart';
import 'PasswordField.dart';
import 'SiginUI.dart';
import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage>{
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var url ='https://androidwebsv.000webhostapp.com/hope/Login.php';
  String _text = "Flutter";
  TextEditingController PhoneController = new TextEditingController();
  TextEditingController PasswordController = new TextEditingController();
  String phone="";
  String password="";
  User user;
  var isLoading = false;
  void changeActivity(){
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context)=> MainPage(title: 'Life Style',)),
            (Route<dynamic> route)=>false
    );
  }
  Future login() async{
    setState(() {
      isLoading =true;
    });

    phone = PhoneController.text;
    password = PasswordController.text;
    if(phone.isNotEmpty && password.isNotEmpty){
      http.Response response = await http.post(url,body: {'Phone':'$phone','Password':'$password'});
      var jsonResponse = jsonDecode(response.body);
      print(jsonResponse["Success"]);
      if(jsonResponse["Success"] ==1){
        user = User.fromJson(jsonResponse["data"]);
        if(user !=null){
          String json =jsonEncode(user.toJson());
          print("USER: ${jsonEncode(user)}");
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString("user", json);
          changeActivity();
        }
      }
      setState(() {
        isLoading =false;
      });
    }
  }
  Future<FirebaseUser> _handleSignIn() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user = await _auth.signInWithCredential(credential);
    print("signed in " + user.displayName);
    return user;
  }

  void autoLogin()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String json =(prefs.getString("user"));
    if(json != null){
     changeActivity();
    }
  }
  @override
  void initState() {
    autoLogin();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return new Scaffold(
      body:
      Container(
        height: double.infinity,
        width: double.infinity,
            decoration: new BoxDecoration(
              image: DecorationImage(image: new AssetImage('assets/images/bglogin_1.png'),
              fit: BoxFit.fill)
            ),
        child: Center(
          child: Container(
            height:500,
            width: 350,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Visibility(
                  child: CircularProgressIndicator(),
                  visible:isLoading,
                ),
                Image.asset("assets/images/logo.png",height:100,),
                CustomInputField(Icon(Icons.phone,),"Số điện thoại",PhoneController),
                PasswordField(Icon(Icons.lock,),"Mật khẩu",PasswordController),
                Container(
                    margin: EdgeInsets.only(top: 10.0),
                    height: 50,
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: 150,
                          height: 50,
                          child:RaisedButton(shape:
                          OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5.0)),
                              borderSide: BorderSide(color:Colors.orange)),
                            onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => SiginPage(title: "Đăng ký")),

                              );
                            },
                            textColor: Colors.white,
                            color: Colors.orange,
                            child: Text("Đăng ký",style: TextStyle(fontSize: 20),),
                          ),

                        ),Container(
                          child: RaisedButton(
                            shape:
                            OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                borderSide: BorderSide(color:Colors.lightBlueAccent)),
                            onPressed: (){
                              login();

                            },
                            textColor: Colors.white,
                            color: Colors.lightBlueAccent,
                            child: Text("Đăng nhập",style: TextStyle(fontSize: 20),),
                          ),
                          width: 150,
                          height: 50,
                        )
                      ],
                    )
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: RaisedButton(
                    shape:
                    OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        borderSide: BorderSide(color:Colors.blueAccent)),
                    onPressed: (){

                    },
                    textColor: Colors.white,
                    color: Colors.blueAccent,
                    child: Text("Facebook Login",style: TextStyle(fontSize: 20),),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: RaisedButton(
                    shape:
                    OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        borderSide: BorderSide(color:Colors.red)),
                    onPressed: (){
                      _handleSignIn()
                          .then((FirebaseUser user) {
                            print(user);
                            changeActivity();
                      })
                          .catchError((e) => print(e));
                    },
                    textColor: Colors.white,
                    color: Colors.red,
                    child: Text("Google Sign",style: TextStyle(fontSize: 20),),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
