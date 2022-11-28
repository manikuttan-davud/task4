
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_four/utils/colors.dart';
import 'package:task_four/utils/text_style.dart';

class CommonAppBar extends StatelessWidget {
  const CommonAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      
      shadowColor:color1088A0BB ,
      backgroundColor:colorFFFFFF ,
      leading: Padding(
        padding:  EdgeInsets.only(top: 30.h),
        child: SizedBox(
          width:16.w ,
          height: 16.h,
          child: const Icon(Icons.close,
          color:colorFFA2A2A2 ,
          )),
      ),
      title: Padding(
        padding:  EdgeInsets.only(top: 30.h),
        child: Text('お知らせ',style:tsS14C0xW700 ,),
      ),
      centerTitle: true,
      actions: [
          Padding(
            padding:  EdgeInsets.only(top: 30.h,right: 15),
            child: Text('クリア',style:tsS16C0xW500 ,),
          )
      ],
    );
  }
}