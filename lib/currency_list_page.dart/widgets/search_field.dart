import 'package:currency_app/providers/search_provider.dart';
import 'package:currency_app/utils/app_colors.dart';
import 'package:currency_app/utils/app_icons.dart';
import 'package:currency_app/utils/app_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 30,
              offset: const Offset(0, 10),
              color: Colors.black.withOpacity(0.05),
            )
          ]),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 14, right: 14, bottom: 10, top: 11),
        child: Consumer<SearchProvider>(builder: (context, provider, child) {
          return TextField(
            controller: controller,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: AppString.search,
              hintStyle: const TextStyle(
                color: AppColors.searchColor,
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(
                  right: 14,
                  bottom: 1,
                ),
                child: SvgPicture.asset(
                  AppIcons.searchIcon.path,
                  height: 24,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
