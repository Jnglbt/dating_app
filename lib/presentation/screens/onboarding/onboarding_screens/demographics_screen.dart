import 'package:dating_app/presentation/blocs/blocs.dart';
import 'package:dating_app/presentation/screens/onboarding/widgets/custom_checkbox.dart';
import 'package:dating_app/presentation/screens/onboarding/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text_header.dart';

class Demographics extends StatelessWidget {
  final TabController tabController;

  const Demographics({Key? key, required this.tabController}) : super(key: key);

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
                    CustomTextHeader(
                      text: 'What\'s Your Gender?',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomCheckbox(
                      text: 'MALE',
                      value: state.user.gender == 'Male',
                      onChanged: (bool? newValue) {
                        context.read<OnboardingBloc>().add(
                              UpdateUser(
                                user: state.user.copyWith(gender: 'Male'),
                              ),
                            );
                      },
                    ),
                    CustomCheckbox(
                      text: 'FEMALE',
                      value: state.user.gender == 'Female',
                      onChanged: (bool? newValue) {
                        context.read<OnboardingBloc>().add(
                              UpdateUser(
                                user: state.user.copyWith(gender: 'Female'),
                              ),
                            );
                      },
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    CustomTextHeader(
                      text: 'What\'s Your Age?',
                    ),
                    CustomTextField(
                      text: 'ENTER YOUR AGE',
                      onChanged: (value) {
                        context.read<OnboardingBloc>().add(
                              UpdateUser(
                                user: state.user.copyWith(
                                  age: int.parse(value),
                                ),
                              ),
                            );
                      },
                    ),
                  ],
                ),
                Column(
                  children: [
                    StepProgressIndicator(
                      totalSteps: 6,
                      currentStep: 3,
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
