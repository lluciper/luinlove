import 'package:flutter/material.dart';
import 'package:luinlove/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemDate extends StatelessWidget {
  const ItemDate({
    super.key,
    required this.date,
    required this.description,
  });

  final String date;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 8,
      ),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.pink,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            date,
            style: GoogleFonts.aBeeZee(
              fontWeight: FontWeight.w700,
              fontSize: 32,
              color: AppColors.white,
            ),
          ),
          Text(
            description,
            style: GoogleFonts.aBeeZee(
              fontWeight: FontWeight.w500,
              fontSize: 18,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
