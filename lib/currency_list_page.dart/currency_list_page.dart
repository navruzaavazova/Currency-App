import 'package:currency_app/currency_list_page.dart/widgets/search_field.dart';
import 'package:currency_app/currency_service/currency_model.dart';
import 'package:currency_app/providers/exchange_provider.dart';
import 'package:currency_app/utils/app_colors.dart';
import 'package:currency_app/utils/first_second.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:currency_app/providers/search_provider.dart';

class CurrencyListPage extends StatelessWidget {
  const CurrencyListPage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SearchProvider>().currencyList();
    });

    TextEditingController controller = TextEditingController();
    controller.addListener(
      () {
        final query = controller.text;
        context.read<SearchProvider>().search(query);
      },
    );
    final FirstSecond row =
        ModalRoute.of(context)?.settings.arguments as FirstSecond;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: const Text(
          "Currency Converter",
          style: TextStyle(
            color: AppColors.converterColor,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SearchField(controller: controller),
            Expanded(
              child: Consumer2<SearchProvider, ExchangeProvider>(
                builder: (context, searchProvider, exchangeProvider, _) {
                  return ListView.builder(
                    itemCount: searchProvider.filteredCurrencies.length,
                    itemBuilder: (context, index) {
                      final currency = searchProvider.filteredCurrencies[index];

                      return Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: InkWell(
                          onTap: () {
                            if (row == FirstSecond.first) {
                              exchangeProvider.selectCurrency1(currency);
                            } else if (row == FirstSecond.second) {
                              exchangeProvider.selectCurrency2(currency);
                            }
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 73,
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                            ),
                            child: Row(
                              children: [
                                // SvgPicture.asset('assets/icons/${currency.ccy.toString()}.svg', height: 45, width: 45,),
                                const SizedBox(width: 20),
                                Expanded(
                                  child: Text(currency.ccy.toString()),
                                ),
                                Radio<CurrencyModel>(
                                  value: currency,
                                  groupValue: row == FirstSecond.first
                                      ? exchangeProvider.selectedCurrency1
                                      : exchangeProvider.selectedCurrency2,
                                  onChanged: (CurrencyModel? selected) {
                                    if (row == FirstSecond.first) {
                                      exchangeProvider.selectCurrency1(selected!);
                                    } else {
                                      exchangeProvider.selectCurrency2(selected!);
                                    }
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
