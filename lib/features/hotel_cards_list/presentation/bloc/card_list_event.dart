part of 'card_list_bloc.dart';

@immutable
abstract class CardListEvent {}

class GetCardsEvent extends CardListEvent {}

class SortByRecommended extends CardListEvent {}

class SortByRatingAndRecommended extends CardListEvent {}

class SortByPriceAndRecommended extends CardListEvent {}

class SortByDistanceAndRecommended extends CardListEvent {}

class SortByRating extends CardListEvent {}

class SortByPrice extends CardListEvent {}

class SortByDistance extends CardListEvent {}
