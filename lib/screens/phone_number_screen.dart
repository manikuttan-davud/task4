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
  bool isButtonActive = false;
  final controller = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    //TODO: INIT STATE?
    controller.addListener(() {
      isButtonActive = controller.text.isNotEmpty;
      setState(() {
        isButtonActive = isButtonActive;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 201.h, right: 60.w),
            child: Text(
              'New account registration / login',
              style: tsS18CFFW700,
            ),
          ),
          Padding(
            //TODO CORRECT THE LABEL STYLING
            padding: EdgeInsets.only(top: 83.h, right: 88.w),
            child: Text(
              'please enter your phone number',
              style: tsS16CFFW400,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 24.w, top: 4.h, right: 24.w),
            child: TextFormField(
              controller: controller,
              validator: ((value) {
                //TODO: ONLY VALIDATE IF LENGTH IS 11
                //TODO: ONLY ALLOW NUMBERS TO BE TYPED
                //TODO: ONLY ALLOW 11 DIGITS TO BE TYPED.
                //TODO; AUTOMATICALLY MOVE FROM THE TEXTFIELD WHEN 11 NUMBERS ARE ENTERED
                if (value == null) {}
              }),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(9.r))),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 24.w, top: 4.h),
            child: SizedBox(
                //TODO; WIDTH?
                // width: 800,
                child: Text(
              '・ Enter without hyphens',
              style: tsS11CFFW400,
            )),
          ),
          Padding(
            padding: EdgeInsets.only(top: 59.h),
            child: SizedBox(
                //TODO: CHECK BUTTON DIMENTIONS
                width: 320.w,
                child: ElevatedButton(
                    //TODO: CHANGE ACTIVE BORDER COLOR NAD CURSOR COLOR TO YELLOW.
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28.r)),
                      backgroundColor: Colors.orange,
                    ),
                    onPressed: isButtonActive
                        ? (() {
                            //TODO: USE GETX FOR STATE MANAGEMENT HERE
                            //TODO: CONVERT INTO NAMED FUNCTIONS
                            //TODO: SHOW VALIDATION ERRORS. DONOT CLEAR THE DATA FROM TEXTFIELD.
                            //TODO: ONLY ALLOW BUTTON TO BE PRESSED WHEN PROPER 11 NUMBERED PHONE NUMBER IS ENTERED.
                            setState(() {
                              isButtonActive = false;
                              controller.clear();
                            });
                          })
                        : null,
                    child: Text('Login', style: tsS16CFFW500))),
          )
        ],
      ),
    );
  }
}
