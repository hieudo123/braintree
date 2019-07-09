import 'package:flutter/material.dart';
import 'package:flutter_begin/model/User.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../LoginUI.dart';
import 'dart:convert';
import 'package:stripe_payment/stripe_payment.dart';
import 'package:braintree/braintree.dart';
import 'package:google_sign_in/google_sign_in.dart';
class YourPage extends StatefulWidget{
  @override
  _YourPage  createState() => new _YourPage();
}
class _YourPage extends State<YourPage>{
  User user;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  void logOut()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _googleSignIn.signOut();
    prefs.clear();
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context)=> MyHomePage()),
    (Route<dynamic> route)=>false
    );
  }
  void getUser()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String json =(prefs.getString("user"));
    Map<String, dynamic> map =jsonDecode(json);
    print("User ${jsonDecode(json)}");
    setState(() {
      user = User.fromJson(map);
    });

  }

    void braintreePayment()async{
      print('Selection was canceled.');
      var request = BraintreeDropInRequest(
        clientToken: 'sandbox_9qqjbwqb_hdbccjzmcq8gj324',
        collectDeviceData: true,
        googlePaymentRequest: BraintreeGooglePaymentRequest(
          totalPrice: '4.20',
          currencyCode: 'USD',
          billingAddressRequired: false,
        ),
        paypalRequest: BraintreePayPalRequest(
          amount: '4.20',
          displayName: 'Example company',
        ),
      );
      BraintreeDropInResult result = await BraintreeDropIn.start(request);
      if (result != null) {
        print('Nonce: ${result.paymentMethodNonce.nonce}');
      } else {
        print('Selection was canceled.');
      }
    }


  @override
  void initState() {
    getUser();
    StripeSource.setPublishableKey("pk_test_EzwPEhOalI9YNBFxS7ItKnvz00KaBDBduE");
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body:Container(
        width: double.infinity,
        height: double.infinity,
        child:Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(20.0),
              width: double.infinity,
              height: 200.0,
              decoration: BoxDecoration(
                gradient: new LinearGradient(colors:[Color(0xFFAED5E4),Color(0xFFD9EEF1)] ),
                borderRadius: new BorderRadius.only(bottomLeft: Radius.circular(16.0),bottomRight: Radius.circular(16.0))
              ),
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage:user==null?ExactAssetImage("assets/images/background01.png")
                        :NetworkImage(user.image),

                    minRadius: 30,
                    maxRadius: 30,
                  ),
                 Container(
                   margin: EdgeInsets.all(8.0),
                   child:  Text(user == null?"Unknow":user.username,style: TextStyle(color: Colors.white),),
                 )
                ],
              ),
            ),
           new GestureDetector(
             child:  Card(
                 elevation: 2.0,
                 child:  Container(
                   padding: EdgeInsets.all(10.0),
                   child: Row(
                     children: <Widget>[
                       Icon(Icons.calendar_today,color: Colors.lightBlueAccent,),
                       Container(
                         margin: EdgeInsets.only(left: 16.0),
                         child: Text("Đã thích"),
                       )
                     ],
                   ),
                 )
             ),
             onTap: () {
               braintreePayment();
             }),
              new GestureDetector(
              child: Card(
                elevation: 2.0,
                child:  Container(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.person,color: Colors.lightBlueAccent,),
                      Container(
                        margin: EdgeInsets.only(left: 16.0),
                        child: Text("Thiết lập tài khoản"),
                      )
                    ],
                  ),
                )
              ),
              onTap: (){
                StripeSource.addSource().then((token){
                  print("Payment : $token");
                });
              },
            ),
            new GestureDetector(
              child: Card(
                  elevation: 2.0,
                  child:  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.help,color: Colors.lightBlueAccent,),
                        Container(
                          margin: EdgeInsets.only(left: 16.0),
                          child: Text("Hỗ trợ"),
                        )
                      ],
                    ),
                  )
              ),
            ),
            new GestureDetector(
              child: Card(
                elevation: 2.0,
                child:  Container(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.arrow_back,color: Colors.lightBlueAccent,),
                      Container(
                        margin: EdgeInsets.only(left: 16.0),
                        child: Text("Đăng xuất"),
                      )
                    ],
                  ),
                )
              ),
              onTap: (){
                logOut();
              },
            ),
          ],
        )
      )
    );
  }
}

