import '../../data/models/CardsListModel.dart';

abstract class CardRepo {
  Future<CardsModel> getCard();
}
