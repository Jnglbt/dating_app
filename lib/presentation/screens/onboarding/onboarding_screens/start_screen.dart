import 'package:dating_app/presentation/screens/onboarding/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Start extends StatelessWidget {
  final TabController tabController;

  const Start({Key? key, required this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                height: 200,
                width: 200,
                child: SvgPicture.asset('assets/images/couple.svg'),
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                'Welcome To Arrow',
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus interdum posuere lorem at elementum.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      height: 1.6,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
              ),
            ],
          ),
          CustomButton(
            tabController: tabController,
            text: 'START',
          ),
        ],
      ),
    );
  }
}
