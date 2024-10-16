import 'package:currency_app/utils/app_colors.dart';
import 'package:currency_app/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ExchangeRow extends StatelessWidget {
  const ExchangeRow({
    super.key,
    required this.text,
    required this.svgPath,
    required this.currencyName,
    required this.func,
    required this.onChanged, required this.controller,
  });
  final String text;
  final String svgPath;
  final String currencyName;
  final Function() func;
  final Function(String) onChanged;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: const TextStyle(
            color: AppColors.amountColor,
            fontSize: 15,
          ),
        ),
        const SizedBox(
          height: 14,
        ),
        Row(
          children: [
            GestureDetector(
              onTap: func,
              child: Row(
                children: [
                  SvgPicture.asset(
                    svgPath,
                    height: 45,
                  ),
                  const SizedBox(
                    width: 13,
                  ),
                  Text(
                    currencyName,
                    style: const TextStyle(
                      color: AppColors.currencyColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SvgPicture.asset(
                    AppIcons.chevronBottom.path,
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: AppColors.amountTableColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                  ),
                  child: TextField(
                    controller: controller,
                    onChanged: onChanged,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    textAlign: TextAlign.end,
                    keyboardType: TextInputType.number,
                    cursorColor: AppColors.amountTextColor,
                    style: const TextStyle(
                      color: AppColors.amountTextColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
