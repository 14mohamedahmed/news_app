import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/SharedData/constants.dart';
import 'package:news_app/SharedData/dio_helper.dart';
import 'package:news_app/layouts/Home/cubit/home_states.dart';
import 'package:news_app/models/Home_Models/top_headlines.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeIntialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  int currentIndx = 0;

  List<String> categories = [
    'General',
    'Health',
    'Sports',
    'Business',
    'Entertainment',
    'Science',
    'Technology',
  ];

  void changeCategotyIndex(int index) {
    currentIndx = index;
    emit(ChangeHomeCategotyItemState());
    getNewsData(category: categories[currentIndx].toLowerCase());
  }

  List<TopHeadlines> topHeadlines = [];
  void getNewsData({String category}) async {
    emit(HomeLoadingIndicator());
    try {
      await DioHelper()
          .sendRequestToAPI(
        requestType: Constants.GET_Method,
        category: category,
      )
          .then((response) {
        if (response != null) {
          if (response.statusCode == 200) {
            for (var item in response.data['articles']) {
              topHeadlines.add(TopHeadlines.fromJson(item));
            }
            emit(HomeGetRequestSuceess());
          }
        }
      });
    } catch (error) {
      emit(
        HomeGetRequestError(
          error: error['message'].toString(),
        ),
      );
    }
  }
}
