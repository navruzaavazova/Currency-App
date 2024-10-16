import 'package:currency_app/utils/app_colors.dart';
import 'package:currency_app/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExchangeIconButton extends StatelessWidget {
  const ExchangeIconButton({
    super.key,
    required this.func,
  });
  final Function() func;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            height: 1,
            color: AppColors.dividerColor,
          ),
        ),
        GestureDetector(
          onTap: func,
          child: Container(
            height: 44,
            width: 44,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.iconConvertColor,
            ),
            child: Center(
              child: SvgPicture.asset(
                AppIcons.exchangeLines.path,
              ),
            ),
          ),
        ),
        const Expanded(
          child: Divider(
            height: 1,
            color: AppColors.dividerColor,
          ),
        ),
      ],
    );
  }
}
