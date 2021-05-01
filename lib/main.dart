import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layouts/Home/cubit/home_cubit.dart';
import 'package:news_app/SharedData/app_theme.dart';
import 'package:news_app/layouts/nav_bar/cubit/nav_bar_cubit.dart';
import 'package:news_app/observer/bloc_observer.dart';
import 'package:news_app/routes.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.white));
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NavBarCubit(),
        ),
        BlocProvider(
          create: (context) => HomeCubit()..getNewsData(),
        ),
      ],
      child: MaterialApp(
        title: 'News App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().lightTheme(),
        routes: Routes().appRoutes(context),
        initialRoute: Routes.NavBar,
      ),
    );
  }
}
