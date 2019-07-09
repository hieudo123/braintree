import 'dart:io';
import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:multi_media_picker/multi_media_picker.dart';
import 'package:image/image.dart' as Im;
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:permission_handler/permission_handler.dart';
class CreateNewsPage extends StatefulWidget{
  var title;
  CreateNewsPage({Key key,this.title,}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _StateCreateNewsPage();
  }

}
class _StateCreateNewsPage extends State<CreateNewsPage>{
  List<File> _images = [];
  List<ImageProvider> list =[];
  PermissionStatus _status;
//  Future getImage() async {
//    var image= await MultiMediaPicker.pickImages(source: ImageSource.gallery);
//    if(image !=null) {
//      List<File> imagelist = [];
//      for (int i = 0; i < image.length; i++) {
//        File compressedFile = await FlutterNativeImage.compressImage(
//            image[i].path, quality: 10,targetWidth: 100,targetHeight: 100);
//        print("Image :$compressedFile");
//        try {
//          if (compressedFile != null)
//            setState(() {
//              _images.add(compressedFile);
//            });
//        } catch (e) {}
//      }
//    }
//  }
  Future getImage() async {
    var image= await MultiMediaPicker.pickImages(source: ImageSource.gallery);
    if(image !=null) {
      for (int i = 0; i < image.length; i++) {
          var result = await FlutterImageCompress.compressWithFile(
            image[i].absolute.path,
            minWidth:640,
            minHeight:480,
            quality: 70,);
        try {
          if (result != null)
            setState(() {
              list.add(MemoryImage(Uint8List.fromList(result)));
            });
        } catch (e) {}
      }
    }
  }

  @override
  void initState() {
    PermissionHandler().checkPermissionStatus(PermissionGroup.storage).then(_updateStatus);
    super.initState();
  }
    void _updateStatus(PermissionStatus status){
      if(status != _status)
        _status = status;
  }
  void _askPermission(){
    PermissionHandler().requestPermissions([PermissionGroup.storage])
    .then(_onStatusRequested);
  }
  void _onStatusRequested(Map<PermissionGroup, PermissionStatus> statuses){
    final status =statuses[PermissionGroup.storage];
    if(status == PermissionStatus.granted){
      getImage();
    }
  }
  Widget buildGridView() {
    return GridView.count(
      addAutomaticKeepAlives: true,
      crossAxisCount: 3,
      children: List.generate(list.length, (index) {
        return Image(image: list[index],fit: BoxFit.fill,filterQuality: FilterQuality.low,);
      }),
    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.title}"),
        leading: Builder(builder: (BuildContext context){
          return IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: ()=>Navigator.pop(context,false),);
        }),
      ),
      body:Center(
        child:Center(
          child: _images == null
              ? Text('No image selected.')
              : buildGridView(),
        ),
      ) ,
      floatingActionButton: FloatingActionButton(
        onPressed:(){
          _askPermission();
        },
        child: Icon(Icons.camera_alt,),
        backgroundColor: Colors.lightBlue,
      ),
    );
  }
}