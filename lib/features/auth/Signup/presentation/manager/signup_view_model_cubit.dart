import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:my_ecommerce/features/auth/Signup/domain/entities/AuthEntity.dart';

import '../../domain/use_cases/SignupUseCase.dart';

part 'signup_view_model_state.dart';
@injectable
class SignupViewModelCubit extends Cubit<SignupViewModelState> {
  SignupUseCase signupUseCase;
  SignupViewModelCubit(this.signupUseCase) : super(SignupViewModelInitial());
  signup({required name,required email, required password,required rePassword,required phone})async{
    emit(SignupViewModelLoading());
   var result= await signupUseCase.call(name: name, email: email, password: password, rePassword: rePassword, phone: phone);
  result.fold((error) {
  emit(SignupViewModelError(error));
}, (signupEntity) {
   emit(SignupViewModelSuccess(signupEntity));
 });
  }
}
