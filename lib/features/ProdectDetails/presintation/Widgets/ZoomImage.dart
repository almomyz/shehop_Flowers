import 'package:flutter/material.dart';

class ZoomImage extends StatefulWidget {
  final pathImage;
   ZoomImage({Key? key,required this.pathImage}) : super(key: key);
  @override
  State<ZoomImage> createState() => _ZoomImageState();
}

class _ZoomImageState extends State<ZoomImage> {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'tag_1',
      child: Center(child: InteractiveViewer(child: Image.network(widget.pathImage,fit: BoxFit.cover,width: double.infinity,height: 500,))),
    );
  }
}
