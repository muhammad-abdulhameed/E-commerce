// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/auth/SignIn/data/data_sources/data_source_impl/signIn_data_source_api_impl.dart'
    as _i9;
import '../../features/auth/SignIn/data/data_sources/signIn_data_Source.dart'
    as _i8;
import '../../features/auth/SignIn/data/repositories/signInRepo_impl.dart'
    as _i11;
import '../../features/auth/SignIn/domain/repositories/signInRepo.dart' as _i10;
import '../../features/auth/SignIn/domain/use_cases/signIn_use_case.dart'
    as _i12;
import '../../features/auth/SignIn/presentation/manager/sign_in_view_model_cubit.dart'
    as _i13;
import '../../features/auth/Signup/data/data_sources/data_source_Impl/SignUpApiDataSource_impl.dart'
    as _i15;
import '../../features/auth/Signup/data/data_sources/SignupDataSource.dart'
    as _i14;
import '../../features/auth/Signup/data/repositories/SingupRepo_Impl.dart'
    as _i17;
import '../../features/auth/Signup/domain/repositories/SignUpRepo.dart' as _i16;
import '../../features/auth/Signup/domain/use_cases/SignupUseCase.dart' as _i18;
import '../../features/auth/Signup/presentation/manager/signup_view_model_cubit.dart'
    as _i19;
import '../../features/main_layout/home/data/data_sources/data_source_impl/home_api_dao_impl.dart'
    as _i5;
import '../../features/main_layout/home/data/data_sources/home_dao.dart' as _i4;
import '../../features/main_layout/home/data/repositories/home_repo_impl.dart'
    as _i7;
import '../../features/main_layout/home/domain/repositories/home_repo.dart'
    as _i6;
import '../../features/main_layout/home/domain/use_cases/GetAllCategories.dart'
    as _i20;
import '../../features/main_layout/home/domain/use_cases/GetBrandsUseCase.dart'
    as _i21;
import '../../features/main_layout/home/presentation/manager/home_view_model_cubit.dart'
    as _i22;
import '../Remote/ApiManger.dart' as _i3;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.ApiManger>(() => _i3.ApiManger());
    gh.factory<_i4.HomeDao>(() => _i5.HomeApiDaoImpl(gh<_i3.ApiManger>()));
    gh.factory<_i6.HomeRepo>(() => _i7.HomeRepoImpl(gh<_i4.HomeDao>()));
    gh.factory<_i8.SignInDataSource>(
        () => _i9.SignInDataSourceApiImpl(gh<_i3.ApiManger>()));
    gh.factory<_i10.SignInRepo>(
        () => _i11.SignInRepoImpl(gh<_i8.SignInDataSource>()));
    gh.factory<_i12.SignInUseCase>(
        () => _i12.SignInUseCase(gh<_i10.SignInRepo>()));
    gh.factory<_i13.SignInViewModelCubit>(
        () => _i13.SignInViewModelCubit(gh<_i12.SignInUseCase>()));
    gh.factory<_i14.SignUpDataSource>(
        () => _i15.SignUpApiDataSourceImpl(gh<_i3.ApiManger>()));
    gh.factory<_i16.SignupRepo>(
        () => _i17.SignupRepoImpl(gh<_i14.SignUpDataSource>()));
    gh.factory<_i18.SignupUseCase>(
        () => _i18.SignupUseCase(gh<_i16.SignupRepo>()));
    gh.factory<_i19.SignupViewModelCubit>(
        () => _i19.SignupViewModelCubit(gh<_i18.SignupUseCase>()));
    gh.factory<_i20.GetAllCategoriesUseCase>(
        () => _i20.GetAllCategoriesUseCase(gh<_i6.HomeRepo>()));
    gh.factory<_i21.GetBrandsUseCase>(
        () => _i21.GetBrandsUseCase(gh<_i6.HomeRepo>()));
    gh.factory<_i22.HomeViewModelCubit>(() => _i22.HomeViewModelCubit(
          gh<_i20.GetAllCategoriesUseCase>(),
          gh<_i21.GetBrandsUseCase>(),
        ));
    return this;
  }
}
