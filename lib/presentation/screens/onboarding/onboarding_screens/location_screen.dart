import 'package:dating_app/presentation/blocs/blocs.dart';
import 'package:dating_app/presentation/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../widgets/widgets.dart';

class Location extends OnboardingScreen {
  final TabController tabController;

  const Location({Key? key, required this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingBloc, OnboardingState>(
      builder: (context, state) {
        if (state is OnboardingLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is OnboardingLoaded) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const CustomTextHeader(text: 'What Is Your Location?'),
                  CustomTextField(
                    text: 'ENTER YOUR LOCATION',
                    onChanged: (value) {
                      context.read<OnboardingBloc>().add(
                            UpdateUser(
                              user: state.user.copyWith(
                                location: value,
                              ),
                            ),
                          );
                    },
                  ),
                ]),
                Column(
                  children: [
                    StepProgressIndicator(
                      totalSteps: 6,
                      currentStep: 6,
                      selectedColor: Colors.blueGrey,
                      unselectedColor: (Colors.grey[100])!,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomButton(
                      tabController: tabController,
                      text: 'DONE',
                    ),
                  ],
                ),
              ],
            ),
          );
        } else {
          return const Text('Something went wrong.');
        }
      },
    );
  }
}
