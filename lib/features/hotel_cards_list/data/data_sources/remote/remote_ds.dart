import '../../models/CardsListModel.dart';

abstract class RemoteDS {
  Future<CardsModel> getCard();
}
