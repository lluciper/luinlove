import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class SliderOne extends StatelessWidget {
  const SliderOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          CircularStepProgressIndicator(
            totalSteps: 100,
            currentStep: 74,
            stepSize: 10,
            selectedColor: Colors.pink[600],
            unselectedColor: Colors.pink[200],
            padding: 0,
            width: 170,
            height: 170,
            selectedStepSize: 15,
            roundedCap: (_, __) => true,
          ),
          Text(
            'data',
            style: GoogleFonts.aBeeZee(
              color: Colors.red,
              fontWeight: FontWeight.w700,
              fontSize: 30,
            ),
          )
        ],
      ),
    );
  }
}
