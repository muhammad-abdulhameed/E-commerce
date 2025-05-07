part of 'home_view_model_cubit.dart';


abstract class HomeViewModelState {}

final class HomeViewModelInitial extends HomeViewModelState {}
final class HomeCategoriesLoadingState extends HomeViewModelState {}
final class HomeCategoriesErrorState extends HomeViewModelState {
  String errorMessage;
  HomeCategoriesErrorState(this.errorMessage);
}
final class HomeCategoriesSuccessState extends HomeViewModelState {
  CategoriesListEntity categoryListEntity;
  HomeCategoriesSuccessState(this.categoryListEntity);
}


final class HomeBrandsLoadingState extends HomeViewModelState {}
final class HomeBrandsErrorState extends HomeViewModelState {
  String errorMessage;
  HomeBrandsErrorState(this.errorMessage);
}
final class HomeBrandsSuccessState extends HomeViewModelState {
  BrandsListEntity brandsListEntity;
  HomeBrandsSuccessState(this.brandsListEntity);
}
