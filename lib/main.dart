import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_ecommerce/core/LocalStorage/prefs_helper.dart';
import 'package:my_ecommerce/core/routes_manager/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/MyBlocObserver.dart';
import 'core/di/DiSetup.dart';
import 'core/routes_manager/route_generator.dart';
import 'core/routes_manager/routes.dart';

void main() async{
  Bloc.observer = MyBlocObserver();

 configureDependencies();
 WidgetsFlutterBinding.ensureInitialized();
await PrefsHelper.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: child,
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute:PrefsHelper.getToken()!=null?Routes.mainRoute
            : Routes.signInRoute,
      ),
    );
  }
}
