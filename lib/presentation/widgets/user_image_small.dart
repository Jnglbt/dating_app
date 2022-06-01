import 'package:flutter/material.dart';

class UserImageSmall extends StatelessWidget {
  final String imageUrl;
  final double height;
  final double width;

  const UserImageSmall({
    Key? key,
    required this.imageUrl,
    this.height = 70,
    this.width = 70,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: const EdgeInsets.only(top: 8, right: 8),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(imageUrl),
        ),
        borderRadius: BorderRadius.circular(5.0),
      ),
    );
  }
}
