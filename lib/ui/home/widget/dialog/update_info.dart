import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../components/text_field/text_field_common_widget.dart';
import '../../../../utils/utils.dart';

class DialogUpdateInfo extends StatelessWidget {
  const DialogUpdateInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      insetPadding: const EdgeInsets.symmetric(horizontal: 28),
      backgroundColor: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFieldSendRecord(
              onChanged: (data) {},
              labelText: 'Name',
              hintText: 'Name1',
              errorText: '',
            ),
            const SizedBox(height: 16),
            TextFieldSendRecord(
              onChanged: (data) {},
              labelText: 'Name',
              hintText: 'Name1',
              errorText: '',
            ),
            const SizedBox(height: 24),
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: AppColors.pink200,
                borderRadius: BorderRadius.circular(8),
              ),
              alignment: Alignment.center,
              child: Text(
                AppStrings.complete,
                style: GoogleFonts.aBeeZee(
                  color: AppColors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
