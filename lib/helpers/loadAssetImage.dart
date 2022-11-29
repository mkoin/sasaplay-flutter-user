import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget loadImage({required String imageUrl, double? height, double? width,BoxFit? fit}) {
  return Container(
    height: height ?? 25,
    width: width ?? 25,
    decoration: BoxDecoration(
      image: DecorationImage(
        // colorFilter:  ColorFilter.mode(
        //     Colors.transparent, BlendMode.dstATop),
        image: AssetImage(imageUrl),
        fit:fit?? BoxFit.contain,
      ),
    ),
  );
}


Widget loadSvgAsset(
    {required String path, double? width, double? height, Color? color}) {
  return SvgPicture.asset(
    path,
    color: color,
    //?? Colors.black ,

    width: width,
    height: height,
  );
}
