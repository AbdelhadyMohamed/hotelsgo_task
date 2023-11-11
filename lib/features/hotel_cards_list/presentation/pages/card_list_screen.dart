import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotelsgo_task/core/api/api_manager.dart';
import 'package:hotelsgo_task/features/hotel_cards_list/data/data_sources/remote/remote_ds_impl.dart';
import 'package:hotelsgo_task/features/hotel_cards_list/data/repositories/cards_repo_impl.dart';
import 'package:hotelsgo_task/features/hotel_cards_list/presentation/bloc/card_list_bloc.dart';
import 'package:hotelsgo_task/features/hotel_cards_list/presentation/widgets/card_item.dart';
import '../../domain/use_cases/get_card_data_use_case.dart';
import '../widgets/filters_bottom_sheet.dart';
import '../widgets/sort_bottom_sheet.dart';

class CardListScreen extends StatefulWidget {
  const CardListScreen({super.key});

  @override
  State<CardListScreen> createState() => _CardListScreenState();
}

class _CardListScreenState extends State<CardListScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> opacityAnimation;
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    opacityAnimation = CurvedAnimation(
        parent: Tween<double>(begin: 1, end: 0).animate(_controller),
        curve: Curves.easeInOutExpo);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CardListBloc(
          GetCardDataUseCase(CardRepoImpl(RemoteDSImpl(ApiManager()))))
        ..add(GetCardsEvent()),
      child: BlocBuilder<CardListBloc, CardListState>(
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                elevation: 10,
                backgroundColor: Colors.white,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        showFiltersBottomSheet(context);
                      },
                      child: Row(
                        children: [
                          const Icon(Icons.filter, color: Colors.black),
                          SizedBox(width: 10.w),
                          const Text("Filters",
                              style: TextStyle(color: Colors.blueAccent))
                        ],
                      ),
                    ),
                    SizedBox(width: 100.w),
                    InkWell(
                      onTap: () {
                        showSortBottomSheet(
                            context, BlocProvider.of<CardListBloc>(context));
                      },
                      child: Row(
                        children: [
                          const Icon(Icons.sort, color: Colors.black),
                          SizedBox(width: 10.w),
                          const Text("Sort",
                              style: TextStyle(color: Colors.blueAccent))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              body: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
                itemCount: state.cardsModel?.cardsList?.length ?? 5,
                itemBuilder: (BuildContext context, int index) {
                  return CardItem(state.cardsModel?.cardsList?[index]);
                },
              ));
        },
      ),
    );
  }

  Future showSortBottomSheet(BuildContext context, CardListBloc bloc) {
    return showModalBottomSheet(
        transitionAnimationController: _controller,
        context: context,
        builder: (context) {
          return Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: SortBottomSheet(bloc));
        },
        isScrollControlled: true);
  }

  Future showFiltersBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: const FiltersBottomSheet());
        },
        isScrollControlled: true);
  }
}
