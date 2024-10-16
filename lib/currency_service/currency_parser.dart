import 'package:currency_app/currency_service/currency_model.dart';
import 'package:dio/dio.dart';

class CurrencyParser {
  String currencyApi = 'https://cbu.uz/uz/arkhiv-kursov-valyut/json/';

  Dio dio = Dio();
  Future<List<CurrencyModel>> getCurrency() async {
    final result = await dio.get(
      currencyApi,
    );
    if (result.statusCode == 200) {
      List<CurrencyModel> currencies = (result.data as List<dynamic>)
          .map((json) => CurrencyModel.fromJson(json as Map<String, dynamic>))
          .toList();
      currencies.add(CurrencyModel(id: 76, ccy: "UZB", rate: "1"));
      currencies = currencies.map((currency) {
        if (currency.ccy == 'TRY') {
          return CurrencyModel(
              id: currency.id, ccy: 'TRL', rate: currency.rate);
        }
        return currency;
      }).toList();

      return currencies;
    } else {
      throw Exception('dfd');
    }
  }
}
