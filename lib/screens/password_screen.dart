import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_four/utils/colors.dart';
import 'package:task_four/utils/text_style.dart';

class PasswordScreen extends StatefulWidget {
  static const route = '/password_screen';
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  bool isButtonActive=false;
   final controller=TextEditingController();
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
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorFFFFFF,
        leading: const Icon(Icons.arrow_back_ios,color: color45303030),
      ),
      body: Column(
        children: [
          //password text
          const PasswordText(),
          const GreyColorPasswordText(),
          //text formfield for password
           PasswordTextFormField(controller: controller),
          //forgotten password widget
         const ForgottenPassword(),
          Padding(
           padding: EdgeInsets.only(top: 22.h),
           child: SizedBox(
            width: 320.w,
            //TODO:can't convert to widget
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

class ForgottenPassword extends StatelessWidget {
  const ForgottenPassword({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: 8.h,left: 104.w),
      child: Text('for those who have forgotten their password',style:tsS12C0x44W400 ,),
    );
  }
}

class GreyColorPasswordText extends StatelessWidget {
  const GreyColorPasswordText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: 71.h,right: 262.w),
      child: Text('Password',style:tsS12C0x45W400 ,),
    );
  }
}

class PasswordText extends StatelessWidget {
  const PasswordText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(top: 121.h,right: 260.w),
      child: Text('Password',style: tsS18CFFW700,),
    );
  }
}

class PasswordTextFormField extends StatelessWidget {
  const PasswordTextFormField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
    padding:  EdgeInsets.only(left: 24.w,top: 4.h,right: 24.w),
    child: TextFormField(
     controller: controller,
     decoration: InputDecoration(
     border: OutlineInputBorder(
       borderRadius: BorderRadius.circular(9.r)
       
     ),
     suffixIcon: const Icon(Icons.remove_red_eye,color:colorFF303030 ,)
     ),
     
     ),
         );
  }
}
