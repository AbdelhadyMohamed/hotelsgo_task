import '../../data/models/CardsListModel.dart';
import '../repositories/cards_repo.dart';

class GetCardDataUseCase {
  CardRepo cardRepo;
  GetCardDataUseCase(this.cardRepo);

  Future<CardsModel> call() => cardRepo.getCard();
}
