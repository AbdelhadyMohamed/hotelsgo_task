import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dehancer_slider/dehancer_slider.dart';

import '../../../../core/api/api_manager.dart';
import '../../data/data_sources/remote/remote_ds_impl.dart';
import '../../data/repositories/cards_repo_impl.dart';
import '../../domain/use_cases/get_card_data_use_case.dart';
import '../bloc/card_list_bloc.dart';

enum Rating { zero, seven, sevenHalf, eight, eightHalf }

enum Stars { one, two, three, four, five }

class FiltersBottomSheet extends StatefulWidget {
  final CardListBloc bloc;

  const FiltersBottomSheet(this.bloc, {super.key});

  @override
  State<FiltersBottomSheet> createState() => _FiltersBottomSheetState();
}

class _FiltersBottomSheetState extends State<FiltersBottomSheet> {
  Rating? ratingStatus;
  Stars? starsStatus;
  double? pricePerNight;

  double? rating;

  double? stars;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.9,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            color: Colors.white,
            elevation: 3,
            child: Padding(
              padding: EdgeInsets.all(18.w.h),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      widget.bloc.add(GetCardsEvent());
                    },
                    child: const Text("Reset",
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.grey,
                          decoration: TextDecoration.underline,
                        )),
                  ),
                  const Spacer(),
                  const Text("Filters", style: TextStyle(fontSize: 22)),
                  const Spacer(),
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.cancel_outlined))
                ],
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Padding(
            padding: const EdgeInsets.all(18),
            child: Row(
              children: [
                const Text(
                  "PRICE PER NIGHT",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey)),
                  child: const Text(
                    "540+ \$",
                    style: TextStyle(fontSize: 19),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 20.h,
            margin: const EdgeInsets.only(left: 50),
            width: 300.w,
            child: DehancerSlider(
              onValueChanged: (value) {
                pricePerNight = value;
              },
              trackBarTouchAreaSize: 20,
              minValue: 20,
              maxValue: 540,
              defaultValue: 20,
              startValue: 20,
              value: 20,
            ),
          ),
          SizedBox(height: 30.h),
          Row(
            children: [
              SizedBox(width: 50.w),
              const Text(
                "\$20",
                style: TextStyle(fontSize: 18),
              ),
              const Spacer(),
              const Text(
                "\$540+",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(width: 40.w),
            ],
          ),
          SizedBox(height: 30.h),
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: const Text(
              "Rating",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.w.h),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.r),
                    color:
                        ratingStatus == Rating.zero ? Colors.blue : Colors.red,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.0.w.h),
                    child: InkWell(
                      onTap: () {
                        rating = 0;
                        ratingStatus = Rating.zero;
                        setState(() {});
                      },
                      child: Text("0+",
                          style:
                              TextStyle(fontSize: 20.sp, color: Colors.white)),
                    ),
                  ),
                ),
                SizedBox(width: 30.w),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.r),
                    color: ratingStatus == Rating.seven
                        ? Colors.blue
                        : Colors.orange,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.0.w.h),
                    child: InkWell(
                      onTap: () {
                        rating = 7;
                        ratingStatus = Rating.seven;
                        setState(() {});
                      },
                      child: Text("7+",
                          style:
                              TextStyle(fontSize: 20.sp, color: Colors.white)),
                    ),
                  ),
                ),
                SizedBox(width: 30.w),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.r),
                    color: ratingStatus == Rating.sevenHalf
                        ? Colors.blue
                        : Colors.green[500],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.0.w.h),
                    child: InkWell(
                      onTap: () {
                        rating = 7.5;
                        ratingStatus = Rating.sevenHalf;
                        setState(() {});
                      },
                      child: Text("7.5+",
                          style:
                              TextStyle(fontSize: 18.sp, color: Colors.white)),
                    ),
                  ),
                ),
                SizedBox(width: 30.w),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.r),
                    color: ratingStatus == Rating.eight
                        ? Colors.blue
                        : Colors.green[700],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.0.w.h),
                    child: InkWell(
                      onTap: () {
                        rating = 8;
                        ratingStatus = Rating.eight;
                        setState(() {});
                      },
                      child: Text("8+",
                          style:
                              TextStyle(fontSize: 20.sp, color: Colors.white)),
                    ),
                  ),
                ),
                SizedBox(width: 30.w),
                Container(
                  height: 45.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.r),
                    color: ratingStatus == Rating.eightHalf
                        ? Colors.blue
                        : Colors.green[900],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.0.w.h),
                    child: InkWell(
                      onTap: () {
                        rating = 8.5;
                        ratingStatus = Rating.eightHalf;
                        setState(() {});
                      },
                      child: Text("8.5+",
                          style:
                              TextStyle(fontSize: 19.sp, color: Colors.white)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30.h),
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: const Text(
              "Hotel Class",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 25.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    stars = 1;
                    starsStatus = Stars.one;
                    setState(() {});
                  },
                  child: Container(
                      height: 60.h,
                      padding: EdgeInsets.all(5.w.h),
                      decoration: BoxDecoration(
                          color: starsStatus == Stars.one
                              ? Colors.blue
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(3.r),
                          border: Border.all(color: Colors.amberAccent)),
                      child: Row(
                        children: [
                          Icon(Icons.star_half_outlined,
                              color: Colors.amberAccent, size: 20.sp),
                          Icon(Icons.star,
                              color: Colors.amberAccent, size: 20.sp),
                        ],
                      )),
                ),
                SizedBox(width: 25.w),
                InkWell(
                  onTap: () {
                    stars = 2;
                    starsStatus = Stars.two;
                    setState(() {});
                  },
                  child: Container(
                      height: 60.h,
                      padding: EdgeInsets.all(5.w.h),
                      decoration: BoxDecoration(
                          color: starsStatus == Stars.two
                              ? Colors.blue
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(3.r),
                          border: Border.all(color: Colors.amberAccent)),
                      child: Row(
                        children: [
                          Icon(Icons.star,
                              color: Colors.amberAccent, size: 20.sp),
                          Icon(Icons.star,
                              color: Colors.amberAccent, size: 20.sp),
                        ],
                      )),
                ),
                SizedBox(width: 25.w),
                InkWell(
                  onTap: () {
                    stars = 3;
                    starsStatus = Stars.three;
                    setState(() {});
                  },
                  child: Container(
                      height: 60.h,
                      padding: EdgeInsets.all(5.w.h),
                      decoration: BoxDecoration(
                          color: starsStatus == Stars.three
                              ? Colors.blue
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(3.r),
                          border: Border.all(color: Colors.amberAccent)),
                      child: Column(
                        children: [
                          Icon(Icons.star,
                              color: Colors.amberAccent, size: 19.sp),
                          Row(
                            children: [
                              Icon(Icons.star,
                                  color: Colors.amberAccent, size: 19.sp),
                              Icon(Icons.star,
                                  color: Colors.amberAccent, size: 19.sp),
                            ],
                          ),
                        ],
                      )),
                ),
                SizedBox(width: 25.w),
                InkWell(
                  onTap: () {
                    stars = 4;
                    starsStatus = Stars.four;
                    setState(() {});
                  },
                  child: Container(
                      height: 60.h,
                      padding: EdgeInsets.all(5.w.h),
                      decoration: BoxDecoration(
                          color: starsStatus == Stars.four
                              ? Colors.blue
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(3.r),
                          border: Border.all(color: Colors.amberAccent)),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.star,
                                  color: Colors.amberAccent, size: 19.sp),
                              Icon(Icons.star,
                                  color: Colors.amberAccent, size: 19.sp),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.star,
                                  color: Colors.amberAccent, size: 19.sp),
                              Icon(Icons.star,
                                  color: Colors.amberAccent, size: 19.sp),
                            ],
                          ),
                        ],
                      )),
                ),
                SizedBox(width: 20.w),
                InkWell(
                  onTap: () {
                    stars = 5;
                    starsStatus = Stars.five;
                    setState(() {});
                  },
                  child: Container(
                      height: 60.h,
                      padding:
                          EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
                      decoration: BoxDecoration(
                          color: starsStatus == Stars.five
                              ? Colors.blue
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(3.r),
                          border: Border.all(color: Colors.amberAccent)),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.star,
                                  color: Colors.amberAccent, size: 14.sp),
                              Icon(Icons.star,
                                  color: Colors.amberAccent, size: 14.sp),
                            ],
                          ),
                          Icon(Icons.star,
                              color: Colors.amberAccent, size: 14.sp),
                          Row(
                            children: [
                              Icon(Icons.star,
                                  color: Colors.amberAccent, size: 14.sp),
                              Icon(Icons.star,
                                  color: Colors.amberAccent, size: 14.sp),
                            ],
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
          SizedBox(height: 25.h),
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: Column(
              children: [
                const Text(
                  "DISTANCE FROM",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10.h),
                const Divider(thickness: 2),
              ],
            ),
          ),
          SizedBox(height: 15.h),
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: Column(
              children: [
                Row(
                  children: [
                    const Text(
                      "Location",
                      style: TextStyle(fontSize: 22),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        const Text(
                          "City Center",
                          style: TextStyle(fontSize: 22),
                        ),
                        SizedBox(width: 10.w),
                        const Icon(Icons.arrow_forward_ios_rounded)
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                const Divider(thickness: 2),
              ],
            ),
          ),
          Center(
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
                widget.bloc.add(
                    FilterEvent(stars ?? 0, pricePerNight ?? 0, rating ?? 0));
              },
              child: Card(
                color: Colors.blue[700],
                elevation: 50,
                child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 20.h, horizontal: 120.w),
                    child: const Text(
                      "Show results",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
