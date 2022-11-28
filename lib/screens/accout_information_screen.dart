import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_four/utils/colors.dart';
import 'package:task_four/utils/text_style.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(65),
        child: SecondAppBar(),
      ),
      body: Column(
        children: [
          const TopText(),
          SizedBox(height: 21.h,),
          const ImageWidget(),
          SizedBox(height: 20.h,),
          const RepeatingText(text: 'いつも Kiaigo Service をご利用いただきありがとうございます。',),
           SizedBox(height: 15.h,),
          const RepeatingText(text: '当サービスではこれまで、この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。'),
           SizedBox(height: 15.h,),
         // const RepeatingText(text: 'この文章はダミーです。'),
          // SizedBox(height: 5.h,),
          const RepeatingText(text: 'この文章はダミーです。'
          '文字の大きさ、量、字間、行間等を確認するために入れています。この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。'),
           SizedBox(height:15.h ,),
          const RepeatingText(text: 'この文章はダミーです。文字の大きさ、量、字間、行間等を確認するために入れています。')

        ],
      ),
    );
  }
}

class TopText extends StatelessWidget {
  const TopText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(right: 48.w , top: 32.h),
      child: Text('【事務局】キャンセルポリシー変更に関して',style:tsS16C0xW700 ,),
    );
  }
}

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 24.w),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.r),
          image:const DecorationImage(image: AssetImage('assets/images/image.png.png',),
          fit: BoxFit.cover
          )
        ),
        width: 327.w,
        height: 182.h,
      ),
    );
  }
}

class SecondAppBar extends StatelessWidget {
  const SecondAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shadowColor:color1088A0BB ,
      backgroundColor: colorFFFFFF ,
      leading: const BackButton(),
      title: const AppBarText(),
      centerTitle: true,
    );
  }
}

class AppBarText extends StatelessWidget {
  const AppBarText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: 30.h),
      child: Text('2022年 7月 23日',style:tsS14C0xW700 ,),
    );
  }
}

class BackButton extends StatelessWidget {
  const BackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pop(context),
      child: Padding(
        padding:  EdgeInsets.only(top: 30.h),
        child: const Icon(Icons.arrow_back_ios,color: color45303030,),
      ));
  }
}

class RepeatingText extends StatelessWidget {
  final String text;
  const RepeatingText({
    Key? key, required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 24.w),
      child: Text(text,style:tsS15CFFW500 ,),
    );
  }
}
