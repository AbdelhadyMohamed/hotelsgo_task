import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotelsgo_task/features/hotel_cards_list/presentation/bloc/card_list_bloc.dart';
import 'package:hotelsgo_task/features/hotel_cards_list/presentation/widgets/sorting_item.dart';

import '../../../../core/api/api_manager.dart';
import '../../data/data_sources/remote/remote_ds_impl.dart';
import '../../data/repositories/cards_repo_impl.dart';
import '../../domain/use_cases/get_card_data_use_case.dart';

class SortBottomSheet extends StatelessWidget {
  final CardListBloc bloc;
  const SortBottomSheet(this.bloc, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CardListBloc(
          GetCardDataUseCase(CardRepoImpl(RemoteDSImpl(ApiManager())))),
      child: BlocBuilder<CardListBloc, CardListState>(
        builder: (context, state) {
          return SizedBox(
              height: MediaQuery.of(context).size.height * 0.9,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(),
                        Text(
                          "Sort by",
                          style: TextStyle(
                              fontSize: 22.sp, fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(Icons.cancel_outlined))
                      ],
                    ),
                    const Divider(thickness: 1, color: Colors.black),
                    InkWell(
                        onTap: () {
                          bloc.add(SortByRecommended());
                          CardListBloc.get(context).add(SortByRecommended());
                        },
                        child: SortingItem(state.recommendations ?? false,
                            "Our recommendations")),
                    InkWell(
                        onTap: () {
                          bloc.add(SortByRatingAndRecommended());
                          CardListBloc.get(context)
                              .add(SortByRatingAndRecommended());
                        },
                        child: SortingItem(
                            state.sortByRatingAndRecommendations ?? false,
                            "Rating & Recommended")),
                    InkWell(
                        onTap: () {
                          bloc.add(SortByPriceAndRecommended());
                          CardListBloc.get(context)
                              .add(SortByPriceAndRecommended());
                        },
                        child: SortingItem(
                            state.sortByPriceAndRecommendations ?? false,
                            "Price & Recommended")),
                    InkWell(
                        onTap: () {
                          bloc.add(SortByDistanceAndRecommended());
                          CardListBloc.get(context)
                              .add(SortByDistanceAndRecommended());
                        },
                        child: SortingItem(
                            state.sortByDistanceAndRecommendations ?? false,
                            "Distance & Recommended")),
                    InkWell(
                        onTap: () {
                          bloc.add(SortByRating());
                          CardListBloc.get(context).add(SortByRating());
                        },
                        child: SortingItem(
                            state.sortByRating ?? false, "Rating Only")),
                    InkWell(
                        onTap: () {
                          bloc.add(SortByPrice());
                          CardListBloc.get(context).add(SortByPrice());
                        },
                        child: SortingItem(
                            state.sortByPrice ?? false, "Price Only")),
                    InkWell(
                        onTap: () {
                          bloc.add(SortByDistance());
                          CardListBloc.get(context).add(SortByDistance());
                        },
                        child: SortingItem(
                            state.sortByDistance ?? false, "Distance Only")),
                  ],
                ),
              ));
        },
      ),
    );
  }
}
