import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  CustomText({
    super.key,
    required this.data,
    required this.style,
    this.textOverflow,
    this.maxLines,
    this.textAlign,
    this.softWrap,
  });
  final String data;
  final TextStyle style;
  TextOverflow? textOverflow;
  TextAlign? textAlign;
  int? maxLines;
  bool? softWrap;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: style,
      maxLines: maxLines,
      overflow: textOverflow,
      textAlign: textAlign,
      softWrap: softWrap,
    );
  }
}
