import 'package:flutter/material.dart';
import 'package:luinlove/components/date_time_picker_custom/date_picker_p.dart';
import 'package:luinlove/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../components/bottom_sheet_expandable.dart';
import '../cubit/home/home_cubit.dart';

class SliderOne extends StatelessWidget {
  const SliderOne({super.key});

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
              Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                right: 0,
                child: InkWell(
                  splashColor: AppColors.transparent,
                  highlightColor: AppColors.transparent,
                  onTap: () {
                    showModalBottomSheet(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                      ),
                      context: context,
                      builder: (context) {
                        return BottomSheetExpandable(
                          body: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                DatePickerP(
                                  selectColorBackGround: AppColors.pink50,
                                  selectTextColor: AppColors.red500,
                                  textStyleLabel: GoogleFonts.aBeeZee(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                  textStyleSelectDateTime: GoogleFonts.aBeeZee(
                                    color: AppColors.red500,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                  ),
                                  textStyleNoneSelectDateTime:
                                      GoogleFonts.aBeeZee(
                                    color: AppColors.gray500,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                  initialDateTime:
                                      state.saveDate ?? DateTime.now(),
                                  maxTime: DateTime.now(),
                                  minTime:
                                      DateTime.parse('1900-01-01 00:00:00'),
                                  onUpdateTime: (date) {
                                    context.read<HomeCubit>().changeDate(date);
                                  },
                                ),
                                const SizedBox(height: 16),
                                InkWell(
                                  splashColor: AppColors.transparent,
                                  highlightColor: AppColors.transparent,
                                  onTap: () {
                                    context.read<HomeCubit>().saveDate();
                                    Navigator.of(context).pop();
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 50,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: AppColors.pink500,
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Text(
                                      AppStrings.complete,
                                      style: GoogleFonts.aBeeZee(
                                        color: AppColors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          minHeight: 320,
                          header: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 16,
                            ),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16),
                                topRight: Radius.circular(16),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Chọn ngày',
                                  style: GoogleFonts.aBeeZee(
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '$numberOfDays',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.aBeeZee(
                          color: Colors.red,
                          fontWeight: FontWeight.w700,
                          fontSize: 30,
                        ),
                      ),
                      Text(
                        AppStrings.day.toLowerCase(),
                        textAlign: TextAlign.center,
                        style: GoogleFonts.aBeeZee(
                          color: Colors.red,
                          fontWeight: FontWeight.w700,
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
