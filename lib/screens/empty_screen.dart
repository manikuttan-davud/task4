import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_four/utils/text_style.dart';

class EmptyScreen extends StatelessWidget {
  static const route = '/notifications_empty_screen';
  const EmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const CircleAvatar(),
          SizedBox(
            height: 29.h,
          ),
          const TextWidget(),
        ],
      ),
    );
  }
}

class TextWidget extends StatelessWidget {
  const TextWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 50.w),
          child: Text(
            '事務局からのお知らせがここに表示されます',
            style: tsS15C0xW500,
          ),
        ),
      ],
    );
  }
}

class CircleAvatar extends StatelessWidget {
  const CircleAvatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 65.w, top: 219.h),
      child: Stack(
        children: [
          SvgPicture.asset('assets/svg/Ellipse 9.svg'),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 36.w, vertical: 32.5.h),
            child: SvgPicture.asset('assets/svg/Vector.svg'),
          )
        ],
      ),
    );
  }
}
