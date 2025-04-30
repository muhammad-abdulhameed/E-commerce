import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:my_ecommerce/features/auth/Signup/domain/entities/AuthEntity.dart';

import '../../domain/use_cases/signIn_use_case.dart';

part 'sign_in_view_model_state.dart';
@injectable
class SignInViewModelCubit extends Cubit<SignInViewModelState> {
  SignInUseCase signInUseCase;
  SignInViewModelCubit(this.signInUseCase) : super(SignInViewModelInitial());
  signIn({required String mail,required String password})async{
    emit(SignInViewModelLoadingState());
    var result=await signInUseCase.call(mail, password);
     result.fold((error) =>emit(SignInViewModelErrorState(error)) , (entity) => emit(SignInViewModelSuccessState(entity)));

  }
}
