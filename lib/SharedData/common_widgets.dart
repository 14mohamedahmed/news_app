import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget loadingInicator(context) => Center(
      child: Column(
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 10),
          Text(
            'Loading'.toUpperCase(),
            style: Theme.of(context).textTheme.bodyText2.copyWith(
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontSize: 20,
                ),
          ),
        ],
      ),
    );

Widget errorMessage({context, String errorMessage}) => Center(
      child: Text(
        errorMessage,
        style: Theme.of(context).textTheme.bodyText2.copyWith(
              fontSize: 20,
            ),
      ),
    );

Widget emptyDataMessage(context) => Center(
      child: Text(
        'There is no data to show!',
        style: Theme.of(context).textTheme.bodyText2.copyWith(
              fontSize: 20,
            ),
      ),
    );
