import 'package:flutter/material.dart';
class CustomInputField extends StatelessWidget{
  Icon FieldIcon;
  String Hinttext;
  TextEditingController PhoneController;
  CustomInputField(this.FieldIcon,this.Hinttext,this.PhoneController);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Container(
      width: 350,
      child: Material(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: Color.fromARGB(70, 70, 70, 70),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FieldIcon
              ),
              Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.black26,width: 0.5),
                    borderRadius:  BorderRadius.only(topRight: Radius.circular(8.0),
                        bottomRight: Radius.circular(8.0))
                ),
                width: 270,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: TextField(
                    decoration: InputDecoration(
                      isDense: true,
                      border: InputBorder.none,
                      hintText:Hinttext,
                    ),
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                    keyboardType: TextInputType.number,
                    controller: PhoneController,
                    enabled: true,
                  ),
                ),
              ),
            ],
          )
      ),
    );
  }
}