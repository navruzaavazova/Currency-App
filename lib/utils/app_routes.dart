
import 'package:currency_app/currency_list_page.dart/currency_list_page.dart';
import 'package:currency_app/exchange_page.dart/exchange_page.dart';
import 'package:currency_app/utils/app_routes_names.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    AppRoutesNames.exchangePage: (context) => ExchangePage(),
    AppRoutesNames.currencyListPage: (context) => const CurrencyListPage(),
  };
}
