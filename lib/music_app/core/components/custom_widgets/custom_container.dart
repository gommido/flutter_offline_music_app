import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  CustomContainer({
    super.key,
    this.width,
    this.height,
    this.decoration,
    this.child,
    this.padding,
    this.margin,
    this.alignment,
  });
  double? width;
  double? height;
  Decoration? decoration;
  Widget? child;
  EdgeInsetsGeometry? padding;
  EdgeInsetsGeometry? margin;
  AlignmentGeometry? alignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      padding: padding,
      margin: margin,
      width: width,
      height: height,
      decoration: decoration,
      child: child,
    );
  }
}
