import 'package:hotelsgo_task/features/hotel_cards_list/data/data_sources/remote/remote_ds.dart';
import 'package:hotelsgo_task/features/hotel_cards_list/domain/repositories/cards_repo.dart';

import '../models/CardsListModel.dart';

class CardRepoImpl implements CardRepo {
  RemoteDS remoteDS;

  CardRepoImpl(this.remoteDS);

  @override
  Future<CardsModel> getCard() => remoteDS.getCard();
}
