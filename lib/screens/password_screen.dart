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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isButtonActive=false;
   final controller=TextEditingController();
   @override
  void initState() {
    
    super.initState();
    controller.addListener(() {
     isButtonActive=controller.text.length==8;
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
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            //password text
            const PasswordText(),
            const GreyColorPasswordText(),
            //text formfield for password
             PasswordTextFormField(controller: controller, formKey: _formKey,),
            //forgotten password widget
           const ForgottenPassword(),
            Padding(
             padding: EdgeInsets.only(top: 22.h),
             child: SizedBox(
              width: 320.w,
              
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28.r)
                  ),
                  backgroundColor:colorFFFAAA14,
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
    required GlobalKey<FormState> formKey,
  }) :_formKey = formKey, super(key: key);

  final TextEditingController controller;
 final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
    padding:  EdgeInsets.only(left: 24.w,top: 4.h,right: 24.w),
    child: TextFormField(
     controller: controller,
      onChanged: (value) {
        _formKey.currentState?.validate();
      },
     validator: ( (String?  value) {
       RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
        if(value!.isEmpty){
            return "please enter password";
        }else if(!regex.hasMatch(value)){
          
            return "enter a valid password";
          }else{
            return null;
          }
        }

    ),
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
