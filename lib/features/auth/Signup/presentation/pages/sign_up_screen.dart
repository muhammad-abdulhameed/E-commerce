import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_ecommerce/core/LocalStorage/prefs_helper.dart';
import 'package:my_ecommerce/core/Utils/DialogUtils.dart';
import 'package:my_ecommerce/core/di/DiSetup.dart';
import 'package:my_ecommerce/core/routes_manager/routes.dart';
import 'package:my_ecommerce/core/widget/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_ecommerce/features/auth/Signup/domain/use_cases/SignupUseCase.dart';
import 'package:my_ecommerce/features/auth/Signup/presentation/manager/signup_view_model_cubit.dart';

import '../../../../../core/resources/assets_manager.dart';
import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/styles_manager.dart';
import '../../../../../core/resources/values_manager.dart';
import '../../../../../core/widget/main_text_field.dart';
import '../../../../../core/widget/validators.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late  TextEditingController nameController;
  late  TextEditingController phoneController;
  late  TextEditingController mailController;
  late  TextEditingController passwordController;
  late GlobalKey<FormState> formKey;
  @override
  void initState() {
    super.initState();
formKey=GlobalKey<FormState>();
nameController=TextEditingController();
phoneController=TextEditingController();
mailController=TextEditingController();
passwordController=TextEditingController();
  }
  @override
  void dispose() {

    super.dispose();
    nameController.dispose();
    phoneController.dispose();
    mailController.dispose();
    passwordController.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<SignupViewModelCubit>(),
      child: Form(
        key: formKey,
        child: Scaffold(
          backgroundColor: ColorManager.primary,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.p20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: AppSize.s40.h,
                    ),
                    Center(child: SvgPicture.asset(SvgAssets.routeLogo)),
                    SizedBox(
                      height: AppSize.s40.h,
                    ),
                    BuildTextField(
                      backgroundColor: ColorManager.white,
                      hint: 'enter your full name',
                      label: 'Full Name',
                      textInputType: TextInputType.name,
                      validation: AppValidators.validateFullName,
                      controller: nameController,
                    ),
                    SizedBox(
                      height: AppSize.s18.h,
                    ),
                    BuildTextField(
                      hint: 'enter your mobile no.',
                      backgroundColor: ColorManager.white,
                      label: 'Mobile Number',
                      validation: AppValidators.validatePhoneNumber,
                      textInputType: TextInputType.phone,
                      controller: phoneController,
                    ),
                    SizedBox(
                      height: AppSize.s18.h,
                    ),
                    BuildTextField(
                      hint: 'enter your email address',
                      backgroundColor: ColorManager.white,
                      label: 'E-mail address',
                      validation: AppValidators.validateEmail,
                      textInputType: TextInputType.emailAddress,
                      controller: mailController,
                    ),
                    SizedBox(
                      height: AppSize.s18.h,
                    ),
                    BuildTextField(
                      hint: 'enter your password',
                      backgroundColor: ColorManager.white,
                      label: 'password',
                      validation: AppValidators.validatePassword,
                      isObscured: true,
                      textInputType: TextInputType.text,
                      controller: passwordController,
                    ),
                    SizedBox(
                      height: AppSize.s50.h,
                    ),
                    Center(
                      child: SizedBox(
                        height: AppSize.s60.h,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * .9,
                        child: BlocConsumer<SignupViewModelCubit, SignupViewModelState>(
                          listener: (context, state) {
                              if(state is SignupViewModelError){
                                Utils.showStateDialog(context, state.errorMessage);
                              }else if (state is SignupViewModelSuccess){
                                PrefsHelper.setToken(state.signupEntity.token!);
                                Navigator.popAndPushNamed(context,Routes.mainRoute);

                              }
                          },
                          builder: (context, state) {
                            return CustomElevatedButton(
                              // borderRadius: AppSize.s8,
                              label: 'Sign Up',
                              isLoading: state is SignupViewModelLoading ?true:false,
                              backgroundColor: ColorManager.white,
                              textStyle: getBoldStyle(
                                  color: ColorManager.primary,
                                  fontSize: AppSize.s20),
                              onTap: () {

                                 if(formKey.currentState!.validate()){
                                   context.read<SignupViewModelCubit>().signup(name: nameController.text,
                                       email: mailController.text,
                                       password: passwordController.text,
                                       rePassword: passwordController.text,
                                       phone: phoneController.text);
                                 }


                              },
                            );
                          }

                              ,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
