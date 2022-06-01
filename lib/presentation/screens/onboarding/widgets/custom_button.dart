import 'package:dating_app/models/models.dart';
import 'package:dating_app/presentation/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../blocs/cubits/signup/signup_cubit.dart';

class CustomButton extends StatelessWidget {
  final TabController tabController;
  final String text;

  const CustomButton({
    Key? key,
    required this.tabController,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        gradient: const LinearGradient(colors: [
          Colors.red,
          Colors.blueGrey,
        ]),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          primary: Colors.transparent,
        ),
        onPressed: () async {
          if (tabController.index == 6) {
            Navigator.pushNamed(context, '/');
          } else {
            tabController.animateTo(tabController.index + 1);
          }

          if (tabController.index == 2) {
            await context.read<SignupCubit>().signupWithCredentials();

            User user = User(
                id: context.read<SignupCubit>().state.user!.uid,
                name: '',
                age: 0,
                gender: '',
                imageUrls: [],
                interests: [],
                bio: '',
                jobTitle: '',
                location: '');

            context.read<OnboardingBloc>().add(
                  StartOnboarding(user: user),
                );
          }
        },
        child: SizedBox(
          width: double.infinity,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: Colors.white,
                ),
          ),
        ),
      ),
    );
  }
}
