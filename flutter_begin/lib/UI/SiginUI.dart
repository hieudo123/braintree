import 'package:flutter/material.dart';
import 'CustomInputField.dart';
import 'PasswordField.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
class SiginPage extends StatefulWidget{
  var title;
  SiginPage({Key key,this.title}):super (key:key);
  @override
   _SiginPageState  createState() =>new _SiginPageState();
}

class _SiginPageState extends State<SiginPage>{
  TextEditingController PhoneController = new TextEditingController();
  TextEditingController PasswordController = new TextEditingController();
  String phone="";
  String password="";
  var isLoading = false;
  Future Signin() async{
    String url ="https://androidwebsv.000webhostapp.com/hope/Siginup.php";
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
        Navigator.pop(context,false);
      }
      setState(() {
        isLoading =false;
      });
    }

  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: Builder(builder:(BuildContext context){
          return IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: ()=> Navigator.pop(context,false), // onBack :)
          );
        }),
        title: new Text(widget.title,style: TextStyle(fontSize: 20,color: Colors.white),),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(image: new AssetImage('assets/images/bglogin_1.png'),
                fit: BoxFit.fill)
        ),
            child: Center(
              child: Container(
              padding: EdgeInsets.all(10.0),
              height: 448,
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
                PasswordField(Icon(Icons.lock,),"Nhập lại mật khẩu",null),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  width: 350,
                  height: 50,
                  child:RaisedButton(shape:
                  OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      borderSide: BorderSide(color:Colors.orange)),
                    onPressed: (){
                      Signin();
                    },
                    textColor: Colors.white,
                    color: Colors.orange,
                    child: Text("Sigin",style: TextStyle(fontSize: 20),),
                  ),
                )
                    ],
                ),
              )
            ),
      ),
    );
  }

}