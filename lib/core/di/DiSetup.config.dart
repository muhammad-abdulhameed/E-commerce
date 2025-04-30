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
    as _i5;
import '../../features/auth/SignIn/data/data_sources/signIn_data_Source.dart'
    as _i4;
import '../../features/auth/SignIn/data/repositories/signInRepo_impl.dart'
    as _i7;
import '../../features/auth/SignIn/domain/repositories/signInRepo.dart' as _i6;
import '../../features/auth/SignIn/domain/use_cases/signIn_use_case.dart'
    as _i8;
import '../../features/auth/SignIn/presentation/manager/sign_in_view_model_cubit.dart'
    as _i9;
import '../../features/auth/Signup/data/data_sources/data_source_Impl/SignUpApiDataSource_impl.dart'
    as _i11;
import '../../features/auth/Signup/data/data_sources/SignupDataSource.dart'
    as _i10;
import '../../features/auth/Signup/data/repositories/SingupRepo_Impl.dart'
    as _i13;
import '../../features/auth/Signup/domain/repositories/SignUpRepo.dart' as _i12;
import '../../features/auth/Signup/domain/use_cases/SignupUseCase.dart' as _i14;
import '../../features/auth/Signup/presentation/manager/signup_view_model_cubit.dart'
    as _i15;
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
    gh.factory<_i4.SignInDataSource>(
        () => _i5.SignInDataSourceApiImpl(gh<_i3.ApiManger>()));
    gh.factory<_i6.SignInRepo>(
        () => _i7.SignInRepoImpl(gh<_i4.SignInDataSource>()));
    gh.factory<_i8.SignInUseCase>(
        () => _i8.SignInUseCase(gh<_i6.SignInRepo>()));
    gh.factory<_i9.SignInViewModelCubit>(
        () => _i9.SignInViewModelCubit(gh<_i8.SignInUseCase>()));
    gh.factory<_i10.SignUpDataSource>(
        () => _i11.SignUpApiDataSourceImpl(gh<_i3.ApiManger>()));
    gh.factory<_i12.SignupRepo>(
        () => _i13.SignupRepoImpl(gh<_i10.SignUpDataSource>()));
    gh.factory<_i14.SignupUseCase>(
        () => _i14.SignupUseCase(gh<_i12.SignupRepo>()));
    gh.factory<_i15.SignupViewModelCubit>(
        () => _i15.SignupViewModelCubit(gh<_i14.SignupUseCase>()));
    return this;
  }
}
