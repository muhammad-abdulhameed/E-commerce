import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:my_ecommerce/core/LocalStorage/prefs_helper.dart';
import 'package:my_ecommerce/core/di/DiSetup.dart';
import 'package:my_ecommerce/core/resources/assets_manager.dart';
import 'package:my_ecommerce/core/resources/color_manager.dart';
import 'package:my_ecommerce/core/resources/values_manager.dart';
import 'package:my_ecommerce/core/routes_manager/routes.dart';
import 'package:my_ecommerce/core/widget/custom_elevated_button.dart';
import 'package:my_ecommerce/core/widget/main_text_field.dart';
import 'package:my_ecommerce/core/widget/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_ecommerce/features/auth/SignIn/presentation/manager/sign_in_view_model_cubit.dart';

import '../../../../../core/Utils/DialogUtils.dart';
import '../../../../../core/resources/font_manager.dart';
import '../../../../../core/resources/styles_manager.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late TextEditingController mailController;
  late TextEditingController passwordController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    mailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    mailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<SignInViewModelCubit>(),
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
                    Text(
                      'Welcome Back To Route',
                      style: getBoldStyle(color: ColorManager.white)
                          .copyWith(fontSize: FontSize.s24.sp),
                    ),
                    Text(
                      'Please sign in with your mail',
                      style: getLightStyle(color: ColorManager.white)
                          .copyWith(fontSize: FontSize.s16.sp),
                    ),
                    SizedBox(
                      height: AppSize.s50.h,
                    ),
                    BuildTextField(
                      backgroundColor: ColorManager.white,
                      hint: 'enter your mail',
                      label: 'Your Email',
                      textInputType: TextInputType.emailAddress,
                      validation: AppValidators.validateEmail,
                      controller: mailController,
                    ),
                    SizedBox(
                      height: AppSize.s28.h,
                    ),
                    BuildTextField(
                      hint: 'enter your password',
                      backgroundColor: ColorManager.white,
                      label: 'Password',
                      validation: AppValidators.validatePassword,
                      isObscured: true,
                      textInputType: TextInputType.text,
                      controller: passwordController,
                    ),
                    SizedBox(
                      height: AppSize.s8.h,
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        GestureDetector(
                            onTap: () {},
                            child: Text(
                              'Forget password?',
                              style: getMediumStyle(color: ColorManager.white)
                                  .copyWith(fontSize: FontSize.s18.sp),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: AppSize.s60.h,
                    ),
                    Center(
                      child: SizedBox(
                        // width: MediaQuery.of(context).size.width * .8,
                        child: BlocConsumer<SignInViewModelCubit,
                            SignInViewModelState>(
                          listener: (context, state) {
                            if (state is SignInViewModelErrorState) {
                              Utils.showStateDialog(context, state.message);
                            } else if (state is SignInViewModelSuccessState) {
                              PrefsHelper.setToken(state.authEntity.token!);
                              Navigator.pushNamedAndRemoveUntil(
                                  context, Routes.mainRoute, (route) => false);
                            }
                          },
                          builder: (context, state) {
                            return CustomElevatedButton(
                              // borderRadius: AppSize.s8,
                              isStadiumBorder: false,
                              label: 'Login',
                              backgroundColor: ColorManager.white,
                              isLoading: state is SignInViewModelLoadingState
                                  ? true
                                  : false,
                              textStyle: getBoldStyle(
                                  color: ColorManager.primary,
                                  fontSize: AppSize.s18),
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  context.read<SignInViewModelCubit>().signIn(
                                      mail: mailController.text,
                                      password: passwordController.text);
                                }
                              },
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don’t have an account?',
                          style: getSemiBoldStyle(color: ColorManager.white)
                              .copyWith(fontSize: FontSize.s16.sp),
                        ),
                        SizedBox(
                          width: AppSize.s8.w,
                        ),
                        GestureDetector(
                          onTap: () =>
                              Navigator.pushNamed(context, Routes.signUpRoute),
                          child: Text(
                            'Create Account',
                            style: getSemiBoldStyle(color: ColorManager.white)
                                .copyWith(fontSize: FontSize.s16.sp),
                          ),
                        ),
                      ],
                    )
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
