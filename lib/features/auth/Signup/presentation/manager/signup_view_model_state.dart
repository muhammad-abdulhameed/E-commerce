part of 'signup_view_model_cubit.dart';


sealed class SignupViewModelState {}

final class SignupViewModelInitial extends SignupViewModelState {}
final class SignupViewModelLoading extends SignupViewModelState {}
final class SignupViewModelError extends SignupViewModelState {
   String errorMessage;
  SignupViewModelError(this.errorMessage);

}
final class SignupViewModelSuccess extends SignupViewModelState {
  AuthEntity signupEntity;
  SignupViewModelSuccess(this.signupEntity);
}
