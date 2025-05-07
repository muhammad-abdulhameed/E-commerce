import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_ecommerce/core/resources/assets_manager.dart';
import 'package:my_ecommerce/core/resources/values_manager.dart';
import 'package:my_ecommerce/core/widget/custom_elevated_button.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(children: [
      Image.asset(ImageAssets.resetPassword,),
          SizedBox(
            height:  AppSize.s60.h,
          ),
          CustomElevatedButton(label: "Send Verification to Mail",isStadiumBorder: true, onTap: (){

          })

        ],),
      ),
    );
  }
}
