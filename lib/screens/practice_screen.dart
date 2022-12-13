import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_four/screens/password_screen.dart';
import 'package:task_four/utils/colors.dart';
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
      isButtonActive=controller.text.length==11;
      setState(() {
       isButtonActive=isButtonActive;
        
      });
     });
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
        children: [
          //first text in the screen
          const RegistrationText(),
          //hint text 
          const HintText(),
          //text field for phone number
         PhoneNumberTextField(controller: controller, formKey: _formKey),
         //its a warning text 
         const WarningText(),
         Padding(
           padding: EdgeInsets.only(top: 59.h),
           child: SizedBox(
            width: 327.w,
            height: 55.h,
            //TODO:Cant covert to custom widget
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28.r)
                ),
                backgroundColor: colorFFFAAA14,
                //disabledBackgroundColor: 
              ),
              onPressed:isButtonActive? (() {
                setState(() {
                  isButtonActive=false;
                  controller.clear();
                   Get.to(() => const PasswordScreen());
                });
              }):null, child: Text('Go to the next',style:tsS16CFFW500))
           ),
         )
        ],
      ),

      ),
    );
  }
}

class RegistrationText extends StatelessWidget {
  const RegistrationText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: 201.h,right: 63.w),
      child: Text('New account registration / login',style: tsS18CFFW700,),
    );
  }
}

class HintText extends StatelessWidget {
  const HintText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: 83.h,right: 65),
      child: Text('please enter your phone number',style:tsS16CFFW400 ,),
    );
  }
}

class WarningText extends StatelessWidget {
  const WarningText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 24.w,top: 4.h),
     child: SizedBox(
       width:800.w ,
       child: Text('・ Enter without hyphens',style: tsS11CFFW400 ,)),
    );
  }
}

class PhoneNumberTextField extends StatelessWidget {
  const PhoneNumberTextField({
    Key? key,
    required this.controller,
    required GlobalKey<FormState> formKey,
  }) : _formKey = formKey, super(key: key);

  final TextEditingController controller;
  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 24.w,top: 4.h,right: 24.w),
      child: TextFormField(
       controller: controller,
       keyboardType: TextInputType.phone,
       onChanged: ((value) {
         _formKey.currentState?.validate();
       }),
      
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
    );
  }
}