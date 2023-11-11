import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/CardsListModel.dart';

class CardItem extends StatelessWidget {
  final CardsListItem? cardsListItem;
  const CardItem(this.cardsListItem, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      elevation: 100,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.r),
                      topRight: Radius.circular(10.r)),
                  child: CachedNetworkImage(
                      height: 140.h,
                      width: 600.w,
                      fit: BoxFit.fill,
                      imageUrl: cardsListItem?.image ?? "",
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error_outline)),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                child: Row(children: [
                  RatingStars(
                    value: cardsListItem?.starts?.toDouble() ?? 0,
                    starCount: 5,
                    starSize: 14.sp,
                    maxValue: 5,
                    starSpacing: 1.w,
                    maxValueVisibility: true,
                    animationDuration: const Duration(milliseconds: 1000),
                    starOffColor: Colors.grey,
                    starColor: Colors.yellow,
                  ),
                  SizedBox(width: 10.w),
                  Text("Hotel", style: TextStyle(fontSize: 16.sp)),
                ]),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.w, top: 5.h, bottom: 5.h),
                child: Text(
                  cardsListItem?.name ?? "",
                  style:
                      TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 8.h),
                child: Row(children: [
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.green[800],
                          borderRadius: BorderRadius.circular(15.r)),
                      padding:
                          EdgeInsets.symmetric(vertical: 3.h, horizontal: 7.w),
                      child: Text(
                        cardsListItem?.reviewScore.toString() ?? "",
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                  SizedBox(width: 5.w),
                  Icon(Icons.location_pin, size: 16.sp),
                  SizedBox(width: 5.w),
                  Text(cardsListItem?.review ?? ""),
                  SizedBox(width: 5.w),
                  Text(cardsListItem?.address ?? ""),
                ]),
              ),
              Container(
                margin: EdgeInsets.all(10.w.h),
                height: 100.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(color: Colors.grey, width: 0.8)),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 8.w),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                padding: EdgeInsets.symmetric(vertical: 10.h),
                                child: const Text("Our lowest price")),
                            Row(
                              children: [
                                Text("\$",
                                    style: TextStyle(
                                        color: Colors.green[800],
                                        fontSize: 17.sp,
                                        fontWeight: FontWeight.bold)),
                                Text(cardsListItem?.price.toString() ?? "",
                                    style: TextStyle(
                                        color: Colors.green[800],
                                        fontSize: 21.sp,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            Text(
                              cardsListItem?.currency ?? "",
                              textAlign: TextAlign.start,
                            )
                          ]),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Text(
                          "View Deal",
                          style: TextStyle(
                              fontSize: 22.sp, fontWeight: FontWeight.bold),
                        ),
                        const Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 15.h, right: 15.w),
            child: Align(
                alignment: Alignment.topRight,
                child: Container(
                    padding: EdgeInsets.all(5.w.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.r),
                      color: Colors.black12,
                    ),
                    child: InkWell(
                      onTap: () {},
                      child: const Icon(Icons.favorite_outline_rounded,
                          color: Colors.white),
                    ))),
          )
        ],
      ),
    );
  }
}
