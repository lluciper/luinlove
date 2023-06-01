import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/colors.dart';

class BottomSheetExpandable extends StatefulWidget {
  const BottomSheetExpandable({
    Key? key,
    required this.body,
    required this.header,
    required this.minHeight,
  }) : super(key: key);

  final Widget body;
  final Widget header;
  final double minHeight;

  @override
  State<BottomSheetExpandable> createState() => _BottomSheetExpandableState();
}

class _BottomSheetExpandableState extends State<BottomSheetExpandable> {
  double minHeight = 0;
  double maxHeight = 500;
  double currentHeight = 0;
  double oldOffset = 0;
  double newOffset = 0;
  bool isDragDirectionUp = false;

  @override
  void initState() {
    minHeight = widget.minHeight;
    currentHeight = widget.minHeight;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      verticalDirection: VerticalDirection.up,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: currentHeight - MediaQuery.of(context).viewInsets.bottom,
          decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onVerticalDragEnd: (_) => _onVerticalDragEnd,
                onVerticalDragUpdate: _onVerticalDragUpdate,
                child: widget.header,
              ),
              Expanded(child: widget.body),
            ],
          ),
        ),
      ],
    );
  }

  void _onVerticalDragEnd() {
    if (isDragDirectionUp) {
      setState(() {
        currentHeight = maxHeight;
      });
    } else if (!isDragDirectionUp) {
      if (currentHeight > minHeight) {
        setState(() {
          currentHeight = minHeight;
        });
      } else {
        Navigator.of(context).pop();
      }
    }
  }

  void _onVerticalDragUpdate(dynamic details) {
    setState(() {
      if (((currentHeight - details.delta.dy) > minHeight) &&
          ((currentHeight - details.delta.dy) < maxHeight)) {
        isDragDirectionUp = details.delta.dy <= 0;
        currentHeight -= details.delta.dy;
      }
    });
  }
}
