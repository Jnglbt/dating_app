import 'package:dating_app/presentation/blocs/blocs.dart';
import 'package:dating_app/presentation/screens/onboarding/widgets/custom_text_field.dart';
import 'package:dating_app/presentation/widgets/interest_plate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text_header.dart';

class Bio extends StatelessWidget {
  final TabController tabController;

  const Bio({Key? key, required this.tabController}) : super(key: key);

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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomTextHeader(text: 'Describe Yourself'),
                    CustomTextField(
                      text: 'ENTER YOUR BIO',
                      onChanged: (value) {
                        context.read<OnboardingBloc>().add(
                              UpdateUser(
                                user: state.user.copyWith(
                                  bio: value,
                                ),
                              ),
                            );
                      },
                    ),
                    const SizedBox(
                      height: 100.0,
                    ),
                    const CustomTextHeader(text: 'What Do You Like?'),
                    Row(
                      children: [
                        const InterestPlate(text: 'MUSIC'),
                        const InterestPlate(text: 'ECONOMICS'),
                        const InterestPlate(text: 'SPORT'),
                        const InterestPlate(text: 'ART'),
                      ],
                    ),
                    Row(
                      children: [
                        const InterestPlate(text: 'NATURE'),
                        const InterestPlate(text: 'HIKING'),
                        const InterestPlate(text: 'FOOTBALL'),
                        const InterestPlate(text: 'MOVIES'),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    StepProgressIndicator(
                      totalSteps: 6,
                      currentStep: 5,
                      selectedColor: Colors.blueGrey,
                      unselectedColor: (Colors.grey[100])!,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomButton(
                      tabController: tabController,
                      text: 'NEXT STEP',
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
