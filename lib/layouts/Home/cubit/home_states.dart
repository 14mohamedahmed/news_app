abstract class HomeStates {}

class HomeIntialState extends HomeStates {}

class ChangeHomeCategotyItemState extends HomeStates {}

class HomeLoadingIndicator extends HomeStates {}

class HomeGetRequestSuceess extends HomeStates {}

class HomeGetRequestError extends HomeStates {
  final String error;
  HomeGetRequestError({this.error});
}
