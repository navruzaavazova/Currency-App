import 'package:currency_app/exchange_page.dart/widgets/exchange_icon_button.dart';
import 'package:currency_app/exchange_page.dart/widgets/exchange_row.dart';
import 'package:currency_app/providers/exchange_provider.dart';
import 'package:currency_app/utils/app_colors.dart';
import 'package:currency_app/utils/app_routes_names.dart';
import 'package:currency_app/utils/app_string.dart';
import 'package:currency_app/utils/first_second.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExchangePage extends StatelessWidget {
  ExchangePage({super.key});
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: const Text(
          AppString.currencyConverter,
          style: TextStyle(
            color: AppColors.converterColor,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 109,
          ),
          child:
              Consumer<ExchangeProvider>(builder: (context, provider, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 276,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.tableColor,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          color: Colors.black.withOpacity(0.05),
                          offset: const Offset(0, 4),
                        )
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ExchangeRow(
                          text: AppString.amount,
                          svgPath:
                              'assets/icons/${provider.selectedCcy1.toString()}.svg',
                          currencyName: provider.selectedCcy1.toString(),
                          func: () {
                            Navigator.pushNamed(
                                context, AppRoutesNames.currencyListPage,
                                arguments: FirstSecond.first);
                          },
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              controller2.text = provider.converting(value, true) ?? '';
                            }
                          },
                          controller: controller1,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: ExchangeIconButton(
                            func: () {
                              provider.changer(controller1, controller2);
                            },
                          ),
                        ),
                        ExchangeRow(
                          text: AppString.convertedAmount,
                          svgPath:
                              'assets/icons/${provider.selectedCcy2.toString()}.svg',
                          currencyName: provider.selectedCcy2.toString(),
                          func: () {
                            Navigator.pushNamed(
                                context, AppRoutesNames.currencyListPage,
                                arguments: FirstSecond.second);
                          },
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              controller1.text = provider.converting(value, false) ?? '';
                            }
                          },
                          controller: controller2,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  AppString.exchangeRate,
                  style: TextStyle(
                    color: AppColors.rateColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text('${provider.selectedCcy1} 1 = ${provider.exchangeRate()} ${provider.selectedCcy2}'),
              ],
            );
          })),
    );
  }
}
