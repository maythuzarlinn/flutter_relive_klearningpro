import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_relive_klearningpro/models/user.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class UploadPage extends StatefulWidget {
 final User  gCurrentUser;

 UploadPage({required this.gCurrentUser});

  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> with AutomaticKeepAliveClientMixin<UploadPage>
{
  late File? file;
  bool uploading = false;
  String postId = Uuid().v4();
  TextEditingController descriptionTextEditingController = TextEditingController();
  TextEditingController locationTextEditingController = TextEditingController();


  captureImageWithCamera() async {
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

  pickImageFromGallery() async 
  {
    Navigator.pop(context);
    File imageFile = (await ImagePicker.platform.pickImage(
      source: ImageSource.gallery,
    )) as File;
    setState(() {
      this.file = imageFile;
    });
  }

  takeImage(mContext){
    return showDialog(
      context: mContext,
      builder: (context){
        return SimpleDialog(
          title: Text("New Post", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
          children: <Widget>[
            SimpleDialogOption(
              child: Text("Capture Image with Camera", style: TextStyle(color: Colors.black,),),
              onPressed: captureImageWithCamera,
            ),
            SimpleDialogOption(
              child: Text("Select Image from Gallery", style: TextStyle(color: Colors.black,),),
              onPressed: pickImageFromGallery,
            ),
            SimpleDialogOption(
              child: Text("Cancel", style: TextStyle(color: Colors.black,),),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
  }


  displayUploadScreen(){
    return Container(
      //margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
      //color: Theme.of(context).accentColor.withOpacity(0.5),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(Icons.person, color: Colors.grey, size: 200.0,),
          Padding(
            padding: EdgeInsets.only(top: 5.0),
            child: RaisedButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.0),),
              child: Text("Upload Image", style: TextStyle(color: Colors.black, fontSize: 12.0),),
              color: Colors.white,
              onPressed: () => print("tapped")//takeImage(context)
            ),
          ),
         ],
      ),
    );
  }

  removeImage()
  {
    locationTextEditingController.clear();
    descriptionTextEditingController.clear();

    setState(() {
      file = null;
    });
  }





  getUserCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    //List<Placemark> placeMarks = await Geolocator().placemarkFromCoordinates(position.latitude, position.longitude);
    //Placemark mPlaceMark = placeMarks[0];
    //String completeAddressInfo = '${mPlaceMark.subThoroughfare} ${mPlaceMark.thoroughfare}, ${mPlaceMark.subLocality} ${mPlaceMark.locality}, ${mPlaceMark.subAdministrativeArea} ${mPlaceMark.administrativeArea}, ${mPlaceMark.postalCode} ${mPlaceMark.country},';
    //String specificAddress = '${mPlaceMark.locality}, ${mPlaceMark.country}';
    //locationTextEditingController.text = specificAddress;
  }

/*

  compressingPhoto() async {
    final tDirectory = await getTemporaryDirectory();
    final path = tDirectory.path;
    ImD.Image? mImageFile = ImD.decodeImage(file!.readAsBytesSync());
    final compressedImageFile = File('$path/img_$postId.jpg')..writeAsBytesSync(ImD.encodeJpg(mImageFile!, quality: 60));
    setState(() {
      file = compressedImageFile;
    });
  }



  controlUploadAndSave()async {
    setState(() {
      uploading = true;
    });

    await compressingPhoto();

    String downloadUrl = await uploadPhoto(file);

    savePostInfoToFireStore(url: downloadUrl, location: locationTextEditingController.text, description: descriptionTextEditingController.text);

    locationTextEditingController.clear();
    descriptionTextEditingController.clear();

    setState(() {
      file = null;
      uploading = false;
      postId = Uuid().v4();
    });
  }


  savePostInfoToFireStore({String? url, String? location, String? description})
  {
    postsReference.document(widget.gCurrentUser!.id).collection("usersPosts").document(postId).setData({
      "postId": postId,
      "ownerId": widget.gCurrentUser.id,
      "timestamp": DateTime.now(),
      "likes": {},
      "username": widget.gCurrentUser.username,
      "description": description,
      "location": location,
      "url": url,
    });

    FirebaseFirestore.instance.collection("usersPosts").doc(postId).set({
      "postId": postId,
      "ownerId": widget.gCurrentUser.id,
      "timestamp": DateTime.now(),
      "likes": {},
      "username": widget.gCurrentUser.username,
      "description": description,
      "location": location,
      "url": url,
    });
  }

  Future<String> uploadPhoto(mImageFile) async {
    StorageUploadTask mStorageUploadTask = storageReference.child("post_$postId.jpg").putFile(mImageFile);
    StorageTaskSnapshot storageTaskSnapshot = await mStorageUploadTask.onComplete;
    String downloadUrl = await storageTaskSnapshot.ref.getDownloadURL();
    return downloadUrl;
  }


 */

  displayUploadFormScreen(){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(icon: Icon(Icons.arrow_back, color: Colors.black,), onPressed: ()=>print("tapped")  ),
        title: Text("Create Post", style: TextStyle(fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.bold),),
        actions: <Widget>[
          FlatButton(
            onPressed: ()=> print("tapped") ,//uploading ? null : () => controlUploadAndSave(),
            child: Text("Post", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14.0),),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          //uploading ? linearProgress() : Text(""),

          Padding(padding: EdgeInsets.only(top: 12.0),),
          ListTile(
            //leading: CircleAvatar(backgroundImage: CachedNetworkImageProvider(widget.gCurrentUser!.url),),
            title: Container(
              width: 250.0,
              child: TextField(
                style: TextStyle(color: Colors.black),
                controller: descriptionTextEditingController,
                decoration: InputDecoration(
                  hintText: "Write your discussion.",
                  hintStyle: TextStyle(color: Colors.black),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Divider(),
          Container(
            height: 230.0,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Center(
              child: AspectRatio(
                aspectRatio: 16/9,
                child: Container(
                  //decoration: BoxDecoration(image: DecorationImage(image: FileImage(file), fit: BoxFit.cover,)),
                ),
              ),
            ),
          ),
          /*ListTile(
            leading: Icon(Icons.person_pin_circle, color: Colors.black, size: 36.0,),
            title: Container(
              width: 250.0,
              child: TextField(
                style: TextStyle(color: Colors.black),
                controller: locationTextEditingController,
                decoration: InputDecoration(
                  hintText: "Write the location here.",
                  hintStyle: TextStyle(color: Colors.black),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
         Container(
            width: 220.0,
            height: 20.0,
            alignment: Alignment.center,
            child: RaisedButton.icon(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35.0)),
              color: Colors.green,
              icon: Icon(Icons.location_on, color: Colors.black,),
              label: Text("Get my Current Location", style: TextStyle(color: Colors.black),),
              onPressed: getUserCurrentLocation,
            ),
          ),

          */
      Container(
        width: 220.0,
        height: 50.0,
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 120.0),
        //color: Theme.of(context).accentColor.withOpacity(0.5),
        child: RaisedButton.icon(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0),),
                  label: Text("Upload Image", style: TextStyle(color: Colors.black, fontSize: 12.0),),
                  color: Colors.white,
                  icon: Icon(Icons.image, color: Colors.black,),
                  onPressed: () => print("tapped")//takeImage(context)
              ),
      ),
        ],
      ),
    );
  }

  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    //return displayUploadFormScreen();
    return file == null ? displayUploadScreen() : displayUploadFormScreen();
  }
}
