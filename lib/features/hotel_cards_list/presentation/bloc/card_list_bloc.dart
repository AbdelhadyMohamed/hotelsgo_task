import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/CardsListModel.dart';
import '../../domain/use_cases/get_card_data_use_case.dart';

part 'card_list_event.dart';
part 'card_list_state.dart';

class CardListBloc extends Bloc<CardListEvent, CardListState> {
  static CardListBloc get(context) => BlocProvider.of(context);
  GetCardDataUseCase getCardDataUseCase;
  CardListBloc(this.getCardDataUseCase) : super(CardListInitial()) {
    on<CardListEvent>(
      (event, emit) async {
        if (event is GetCardsEvent) {
          try {
            CardsModel cardsModel = await getCardDataUseCase.call();
            emit(state.copyWith(
                cardsModel: cardsModel, screenStatus: ScreenStatus.success));
          } catch (e) {
            emit(state.copyWith(screenStatus: ScreenStatus.failure));
          }
        } else if (event is SortByRecommended) {
          try {
            CardsModel cardsModel = await getCardDataUseCase.call();
            emit(state.copyWith(
                screenStatus: ScreenStatus.sortByRecommended,
                cardsModel: cardsModel,
                recommendations: true));
          } catch (e) {
            emit(state.copyWith(screenStatus: ScreenStatus.failure));
          }
        } else if (event is SortByRatingAndRecommended) {
          try {
            CardsModel cardsModel = await getCardDataUseCase.call();
            cardsModel.cardsList
                ?.sort((a, b) => a.reviewScore!.compareTo(b.reviewScore!));
            emit(state.copyWith(
                screenStatus: ScreenStatus.sortByRatingAndRecommended,
                cardsModel: cardsModel,
                sortByRatingAndRecommendations: true));
          } catch (e) {
            emit(state.copyWith(screenStatus: ScreenStatus.failure));
          }
        } else if (event is SortByPriceAndRecommended) {
          try {
            CardsModel cardsModel = await getCardDataUseCase.call();
            cardsModel.cardsList?.sort((a, b) => a.price!.compareTo(b.price!));
            emit(state.copyWith(
                screenStatus: ScreenStatus.sortByPriceAndRecommended,
                cardsModel: cardsModel,
                sortByPriceAndRecommendations: true));
          } catch (e) {
            emit(state.copyWith(screenStatus: ScreenStatus.failure));
          }
        } else if (event is SortByDistanceAndRecommended) {
          try {
            CardsModel cardsModel = await getCardDataUseCase.call();
            cardsModel.cardsList
                ?.sort((a, b) => a.address!.compareTo(b.address!));
            emit(state.copyWith(
                screenStatus: ScreenStatus.sortByDistanceAndRecommended,
                cardsModel: cardsModel,
                sortByDistanceAndRecommendations: true));
          } catch (e) {
            emit(state.copyWith(screenStatus: ScreenStatus.failure));
          }
        } else if (event is SortByRating) {
          try {
            CardsModel cardsModel = await getCardDataUseCase.call();
            cardsModel.cardsList
                ?.sort((a, b) => a.reviewScore!.compareTo(b.reviewScore!));
            emit(state.copyWith(
                screenStatus: ScreenStatus.sortByRating,
                cardsModel: cardsModel,
                sortByRating: true));
          } catch (e) {
            emit(state.copyWith(screenStatus: ScreenStatus.failure));
          }
        } else if (event is SortByPrice) {
          try {
            CardsModel cardsModel = await getCardDataUseCase.call();
            cardsModel.cardsList?.sort((a, b) => a.price!.compareTo(b.price!));
            emit(state.copyWith(
                screenStatus: ScreenStatus.sortByPrice,
                cardsModel: cardsModel,
                sortByPrice: true));
          } catch (e) {
            emit(state.copyWith(screenStatus: ScreenStatus.failure));
          }
        } else if (event is SortByDistance) {
          try {
            CardsModel cardsModel = await getCardDataUseCase.call();
            cardsModel.cardsList
                ?.sort((a, b) => a.address!.compareTo(b.address!));
            emit(state.copyWith(
                screenStatus: ScreenStatus.sortByDistance,
                cardsModel: cardsModel,
                sortByDistance: true));
          } catch (e) {
            emit(state.copyWith(screenStatus: ScreenStatus.failure));
          }
        } else if (event is FilterEvent) {
          try {
            CardsModel cardsModel = await getCardDataUseCase.call();
            if (cardsModel.cardsList!.isNotEmpty &&
                cardsModel.cardsList != null) {
              cardsModel.cardsList
                  ?.removeWhere((element) => element.price! < event.price);
              cardsModel.cardsList
                  ?.removeWhere((element) => element.starts! < event.stars);
              cardsModel.cardsList?.removeWhere(
                  (element) => element.reviewScore! < event.rating);
              emit(state.copyWith(
                  screenStatus: ScreenStatus.filter,
                  cardsModel: cardsModel,
                  sortByDistance: true));
            }
          } catch (e) {
            emit(state.copyWith(screenStatus: ScreenStatus.failure));
          }
        }
      },
    );
  }
}
