import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_four/utils/text_style.dart';

class PracticeScreen extends StatefulWidget {
   static const route = '/practice_screen';
  const PracticeScreen({super.key});

  @override
  State<PracticeScreen> createState() => _PracticeScreenState();
}

class _PracticeScreenState extends State<PracticeScreen> {
   bool isButtonActive=false;
  final controller=TextEditingController();

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
      body: Form(
        
        child: Column(
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
            keyboardType: TextInputType.phone,
            onChanged: ((value) {
              _formKey.currentState?.validate();
            }),
            //TODO:error meesage
            validator: ((  value) {
              if(value ==null ||value.length!=11 ){
               
                return "enter correct number";
              }else{
                return null;
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

      ),
    );
  }
}