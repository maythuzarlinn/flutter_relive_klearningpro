import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_relive_klearningpro/main.dart';
import 'package:flutter_relive_klearningpro/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_relive_klearningpro/common_widget/BottomNavBarWidget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class UploadPage extends StatefulWidget {
  final User gCurrentUser;
  UploadPage({required this.gCurrentUser});
  //const UploadPage({Key? key, required this.gCurrentUser}) : super(key: key);

  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  late File file;
  bool uploading = false;
  String postId = Uuid().v4();
  TextEditingController descriptionTextEditingController = TextEditingController();
  TextEditingController locationTextEditingController = TextEditingController();

  captureImageWithCamera() async{
    Navigator.pop(context);
    File imageFile = (await ImagePicker.platform.pickImage(
        source: ImageSource.camera,
        maxHeight: 680,
        maxWidth: 970,
    )) as File;
    setState(() {
      this.file = imageFile;
    });
  }
  pickImageFromGallery() async{
    Navigator.pop(context);
    File imageFile = (await ImagePicker.platform.pickImage(
      source: ImageSource.gallery,
    )) as File;
    setState(() {
      this.file = imageFile;
    });

  }
  cancel() async{
    Navigator.pop(context);
  }

  takeImage(mContext) {
    return showDialog(
      context: mContext,
      builder: (context) {
        return SimpleDialog(
          title: Text("New post", style: TextStyle(
              color: Colors.blueGrey, fontWeight: FontWeight.bold),),
          children: <Widget>[
            SimpleDialogOption(
              child: Text("Capture Image with Camera", style: TextStyle(color: Colors.blueGrey,),),
            onPressed: captureImageWithCamera,
            ),
            SimpleDialogOption(
              child: Text("Select Image From Gallery", style: TextStyle(color: Colors.blueGrey,),),
              onPressed: pickImageFromGallery,
            ),
            SimpleDialogOption(
              child: Text("Cancel", style: TextStyle(color: Colors.blueGrey,),),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => BottomNavBarWidget()));
              },
            ),
          ],
        );
      },
    );
  }
  
  displayUploadScreen(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
      //padding: EdgeInsets.all(10.0),
      //color: Theme.of(context).accentColor.withOpacity(0.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(padding: EdgeInsets.only(left: 0.0),
          child: RaisedButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.0),),
            child: Text("what about today", style: TextStyle(color: Colors.black54,fontSize: 10.0),),
            color: Colors.white,
            onPressed: () => takeImage(context)
          ),
          ),
          Padding(padding: EdgeInsets.only(left: 0.0),
            child: RaisedButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.0),),
                child: Text("Discussion or share your knowledge", style: TextStyle(color: Colors.black54,fontSize: 10.0),),
                color: Colors.white,
                onPressed: () => takeImage(context)
            ),
          ),
        ],
      ),
    );
  }
  clearPostInfo(){
    descriptionTextEditingController.clear();
    setState(() {
      file = null.toString() as File;
    });
  }
  /*
  controlUploadAndSave() async{
    setState(() {
      uploading = true;
    });
    savePostInfoToFireStore (url: downloadUrl, description: descriptionTextEditingController.text);
    descriptionTextEditingController.clear();
    setState(() {
      file = null.toString() as File;
      uploading = false;
      postId = Uuid().v4();
    });
  }
  savePostInfoToFireStore(String url,String description){
    postsReference.doc(widget.gCurrentUser.id).collection("usersPosts").doc(postId).set({
      "postId": postId,
      "ownerId": widget.gCurrentUser.id,
      "timestamp": timestamp,
      "likes": {},
      "username": widget.gCurrentUser.username,
      "description": description,
      "url": url,
    });

  }

   */
  displayUploadFormScreen(){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(icon: Icon(Icons.arrow_back, color: Colors.white,), onPressed: clearPostInfo),
        title: Text("New post",style: TextStyle(fontSize: 24.0, color: Colors.white,fontWeight: FontWeight.bold),),
        actions: <Widget>[
          FlatButton(
            onPressed: () => uploading ? null : ()=>print("tapped"),//() => controlUploadAndSave(),
            child: Text("post",style: TextStyle(fontSize: 16.0, color: Colors.lightGreenAccent,fontWeight: FontWeight.bold),),

          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 230.0,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Center(
              child: AspectRatio(aspectRatio: 16/9,
                child: Container(
                  decoration: BoxDecoration(image: DecorationImage(image: FileImage(file),fit: BoxFit.cover,)),
                ),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 12.0),),
          ListTile(
            //leading: CircleAvatar(backgroundImage: CachedNetworkImageProvider(widget.gCurrentUser.url),),
            title: Container(
              width: 250.0,
              child: TextField(
                style: TextStyle(color: Colors.white),
                controller: descriptionTextEditingController,
                decoration: InputDecoration(
                  hintText: "Discuss or share your knowledge",
                  hintStyle: TextStyle(color: Colors.white),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Divider(),
          Padding(padding: EdgeInsets.only(top: 12.0),),
          ListTile(
            leading: Icon(Icons.person_pin_circle, color: Colors.white, size: 36.0,),
            title: Container(
              width: 250.0,
              child: TextField(
                style: TextStyle(color: Colors.white),
                controller: locationTextEditingController,
                decoration: InputDecoration(
                  hintText: "Write the location",
                  hintStyle: TextStyle(color: Colors.white),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return file == null ? displayUploadScreen() : displayUploadFormScreen();
  }
}


