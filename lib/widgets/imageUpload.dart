import 'dart:io';

import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:file_picker/file_picker.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:flutter_absolute_path/flutter_absolute_path.dart';
import 'package:permission_handler/permission_handler.dart';

import '../conf.dart';

class ImageUpload extends StatefulWidget {
  final Function onImageSelected;
  final Function changePhotoUploadError;
  final photoUploadError;
  ImageUpload(
      {this.onImageSelected,
      this.changePhotoUploadError,
      this.photoUploadError});
  @override
  _ImageUploadState createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {
  // ImagePicker _imagePicker = ImagePicker();
  List<Asset> images = List<Asset>();
  List<Asset> assetArray = [];
// List <File> fileImageArray = [];
  List<File> _pickedImages = [];
  @override
  Widget build(BuildContext context) {
    return _pickedImages.length == 0
        ? GestureDetector(
            onTap: () async {
              try {
                assetArray = await MultiImagePicker.pickImages(
                  maxImages: 10,
                  enableCamera: true,
                  selectedAssets: images,
                  cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
                  materialOptions: MaterialOptions(
                      startInAllView: true,
                      actionBarColor: "#193566",
                      actionBarTitle: "Photos",
                      allViewTitle: "All Photos",
                      useDetailsView: false,
                      selectCircleStrokeColor: "#193566",
                      statusBarColor: "#193566"),
                );
                if (assetArray != null) {
                  assetArray.forEach((imageAsset) async {
                    final filePath = await FlutterAbsolutePath.getAbsolutePath(
                        imageAsset.identifier);
                    File tempFile = File(filePath);
                    if (tempFile.existsSync()) {
                      _pickedImages.add(tempFile);
                      widget.onImageSelected(_pickedImages);
                      setState(() {
                        widget.changePhotoUploadError(false);
                      });
                    }
                  });
                }
              } catch (e) {
                var error = e.toString();
              }
            },
            child: ClayContainer(
              color: baseColor,
              spread: 2,
              depth: 50,
              height: 150,
              width: 150,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Center(
                    child: Image.asset(
                      "assets/images/add.png",
                      height: 56,
                      width: 62,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Icon(
                            Icons.add_circle,
                            size: 15,
                          ),
                        ),
                        Text(
                          widget.photoUploadError
                              ? "Photo required!"
                              : "Upload Photos",
                          style: GoogleFonts.roboto(
                              fontSize: 16,
                              color: widget.photoUploadError
                                  ? Colors.red
                                  : Color(0xFF193566),
                              letterSpacing: 1,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        : ClayContainer(
            color: baseColor,
            spread: 2,
            depth: 50,
            height: 150,
            width: 150,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 80,
                    width: 130,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Center(
                          child: Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              AssetThumb(
                                asset: assetArray[index],
                                width: 80,
                                height: 80,
                                quality: 50,
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.cancel,
                                  color: Colors.black.withOpacity(0.5),
                                  size: 30,
                                ),
                                onPressed: () => setState(() {
                                  assetArray.removeAt(index);
                                  _pickedImages.removeAt(index);
                                  widget.onImageSelected(_pickedImages);
                                }),
                              ),
                            ],
                          ),
                        );
                      },
                      itemCount: assetArray.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      // physics: NeverScrollableScrollPhysics(),
                    ),
                  ),
                  InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Icon(
                          Icons.add_circle,
                          size: 30,
                          color: backgroundColor,
                        ),
                      ),
                      onTap: () async {
                        try {
                          var resultList = await MultiImagePicker.pickImages(
                            maxImages: 10,
                            enableCamera: true,
                            selectedAssets: assetArray,
                            cupertinoOptions:
                                CupertinoOptions(takePhotoIcon: "chat"),
                            materialOptions: MaterialOptions(
                                startInAllView: true,
                                actionBarColor: "#193566",
                                actionBarTitle: "Photos",
                                allViewTitle: "All Photos",
                                useDetailsView: false,
                                selectCircleStrokeColor: "#193566",
                                statusBarColor: "#193566"),
                          );
                          if (resultList != null) {
                            assetArray = resultList;
                            resultList.forEach((imageAsset) async {
                              final filePath =
                                  await FlutterAbsolutePath.getAbsolutePath(
                                      imageAsset.identifier);
                              File tempFile = File(filePath);
                              if (tempFile.existsSync()) {
                                _pickedImages.add(tempFile);
                              }
                              widget.onImageSelected(_pickedImages);
                            });
                          }
                          setState(() {});
                        } catch (e) {
                          var error = e.toString();
                        }
                      }),
                ],
              ),
            ),
          );
  }
}
