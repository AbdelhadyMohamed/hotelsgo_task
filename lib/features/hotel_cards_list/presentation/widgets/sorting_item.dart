import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SortingItem extends StatelessWidget {
  final String sortingText;
  final bool selected;
  const SortingItem(this.selected, this.sortingText, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 15.h),
          child: Row(
            children: [
              Text(
                sortingText,
                style: TextStyle(fontSize: 22.sp),
              ),
              const Spacer(),
              selected
                  ? Icon(Icons.done, color: Colors.blue[700])
                  : const SizedBox(),
            ],
          ),
        ),
        const Divider(thickness: 0.7, color: Colors.grey),
      ],
    );
  }
}
