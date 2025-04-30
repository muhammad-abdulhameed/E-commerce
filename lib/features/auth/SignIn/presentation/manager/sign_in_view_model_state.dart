part of 'sign_in_view_model_cubit.dart';


sealed class SignInViewModelState {}

final class SignInViewModelInitial extends SignInViewModelState {}
final class SignInViewModelLoadingState extends SignInViewModelState {}
final class SignInViewModelSuccessState extends SignInViewModelState {
  AuthEntity authEntity;
  SignInViewModelSuccessState(this.authEntity);
}
final class SignInViewModelErrorState extends SignInViewModelState {
  String message;
  SignInViewModelErrorState(this.message);

}
