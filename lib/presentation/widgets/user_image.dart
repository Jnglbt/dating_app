import 'package:flutter/material.dart';

class UserImage extends StatelessWidget {
  final String? url;
  final double height;
  final double width;
  final EdgeInsets? margin;
  final List<BoxShadow>? boxShadow;
  final BoxBorder? border;
  final Widget? child;

  const UserImage.small(
      {Key? key,
      this.url,
      this.height = 70,
      this.width = 70,
      this.margin,
      this.boxShadow,
      this.child,
      this.border})
      : super(key: key);

  const UserImage.medium(
      {Key? key,
      this.url,
      this.height = 200,
      this.width = double.infinity,
      this.margin,
      this.boxShadow,
      this.child,
      this.border})
      : super(key: key);

  const UserImage.large(
      {Key? key,
      this.url,
      this.height = 500,
      this.width = double.infinity,
      this.margin,
      this.boxShadow,
      this.child,
      this.border})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: height,
      width: width,
      decoration: BoxDecoration(
        border: border,
        color: Colors.blueGrey,
        boxShadow: boxShadow,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: (url == null)
              ? AssetImage('assets/images/placeholder.png') as ImageProvider
              : NetworkImage(url!),
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      child: child,
    );
  }
}
