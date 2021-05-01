import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layouts/Favourites/favourite_screen.dart';
import 'package:news_app/layouts/Home/home_screen.dart';
import 'package:news_app/layouts/Profile/profile_screen.dart';
import 'package:news_app/layouts/Settings/settings_screen.dart';
import 'package:news_app/layouts/nav_bar/cubit/nav_bar_states.dart';

class NavBarCubit extends Cubit<NavBarStates> {
  NavBarCubit() : super(NavBarIntilaStates());

  static NavBarCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> appScreens = [
    HomeScreen(),
    FavouritesScreen(),
    SettingsScreens(),
    ProfileScreen(),
  ];

  List<BottomNavigationBarItem> nacBarItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.bookmark_border),
      label: 'Favourites',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Settings',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person_outline),
      label: 'Profile',
    ),
  ];

  void changeNavBarIndex(int index) {
    currentIndex = index;
    emit(ChangeNavBarState());
  }
}
