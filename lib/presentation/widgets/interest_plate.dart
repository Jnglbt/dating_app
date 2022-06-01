import 'package:flutter/material.dart';

import '../../models/user_model.dart';

class InterestPlate extends StatelessWidget {
  final String text;

  const InterestPlate({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, right: 5.0),
      child: Container(
        height: 30,
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          gradient: const LinearGradient(colors: [
            Colors.red,
            Colors.blueGrey,
          ]),
        ),
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                ),
          ),
        ),
      ),
    );
  }
}
