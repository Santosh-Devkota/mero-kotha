import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../conf.dart';

class ImageUpload extends StatefulWidget {
  @override
  _ImageUploadState createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {
  @override
  Widget build(BuildContext context) {
    return ClayContainer(
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
                  "Upload Photos",
                  style: GoogleFonts.roboto(
                      fontSize: 16,
                      color: Color(0xFF193566),
                      letterSpacing: 1,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
