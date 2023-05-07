
import 'package:dio_helper_flutter/dio_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hi_ddd_test1/modules/smart-home-app/OnboardingScreen/OnboardingScreen.dart';
import 'package:hi_ddd_test1/shared/bloc_observer.dart';
import 'package:hi_ddd_test1/shared/cubit/cubit.dart';
import 'package:hi_ddd_test1/shared/cubit/states.dart';
import 'package:hi_ddd_test1/shared/styles/themes.dart';



void main() async {
 WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
 Bloc.observer = MyBlocObserver();
 // DioHelper.init();
 // await CacheHelper.init();



  runApp(MyApp());
}
//stateless


 class MyApp extends StatelessWidget
 {

  @override
  Widget build(BuildContext context)
  {
   return MultiBlocProvider(
    providers:
    [],
    child: BlocConsumer<AppCubit, AppStates>(
     listener: (context, state) {},
     builder: (context, state){

      return MaterialApp(
       debugShowCheckedModeBanner: false,
       theme: lightTheme,
       darkTheme: darkTheme,
       // themeMode: AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
       home: OnboardingScreen(),
      );
     },
    ),
   );
  }

 }


