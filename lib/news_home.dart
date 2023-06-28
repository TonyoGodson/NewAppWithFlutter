import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:news_app_flutter/news_details.dart';
import 'package:http/http.dart' as http;

import 'model/news_model.dart';


class NewsHome extends StatefulWidget {
  static const routeName = '/news_home';

  const NewsHome({Key? key}) : super(key: key);

  @override
  State<NewsHome> createState() => _NewsHomeState();
}

class _NewsHomeState extends State<NewsHome> {

  static List<NewsModel> _news = <NewsModel>[];
  static List<NewsModel> _newsInApp = <NewsModel>[];

  Future<List<NewsModel>> getNews() async {
    try {
      var url = Uri.parse("http://www.mocky.io/v2/5ecfddf13200006600e3d6d0");
      var response = await http.get(url);
      var news = <NewsModel>[];
      if (response.statusCode == 200) {
        var newsItems = json.decode(response.body);
        for (var item in newsItems) {
          news.add(NewsModel.fromJson(item));
        }
      }
      return news;
    } catch (e) {
      print(e);
      return [];
    }
  }

  @override
  void initState() {
    super.initState();
    getNews().then((value) {
      setState(() {
        _news.addAll(value);
        _newsInApp = _news;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("News as e dey hot",
          style: TextStyle(fontSize: 28.0,
              fontWeight: FontWeight.bold,
              color: Colors.black),),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Container(
            padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return _listItem(index);
              },
              itemCount: _newsInApp.length,
            )));
  }

  _listItem(index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
    Row(
    children: [
    Expanded(
    flex: 2,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(NewsDetails.routeName, arguments: _newsInApp[index]);
        },
        // child: Image.asset("asset/001.jpg",
        child: Image.network(_newsInApp[index].image,
        ),
      ),
    ),
    const SizedBox(width: 10),
    Expanded(
      flex: 8,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          GestureDetector(
          onTap:() {
    Navigator.of(context).pushNamed(NewsDetails.routeName, arguments: _newsInApp[index]);
    },
      child: Text(
        _newsInApp[index].title,
        style: TextStyle(
            fontSize: 20.0,
            color: Colors.black),
      ),
    ),
    Padding(
        padding: EdgeInsets.only(top: 12.0),
        child: Text(
        _newsInApp[index].author,
        style: TextStyle(
        fontSize: 18.0,
        color: Colors.black26
        )
    ),
    ),
    ],
    ),
    ),
    Expanded(
    flex: 1,
    child: IconButton(
    padding: EdgeInsets.all(0),
    onPressed:() {
    Navigator.of(context).pushNamed(NewsDetails.routeName, arguments: _newsInApp[index]);
    },
    icon: const Icon(
    Icons.arrow_forward_ios
    ),),
    ),
    ],
    ),
    Padding(
    padding: const EdgeInsets.only(top: 5),
    child: Divider(
    thickness: 1.0,
    ),
    )
    ],
    );
  }
}
