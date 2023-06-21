import 'package:flutter/material.dart';
import 'package:flutter_application_1/home_page/widget/item_date.dart';
import 'package:flutter_application_1/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../cubit/home/home_cubit.dart';

class SliderTwo extends StatelessWidget {
  const SliderTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        state.saveDate != null;
      },
      buildWhen: (pre, cur) {
        return pre.saveDate != cur.saveDate;
      },
      builder: (context, state) {
        DateTime now = DateTime.now();

        Duration difference = now.difference(state.saveDate ?? now);
        int numberOfDays = difference.inDays;

        int year = (difference.inDays / 365).floor();
        int month = (difference.inDays / 30).floor();
        int week = numberOfDays ~/ 7;
        int day = numberOfDays % 7;

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ItemDate(
                    date: year.toString(),
                    description: AppStrings.year,
                  ),
                  ItemDate(
                    date: month.toString(),
                    description: AppStrings.month,
                  ),
                  ItemDate(
                    date: week.toString(),
                    description: AppStrings.week,
                  ),
                  ItemDate(
                    date: day.toString(),
                    description: AppStrings.day,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    difference.toString(),
                    style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w400),
                  ),
                  Text(
                    now.formatDateTime,
                    style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

extension on DateTime {
  String get formatDateTime {
    final dateFormat = DateFormat('dd/MM/yyyy');
    return dateFormat.format(this);
  }
}
