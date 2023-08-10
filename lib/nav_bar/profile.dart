import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  File? _selectImage;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.width / 6,
            ),
            margin: EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              children: [
                Center(
                  child: Stack(
                    children: [
                      _selectImage != null
                          ? GetPictProfile()
                          : Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage('asset/profile.jpeg')),
                                border: Border.all(
                                  width: 2,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          alignment: Alignment.center,
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 4,
                                color: Colors.white,
                              )),
                          child: InkWell(
                            onTap: (() {
                              showCupertinoModalPopup(
                                  context: context,
                                  builder: (context) => CupertinoActionSheet(
                                        title: Text('Photo'),
                                        message: Text('Change from'),
                                        actions: [
                                          CupertinoActionSheetAction(
                                              onPressed: () {
                                                pictImageFromGalery();
                                                Navigator.pop(context);
                                              },
                                              child: Text('Galery')),
                                          CupertinoActionSheetAction(
                                              onPressed: () {
                                                pictImageFromCamera();
                                                Navigator.pop(context);
                                              },
                                              child: Text('Camera')),
                                        ],
                                      ));
                            }),
                            child: Icon(
                              Icons.photo,
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  autocorrect: true,
                  enableInteractiveSelection:
                      true, //klo mau paste tinggal hold def'true'
                  autofocus: false, // g usah ngeklik langsung ngisi def'false
                  onSubmitted: (value) {
                    TextEditingController().clear();
                  },
                  enabled: true,
                  focusNode: FocusNode(),
                  controller: TextEditingController(),
                  decoration: InputDecoration(
                    label: Text(
                      "text",
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    hintTextDirection: TextDirection.ltr,
                    fillColor: Colors.green.withOpacity(0.08),
                    filled: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                    hintText: 'Ini namamu',
                    hintStyle: TextStyle(
                      color: Colors.green[600],
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  Container GetPictProfile() {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          image: DecorationImage(
              fit: BoxFit.cover, image: FileImage(_selectImage!)),
          border: Border.all(
            width: 2,
            color: Colors.white,
          ),
          boxShadow: [
            BoxShadow(color: Colors.grey, blurRadius: 2, spreadRadius: 0.1)
          ]),
    );
  }

  pictImageFromGalery() async {
    final ImagePicker _imagePicker = ImagePicker();
    final pickedImage = await _imagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);
    if (pickedImage == null) return;
    setState(() {
      _selectImage = File(pickedImage.path);
    });
  }

  pictImageFromCamera() async {
    final ImagePicker _imagePicker = ImagePicker();
    final pickedImage = await _imagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50);
    if (pickedImage == null) return;
    setState(() {
      _selectImage = File(pickedImage.path);
    });
  }
}
