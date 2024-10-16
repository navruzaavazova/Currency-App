import 'package:currency_app/exchange_page.dart/exchange_page.dart';
import 'package:currency_app/providers/exchange_provider.dart';
import 'package:currency_app/providers/search_provider.dart';
import 'package:currency_app/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(

      providers: [
        ChangeNotifierProvider(create: (context)=> SearchProvider(),),
        ChangeNotifierProvider(create: (context)=> ExchangeProvider(),),
      ],
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Roboto',
        ),
        home: ExchangePage(),
        routes: AppRoutes.routes,
      ),
    );
  }
}
