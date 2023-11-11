import 'package:flutter/material.dart';
import 'package:hotelsgo_task/features/hotel_cards_list/presentation/pages/card_list_screen.dart';

class AppRoute {
  static const String cardList = "/";
}

class Routes {
  static Route onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case AppRoute.cardList:
        return MaterialPageRoute(builder: (context) => const CardListScreen());
      default:
        return MaterialPageRoute(
          builder: (context) {
            return Scaffold(
              appBar: AppBar(title: const Text("error")),
              body: unDefinedRoute(),
            );
          },
        );
    }
  }

  static Widget unDefinedRoute() {
    return const Center(child: Text("Route Not Found"));
  }
}
