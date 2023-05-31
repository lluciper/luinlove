import 'package:flutter/material.dart';
import 'package:flutter_application_1/home_page/widget/item_date.dart';
import 'package:flutter_application_1/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class SliderTwo extends StatelessWidget {
  const SliderTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ItemDate(
                date: '0',
                description: AppStrings.year,
              ),
              ItemDate(
                date: '0',
                description: AppStrings.month,
              ),
              ItemDate(
                date: '0',
                description: AppStrings.week,
              ),
              ItemDate(
                date: '0',
                description: AppStrings.day,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '# Save date #',
                style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w400),
              ),
              Text(
                'real time',
                style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
