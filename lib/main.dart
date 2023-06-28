import 'package:flutter/material.dart';

import 'news_home.dart';
import 'news_details.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: NewsHome(),
    routes: {
      NewsHome.routeName: (BuildContext context) => NewsHome(),
      NewsDetails.routeName: (BuildContext context) => NewsDetails()
    },
  ));
}