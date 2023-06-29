import 'package:flutter/material.dart';
import 'package:luinlove/home_page/widget/item_date.dart';
import 'package:luinlove/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:time_machine/time_machine.dart';

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
        LocalDate now = LocalDate.today();

        DateTime nows = DateTime.now();

        // Duration difference = now.difference(state.saveDate ?? now);
        // int numberOfDays = difference.inDays;

        LocalDate saveDate = LocalDate.dateTime(DateTime(
          state.saveDate?.year ?? nows.year,
          state.saveDate?.month ?? nows.month,
          state.saveDate?.day ?? nows.day,
        ));

        Period diff = now.periodSince(saveDate);

        int year = diff.years;
        int month = diff.months;
        int week = diff.days ~/ 7;
        int day = diff.days % 7;

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
                    state.saveDate?.formatDateTime ?? '',
                    style: GoogleFonts.aBeeZee(fontWeight: FontWeight.w400),
                  ),
                  Text(
                    nows.formatDateTime,
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
