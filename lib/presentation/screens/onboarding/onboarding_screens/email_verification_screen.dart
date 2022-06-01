import 'package:dating_app/presentation/screens/onboarding/widgets/custom_button.dart';
import 'package:dating_app/presentation/screens/onboarding/widgets/custom_text_field.dart';
import 'package:dating_app/presentation/screens/onboarding/widgets/custom_text_header.dart';
import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class EmailVerification extends StatelessWidget {
  final TabController tabController;

  const EmailVerification({Key? key, required this.tabController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextHeader(
                text: 'Did You Get Your Verification Code?',
              ),
              CustomTextField(
                text: 'ENTER YOUR CODE',
                textEditingController: emailController,
              ),
            ],
          ),
          Column(
            children: [
              StepProgressIndicator(
                totalSteps: 6,
                currentStep: 2,
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
  }
}
