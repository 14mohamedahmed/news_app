import 'package:flutter/material.dart';
import 'package:news_app/SharedData/constants.dart';
import 'package:news_app/appConfig/app_config.dart';
import 'package:news_app/models/Home_Models/top_headlines.dart';

class NewsList extends StatelessWidget {
  final TopHeadlines topHeadlines;
  NewsList({this.topHeadlines});
  @override
  Widget build(BuildContext context) {
    AppConfig().init(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Image.network(
            topHeadlines.urlToImage ?? Constants.PlaceHolderImage,
            fit: BoxFit.cover,
            width: 150,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  topHeadlines.title ?? '',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: Theme.of(context).textTheme.bodyText2.copyWith(
                        fontSize: AppConfig.safeBlockVertical * 2.5,
                      ),
                ),
                Text(
                  topHeadlines.description ?? '',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.bodyText2.copyWith(
                        color: Colors.black.withOpacity(0.7),
                        fontSize: AppConfig.safeBlockVertical * 2,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
