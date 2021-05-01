import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layouts/nav_bar/cubit/nav_bar_cubit.dart';
import 'package:news_app/layouts/nav_bar/cubit/nav_bar_states.dart';

class NavBarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var navBarCubit = NavBarCubit.get(context);
    return BlocConsumer<NavBarCubit, NavBarStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: navBarCubit.appScreens[navBarCubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: navBarCubit.nacBarItems,
            currentIndex: navBarCubit.currentIndex,
            onTap: (index) {
              navBarCubit.changeNavBarIndex(index);
            },
          ),
        );
      },
    );
  }
}
