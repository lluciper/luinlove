import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:time_machine/time_machine.dart';

import '../../cubit/home/home_cubit.dart';
import '../../utils/utils.dart';
import 'widget/item_date.dart';

class SliderTwo extends StatelessWidget {
  const SliderTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // ignore: unnecessary_statements
        state.saveDate != null;
      },
      buildWhen: (pre, cur) {
        return pre.saveDate != cur.saveDate;
      },
      builder: (context, state) {
        var now = LocalDate.today();

        var nows = DateTime.now();

        // Duration difference = now.difference(state.saveDate ?? now);
        // int numberOfDays = difference.inDays;

        var saveDate = LocalDate.dateTime(DateTime(
          state.saveDate?.year ?? nows.year,
          state.saveDate?.month ?? nows.month,
          state.saveDate?.day ?? nows.day,
        ));

        var diff = now.periodSince(saveDate);

        var year = diff.years;
        var month = diff.months;
        var week = diff.days ~/ 7;
        var day = diff.days % 7;

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
