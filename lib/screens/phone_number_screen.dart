import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_four/utils/text_style.dart';

class PhoneNumber extends StatefulWidget {
  static const route = '/phone_screen';
   const PhoneNumber({super.key});

  @override
  State<PhoneNumber> createState() => _PhoneNumberState();
}

class _PhoneNumberState extends State<PhoneNumber> {
  bool isButtonActive=false;
  final controller=TextEditingController();

final _formKey = GlobalKey<FormState>();
@override
  void initState() {
    
    super.initState();
     controller.addListener(() {
      isButtonActive=controller.text.isNotEmpty;
      setState(() {
       isButtonActive=isButtonActive;
        
      });
     });
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding:  EdgeInsets.only(top: 201.h,right: 60.w),
            child: Text('New account registration / login',style: tsS18CFFW700,),
          ),
          Padding(
            padding:  EdgeInsets.only(top: 83.h,right: 88.w),
            child: Text('please enter your phone number',style:tsS16CFFW400 ,),
          ),
         Padding(
           padding:  EdgeInsets.only(left: 24.w,top: 4.h,right: 24.w),
           child: TextFormField(
            controller: controller,
            validator: ((value) {
              if(value==null){
                
              }
            }),
            decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(9.r)
            )
            ),),
         ),
         Padding(
           padding:  EdgeInsets.only(left: 24.w,top: 4.h),
           child: SizedBox(
            width:800 ,
            child: Text('・ Enter without hyphens',style: tsS11CFFW400 ,)),
         ),
         Padding(
           padding: EdgeInsets.only(top: 59.h),
           child: SizedBox(
            width: 320.w,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28.r)
                ),
                backgroundColor: Colors.orange,
              ),
              onPressed:isButtonActive? (() {
                setState(() {
                  isButtonActive=false;
                  controller.clear();
                });
              }):null, child: Text('Login',style:tsS16CFFW500))
           ),
         )
        ],
      ),
    );
  }
}