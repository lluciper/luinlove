import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DatePickerP extends StatefulWidget {
  const DatePickerP({
    Key? key,
    required this.initialDateTime,
    required this.maxTime,
    required this.minTime,
    required this.onUpdateTime,
    this.isShowTime = false,
    this.selectTextColor = Colors.black,
    this.nonSelectTextColor = Colors.black,
    this.selectColorBackGround = Colors.transparent,
    this.textStyleSelectDateTime,
    this.textStyleNoneSelectDateTime,
    this.textStyleLabel,
  }) : super(key: key);

  final DateTime initialDateTime, maxTime, minTime;
  final dynamic Function(DateTime) onUpdateTime;
  final bool isShowTime;
  final Color selectTextColor, nonSelectTextColor, selectColorBackGround;
  final TextStyle? textStyleSelectDateTime,
      textStyleNoneSelectDateTime,
      textStyleLabel;

  @override
  State<DatePickerP> createState() => _DatePickerPState();
}

class _DatePickerPState extends State<DatePickerP> {
  late int selectedDay;
  late int selectedMonth;
  late int selectedYear;
  late int selectedHour;
  late int selectedMinute;

  late FixedExtentScrollController dayController;
  late FixedExtentScrollController monthController;
  late FixedExtentScrollController yearController;

  late FixedExtentScrollController hourController;
  late FixedExtentScrollController minuteController;

  late int generateDay;

  @override
  void initState() {
    super.initState();
    selectedDay = widget.initialDateTime.day;
    selectedMonth = widget.initialDateTime.month;
    selectedYear = widget.initialDateTime.year;
    selectedHour = widget.initialDateTime.hour;
    selectedMinute = widget.initialDateTime.minute;

    dayController = FixedExtentScrollController(initialItem: selectedDay - 1);
    monthController =
        FixedExtentScrollController(initialItem: selectedMonth - 1);
    yearController = FixedExtentScrollController(initialItem: selectedYear);

    hourController = FixedExtentScrollController(initialItem: selectedHour);
    minuteController = FixedExtentScrollController(initialItem: selectedMinute);

    generateDay = dayOfMonth(selectedDay, selectedMonth, selectedYear);
  }

  bool get _isCurrentDateValid {
    return true;
    // final DateTime minSelectedDate =
    //     DateTime(selectedYear, selectedMonth, selectedDay);
    // final DateTime maxSelectedDate =
    //     DateTime(selectedYear, selectedMonth, selectedDay + 1);

    // final bool minCheck = widget.initialDateTime.isBefore(maxSelectedDate);
    // final bool maxCheck = widget.maxTime.isBefore(minSelectedDate);

    // return minCheck && !maxCheck && minSelectedDate.day == selectedDay;
  }

  @override
  void dispose() {
    super.dispose();
    hourController.dispose();
    minuteController.dispose();
    dayController.dispose();
    monthController.dispose();
    yearController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            if (widget.isShowTime) ...[
              Expanded(
                child: Row(
                  children: [
                    nameColumn('Giờ'),
                    nameColumn('Phút'),
                    const SizedBox(width: 20),
                  ],
                ),
              ),
            ],
            Expanded(
              child: Row(
                children: [
                  nameColumn('Ngày'),
                  nameColumn('Tháng'),
                  nameColumn('Năm'),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Row(
                children: [
                  if (widget.isShowTime) ...[
                    Expanded(
                      child: Container(
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: widget.selectColorBackGround,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          ':',
                          style: widget.textStyleSelectDateTime,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                  ],
                  Expanded(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: widget.selectColorBackGround,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 140,
              child: Row(
                children: [
                  if (widget.isShowTime) ...[
                    Expanded(
                      child: Row(
                        children: [
                          hourCustom(
                            scrollController: hourController,
                            onSelectedItemChanged: (value) {
                              selectedHour = value;
                              widget.onUpdateTime(DateTime(
                                selectedYear,
                                selectedMonth,
                                selectedDay,
                                value,
                                selectedMinute,
                              ));
                            },
                          ),
                          minuteCustom(
                            scrollController: minuteController,
                            onSelectedItemChanged: (value) {
                              selectedMinute = value;
                              widget.onUpdateTime(DateTime(
                                selectedYear,
                                selectedMonth,
                                selectedDay,
                                selectedHour,
                                value,
                              ));
                            },
                          ),
                          const SizedBox(width: 20),
                        ],
                      ),
                    ),
                  ],
                  Expanded(
                    child: Row(
                      children: [
                        dayCustom(
                          scrollController: dayController,
                          onSelectedItemChanged: (value) {
                            selectedDay = value;
                            if (_isCurrentDateValid) {
                              widget.onUpdateTime(DateTime(
                                selectedYear,
                                selectedMonth,
                                value,
                                selectedHour,
                                selectedMinute,
                              ));
                            }
                          },
                        ),
                        monthCustom(
                          scrollController: monthController,
                          onSelectedItemChanged: (value) {
                            selectedMonth = value;
                            if (_isCurrentDateValid) {
                              widget.onUpdateTime(DateTime(
                                selectedYear,
                                value,
                                selectedDay,
                                selectedHour,
                                selectedMinute,
                              ));
                            }
                          },
                        ),
                        yearCustom(
                          scrollController: yearController,
                          onSelectedItemChanged: (value) {
                            selectedYear = value;
                            if (_isCurrentDateValid) {
                              widget.onUpdateTime(DateTime(
                                value,
                                selectedMonth,
                                selectedDay,
                                selectedHour,
                                selectedMinute,
                              ));
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  void scrollDay(int day, int minusDay, int daySelect) {
    dayController.animateToItem(
      day - minusDay,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
    selectedDay = daySelect;
  }

  int dayOfMonth(int day, int month, int year) {
    switch (month) {
      case 1:
      case 3:
      case 5:
      case 7:
      case 8:
      case 10:
      case 12:
        dayController.animateToItem(
          day - 1,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
        return 31;
      case 4:
      case 6:
      case 9:
      case 11:
        dayController.animateToItem(
          day == 31 ? day - 2 : day - 1,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
        if (day == 31) {
          selectedDay = 30;
        }
        return 30;
      default:
        if (year % 4 == 0) {
          if (day == 31) {
            scrollDay(day, 3, 29);
          } else if (day == 30) {
            scrollDay(day, 2, 29);
          }

          return 29;
        }
        if (day == 31) {
          scrollDay(day, 4, 28);
        } else if (day == 30) {
          scrollDay(day, 3, 28);
        } else if (day == 29) {
          scrollDay(day, 2, 28);
        }
        return 28;
    }
  }

  TextStyle? styleDateTime({
    required int indexSelect,
    required int index,
  }) {
    return index == indexSelect
        ? widget.textStyleSelectDateTime
        : widget.textStyleNoneSelectDateTime;
  }

  Expanded nameColumn(String nameColumn) => Expanded(
        child: Container(
          alignment: Alignment.center,
          child: Text(
            nameColumn.toUpperCase(),
            textAlign: TextAlign.center,
            style: widget.textStyleLabel,
          ),
        ),
      );

  Widget minuteCustom({
    void Function(int)? onSelectedItemChanged,
    FixedExtentScrollController? scrollController,
  }) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        if (notification is ScrollEndNotification) {
          setState(() {});
        }

        return false;
      },
      child: Expanded(
        child: CupertinoPicker(
          scrollController: scrollController,
          diameterRatio: 100,
          squeeze: 1,
          itemExtent: 50,
          looping: true,
          selectionOverlay: const SizedBox.shrink(),
          onSelectedItemChanged: (int value) {
            final index = value;
            onSelectedItemChanged!(index);
          },
          children: List<Widget>.generate(
            60,
            (int index) {
              final minute = index;

              return Container(
                height: 60,
                alignment: Alignment.center,
                child: Text(
                  '$minute'.toString().padLeft(2, '0'),
                  textAlign: TextAlign.center,
                  style: styleDateTime(
                    index: minute,
                    indexSelect: selectedMinute,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget hourCustom({
    void Function(int)? onSelectedItemChanged,
    FixedExtentScrollController? scrollController,
  }) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        if (notification is ScrollEndNotification) {
          setState(() {});
        }

        return false;
      },
      child: Expanded(
        child: CupertinoPicker(
          scrollController: scrollController,
          diameterRatio: 100,
          squeeze: 1,
          itemExtent: 50,
          looping: true,
          selectionOverlay: const SizedBox.shrink(),
          onSelectedItemChanged: (int value) {
            final index = value;
            onSelectedItemChanged!(index);
          },
          children: List<Widget>.generate(
            24,
            (int index) {
              final hour = index;

              return Container(
                height: 60,
                alignment: Alignment.center,
                child: Text(
                  '$hour'.toString().padLeft(2, '0'),
                  textAlign: TextAlign.center,
                  style: styleDateTime(
                    index: hour,
                    indexSelect: selectedHour,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget dayCustom({
    void Function(int)? onSelectedItemChanged,
    FixedExtentScrollController? scrollController,
  }) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        if (notification is ScrollEndNotification) {
          setState(() {});
        }

        return false;
      },
      child: Expanded(
        child: CupertinoPicker(
          scrollController: scrollController,
          diameterRatio: 100,
          squeeze: 1,
          itemExtent: 50,
          // looping: true,
          selectionOverlay: const SizedBox.shrink(),
          onSelectedItemChanged: (int value) {
            final index = value + 1;
            onSelectedItemChanged!(index);
          },
          children: List<Widget>.generate(
            generateDay,
            (int index) {
              final day = index + 1;

              return Container(
                height: 60,
                alignment: Alignment.center,
                child: Text(
                  '$day'.toString().padLeft(2, '0'),
                  textAlign: TextAlign.center,
                  style: styleDateTime(
                    index: day,
                    indexSelect: selectedDay,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget monthCustom({
    void Function(int)? onSelectedItemChanged,
    FixedExtentScrollController? scrollController,
  }) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        if (notification is ScrollEndNotification) {
          generateDay = dayOfMonth(selectedDay, selectedMonth, selectedYear);
          setState(() {});
        }

        return false;
      },
      child: Expanded(
        child: CupertinoPicker(
          scrollController: scrollController,
          diameterRatio: 100,
          squeeze: 1,
          itemExtent: 50,
          // looping: true,
          selectionOverlay: const SizedBox.shrink(),
          onSelectedItemChanged: (int value) {
            final index = value + 1;
            onSelectedItemChanged!(index);
          },
          children: List<Widget>.generate(
            12,
            (int index) {
              final month = index + 1;

              return Container(
                height: 60,
                alignment: Alignment.center,
                child: Text(
                  '$month'.toString().padLeft(2, '0'),
                  textAlign: TextAlign.center,
                  style: styleDateTime(
                    index: month,
                    indexSelect: selectedMonth,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget yearCustom({
    void Function(int)? onSelectedItemChanged,
    FixedExtentScrollController? scrollController,
  }) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        if (notification is ScrollEndNotification) {
          generateDay = dayOfMonth(selectedDay, selectedMonth, selectedYear);
          setState(() {});
        }

        return false;
      },
      child: Expanded(
        child: CupertinoPicker.builder(
          scrollController: scrollController,
          diameterRatio: 100,
          squeeze: 1,
          itemExtent: 50,
          selectionOverlay: const SizedBox.shrink(),
          onSelectedItemChanged: (int value) {
            final index = value;
            onSelectedItemChanged!(index);
          },
          itemBuilder: (BuildContext context, int year) {
            if (year < widget.minTime.year) {
              return null;
            }
            if (year > widget.maxTime.year) {
              return null;
            }

            return Container(
              height: 60,
              alignment: Alignment.center,
              child: Text(
                // '$year'.substring(2),
                '$year',
                textAlign: TextAlign.center,
                style: styleDateTime(
                  index: year,
                  indexSelect: selectedYear,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
