import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dehancer_slider/dehancer_slider.dart';

class FiltersBottomSheet extends StatelessWidget {
  const FiltersBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  const Text("Reset",
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.grey,
                        decoration: TextDecoration.underline,
                      )),
                  const Spacer(),
                  const Text("Filters", style: TextStyle(fontSize: 22)),
                  const Spacer(),
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.cancel_outlined))
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
            margin: EdgeInsets.only(left: 50),
            width: 300.w,
            child: DehancerSlider(
              minValue: 0,
              maxValue: 100,
              defaultValue: 100,
              startValue: 0,
              value: 0,
            ),
          ),
          SizedBox(height: 30.h),
          Row(
            children: [
              SizedBox(width: 50.w),
              Text(
                "\$20",
                style: TextStyle(fontSize: 18),
              ),
              Spacer(),
              Text(
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
                      color: Colors.red,
                      border: Border.all(color: Colors.red)),
                  child: Padding(
                    padding: EdgeInsets.all(8.0.w.h),
                    child: Text("0+",
                        style: TextStyle(fontSize: 20.sp, color: Colors.white)),
                  ),
                ),
                SizedBox(width: 30.w),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                      color: Colors.orange,
                      border: Border.all(color: Colors.orange)),
                  child: Padding(
                    padding: EdgeInsets.all(8.0.w.h),
                    child: Text("7+",
                        style: TextStyle(fontSize: 20.sp, color: Colors.white)),
                  ),
                ),
                SizedBox(width: 30.w),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                      color: Colors.green[500],
                      border: Border.all(
                          color: Colors.green[500] ?? Colors.greenAccent)),
                  child: Padding(
                    padding: EdgeInsets.all(8.0.w.h),
                    child: Text("7.5+",
                        style: TextStyle(fontSize: 18.sp, color: Colors.white)),
                  ),
                ),
                SizedBox(width: 30.w),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                      color: Colors.green[700],
                      border: Border.all(
                          color: Colors.green[700] ?? Colors.greenAccent)),
                  child: Padding(
                    padding: EdgeInsets.all(8.0.w.h),
                    child: Text("8+",
                        style: TextStyle(fontSize: 20.sp, color: Colors.white)),
                  ),
                ),
                SizedBox(width: 30.w),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                      color: Colors.green[900],
                      border: Border.all(
                          color: Colors.green[900] ?? Colors.greenAccent)),
                  child: Padding(
                    padding: EdgeInsets.all(8.0.w.h),
                    child: Text("8.5+",
                        style: TextStyle(fontSize: 19.sp, color: Colors.white)),
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
                Container(
                    height: 60.h,
                    padding: EdgeInsets.all(5.w.h),
                    decoration: BoxDecoration(
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
                SizedBox(width: 25.w),
                Container(
                    height: 60.h,
                    padding: EdgeInsets.all(5.w.h),
                    decoration: BoxDecoration(
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
                SizedBox(width: 25.w),
                Container(
                    height: 60.h,
                    padding: EdgeInsets.all(5.w.h),
                    decoration: BoxDecoration(
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
                SizedBox(width: 25.w),
                Container(
                    height: 60.h,
                    padding: EdgeInsets.all(5.w.h),
                    decoration: BoxDecoration(
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
                SizedBox(width: 20.w),
                Container(
                    height: 60.h,
                    padding: EdgeInsets.all(5.w.h),
                    decoration: BoxDecoration(
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
                Divider(thickness: 2),
              ],
            ),
          ),
          SizedBox(height: 15.h),
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: Column(
              children: [
                const Row(
                  children: [
                    Text(
                      "Location",
                      style: TextStyle(fontSize: 22),
                    ),
                    Spacer(),
                    Text(
                      "City Center   >  ",
                      style: TextStyle(fontSize: 22),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Divider(thickness: 2),
              ],
            ),
          ),
          Center(
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
        ],
      ),
    );
  }
}
