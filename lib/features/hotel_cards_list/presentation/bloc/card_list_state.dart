part of 'card_list_bloc.dart';

enum ScreenStatus {
  init,
  loading,
  success,
  failure,
  sortByRecommended,
  sortByRatingAndRecommended,
  sortByPriceAndRecommended,
  sortByDistanceAndRecommended,
  sortByRating,
  sortByPrice,
  sortByDistance,
  filter
}

class CardListState {
  ScreenStatus? screenStatus;
  CardsModel? cardsModel;
  bool? recommendations;
  bool? sortByRatingAndRecommendations;
  bool? sortByPriceAndRecommendations;
  bool? sortByDistanceAndRecommendations;
  bool? sortByRating;
  bool? sortByPrice;
  bool? sortByDistance;

  CardListState({
    this.screenStatus,
    this.cardsModel,
    this.recommendations = false,
    this.sortByRatingAndRecommendations = false,
    this.sortByPriceAndRecommendations = false,
    this.sortByDistanceAndRecommendations = false,
    this.sortByRating = false,
    this.sortByPrice = false,
    this.sortByDistance = false,
  });
  CardListState copyWith(
      {screenStatus,
      cardsModel,
      numOfStars,
      recommendations,
      sortByRatingAndRecommendations,
      sortByPriceAndRecommendations,
      sortByDistanceAndRecommendations,
      sortByRating,
      sortByPrice,
      sortByDistance}) {
    return CardListState(
        screenStatus: screenStatus ?? this.screenStatus,
        cardsModel: cardsModel ?? this.cardsModel,
        recommendations: recommendations ?? false,
        sortByRatingAndRecommendations: sortByRatingAndRecommendations ?? false,
        sortByPriceAndRecommendations: sortByPriceAndRecommendations ?? false,
        sortByDistanceAndRecommendations:
            sortByDistanceAndRecommendations ?? false,
        sortByRating: sortByRating ?? false,
        sortByPrice: sortByPrice ?? false,
        sortByDistance: sortByDistance ?? false);
  }
}

class CardListInitial extends CardListState {
  CardListInitial({super.screenStatus});
}
