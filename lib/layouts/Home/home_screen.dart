import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/SharedData/common_widgets.dart';
import 'package:news_app/appConfig/app_config.dart';
import 'package:news_app/layouts/Home/component/news_list.dart';
import 'package:news_app/layouts/Home/cubit/home_cubit.dart';
import 'package:news_app/layouts/Home/cubit/home_states.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppConfig().init(context);
    var homeCubit = HomeCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Text(
          'News App',
          style: Theme.of(context).appBarTheme.textTheme.bodyText1,
        ),
        leading: Icon(Icons.filter_list),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.only(
                right: 10,
              ),
              child: Icon(Icons.search),
            ),
          ),
        ],
      ),
      body: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'categories'.toUpperCase(),
                  style: Theme.of(context).textTheme.bodyText2.copyWith(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                ),
                SizedBox(
                  height: AppConfig.screenHeight * 0.03,
                ),
                Container(
                  height: AppConfig.screenHeight * 0.05,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: homeCubit.categories.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        homeCubit.changeCategotyIndex(index);
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 15),
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: homeCubit.currentIndx == index
                              ? Theme.of(context).accentColor
                              : Theme.of(context).backgroundColor,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Text(
                          homeCubit.categories[index],
                          style: homeCubit.currentIndx == index
                              ? Theme.of(context).textTheme.bodyText1
                              : Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: AppConfig.screenHeight * 0.03,
                ),
                Expanded(
                  child: state is HomeLoadingIndicator
                      ? loadingInicator(context)
                      : state is HomeGetRequestError
                          ? errorMessage(
                              context: context,
                              errorMessage: 'HomeGetRequestError().error',
                            )
                          : ListView.builder(
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemCount: homeCubit.topHeadlines.length,
                              itemBuilder: (context, index) {
                                if (homeCubit.topHeadlines.length == 0) {
                                  return emptyDataMessage(context);
                                }
                                return NewsList(
                                  topHeadlines: homeCubit.topHeadlines[index],
                                );
                              },
                            ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
