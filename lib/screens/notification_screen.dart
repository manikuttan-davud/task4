import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_four/screens/accout_information_screen.dart';
import 'package:task_four/utils/colors.dart';
import 'package:task_four/utils/text_style.dart';

import '../widget/common_appbar.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65),
        child: CommonAppBar(),
        
    ),
    body:ListDetails()
    );
  }
}

class ListDetails extends StatelessWidget {
  const ListDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder:((context, index) {
        return InkWell(
          onTap: (() =>  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const AccountScreen()),
  )),
          child: const OneTile(),
        );
      }),
       separatorBuilder: ((context, index) {
         return const Divider(height: 5,color:  colorFFBABABA,);
       }),
        itemCount: 10);
  }
}

class OneTile extends StatelessWidget {
  const OneTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Padding(
        padding:  EdgeInsets.only(left: 20.w),
        child: Text('よくある質問に項目を追加しました',style: tsS14C0xW700,),
      ),
      subtitle: Padding(
        padding:  EdgeInsets.only(left: 20.w),
        child: Text('2022年 7月23日',style: tsS12C0xW400 ,),
      ),
    );
  }
}