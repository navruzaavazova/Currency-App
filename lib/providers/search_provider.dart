import 'package:flutter/material.dart';
import 'package:currency_app/currency_service/currency_model.dart';
import 'package:currency_app/currency_service/currency_parser.dart';

class SearchProvider extends ChangeNotifier {
  bool isLoading = true;
  List<CurrencyModel> _currencies = [];
  List<CurrencyModel> filteredCurrencies = [];
  String searchText = '';


  Future<void> currencyList() async {
    _currencies = await CurrencyParser().getCurrency();
    filteredCurrencies = _currencies;
    notifyListeners();
    isLoading = false;
    searchCurrency();
  }

  void searchCurrency() {
    if (searchText.isEmpty) {
      filteredCurrencies = _currencies;
    } else {
      filteredCurrencies = _currencies.where((currency) {
        final lowerQuery = searchText.toUpperCase();
        return currency.ccy!.startsWith(lowerQuery);
      }).toList();
    }
    notifyListeners();
  }

  search(String username) {
    searchText = username;
    searchCurrency();
  }


}
