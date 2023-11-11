import 'package:flutter/foundation.dart';
import 'package:hotelsgo_task/core/api/api_manager.dart';
import 'package:hotelsgo_task/features/hotel_cards_list/data/data_sources/remote/remote_ds.dart';
import 'dart:convert';
import 'package:hotelsgo_task/core/api/constant.dart';
import 'package:http/http.dart';

import '../../models/CardsListModel.dart';

class RemoteDSImpl implements RemoteDS {
  ApiManager apiManager;
  RemoteDSImpl(this.apiManager);

  @override
  Future<CardsModel> getCard() async {
    try {
      Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.endPoint);
      Response response = await apiManager.getData(url);

      Map<String, dynamic> jsonData = {"cardsList": jsonDecode(response.body)};
      // if (kDebugMode) {
      //   print(jsonData);
      // }
      CardsModel cardsModel = CardsModel.fromJson(jsonData);
      // if (kDebugMode) {
      //   print(cardsModel.cardsList?[1].name);
      // }
      return cardsModel;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      throw Exception();
    }
  }
}
