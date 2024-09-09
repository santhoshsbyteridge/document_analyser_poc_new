import 'package:document_analyser_poc_new/utils/app_colors.dart';
import 'package:document_analyser_poc_new/utils/app_strings.dart';
import 'package:flutter/material.dart';

/// Widget to build header UI
class HeaderUI extends StatelessWidget {
  const HeaderUI({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80.0,
      decoration: BoxDecoration(
        color: AppColors.grey200,
      ),
      padding: const EdgeInsets.only(left: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: AppStrings.customers,
                  style: TextStyle(
                    color: AppColors.black26,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: ' > ',
                  style: TextStyle(
                    color: AppColors.grey,
                    fontSize: 16,
                  ),
                ),
                TextSpan(
                  text: AppStrings.newCustomers,
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
