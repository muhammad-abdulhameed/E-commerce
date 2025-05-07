import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:my_ecommerce/features/main_layout/home/domain/entities/CategoryEntity.dart';

import '../../domain/entities/BrandsListEntity.dart';
import '../../domain/entities/CategoriesListEntity.dart';
import '../../domain/use_cases/GetAllCategories.dart';
import '../../domain/use_cases/GetBrandsUseCase.dart';

part 'home_view_model_state.dart';
@injectable
class HomeViewModelCubit extends Cubit<HomeViewModelState> {
  GetAllCategoriesUseCase _getAllCategoriesUseCase;
  GetBrandsUseCase getBrandsUsecase;
  HomeViewModelCubit(this._getAllCategoriesUseCase,this.getBrandsUsecase) : super(HomeViewModelInitial());
  getCategories()async{
    emit(HomeCategoriesLoadingState());
  var response =await _getAllCategoriesUseCase.call();
response.fold((error) {
  emit(HomeCategoriesErrorState(error));
}, (entity) {
  emit(HomeCategoriesSuccessState(entity));
});
  }
  getBrands()async{
    emit(HomeBrandsLoadingState());
  var result=await getBrandsUsecase.call();
result.fold((error){
  emit(HomeBrandsErrorState(error));
} , (entity) {
  emit(HomeBrandsSuccessState(entity));
});
  }
}
