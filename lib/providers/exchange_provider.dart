import 'package:currency_app/currency_service/currency_model.dart';
import 'package:flutter/material.dart';

class ExchangeProvider extends ChangeNotifier {
  String selectedRate1 = '1.0';
  String selectedCcy1 = 'EUR';
  String selectedRate2 = '1.0';
  String selectedCcy2 = 'USD';
  CurrencyModel? selectedCurrency1;
  CurrencyModel? selectedCurrency2;

  void selectCurrency1(CurrencyModel? currency) {
    selectedCurrency1 = currency ?? CurrencyModel(ccy: 'UZB');
    selectedRate1 = currency?.rate ?? selectedRate1;
    selectedCcy1 = currency?.ccy ?? selectedCcy1;
    notifyListeners();
  }

  void selectCurrency2(CurrencyModel? currency) {
    selectedCurrency2 = currency ?? CurrencyModel(ccy: 'USD');
    selectedRate2 = currency?.rate ?? selectedRate2;
    selectedCcy2 = currency?.ccy ?? selectedCcy2;
    notifyListeners();
  }

  String? converting(String value1, bool isThisFirst) {
    double number1 = double.tryParse(value1) ?? 0;
    double rate1 = double.tryParse(selectedRate1) ?? 1.0;
    double rate2 = double.tryParse(selectedRate2) ?? 1.0;

    if (isThisFirst) {
      return (number1 * (rate1 / rate2)).toStringAsFixed(2);
    } else {
      return (number1 * (rate2 / rate1)).toStringAsFixed(2);
    }
  }

  String exchangeRate() {
    double rate1 = double.parse(selectedRate1);
    double rate2 = double.parse(selectedRate2);
    return (rate1 / rate2).toStringAsFixed(2);
  }

  void changer(TextEditingController controller1, TextEditingController controller2) {
    final tempRate = selectedRate1;
    final tempCcy = selectedCcy1;
    final tempCurrency = selectedCurrency1;

    selectedRate1 = selectedRate2;
    selectedCcy1 = selectedCcy2;
    selectedCurrency1 = selectedCurrency2;

    selectedRate2 = tempRate;
    selectedCcy2 = tempCcy;
    selectedCurrency2 = tempCurrency;

    final newValue1 = converting(controller2.text, false);
    final newValue2 = converting(controller1.text, true);

    controller1.text = newValue1 ?? '1.0';
    controller2.text = newValue2 ?? '1.0';

    notifyListeners();
  }
}
