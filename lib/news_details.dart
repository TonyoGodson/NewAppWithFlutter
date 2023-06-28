import 'package:flutter/material.dart';

import 'model/news_model.dart';

class NewsDetails extends StatefulWidget {
  static const routeName = '/news_details';
  const NewsDetails({Key? key}) : super(key: key);

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  static List<NewsModel> _newsInApp = <NewsModel>[];

  @override
  Widget build(BuildContext context) {
    final newsModel = ModalRoute.of(context)?.settings.arguments as NewsModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(newsModel.title,
        style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
            },
          icon: const Icon(
              Icons.arrow_back_ios,
            color: Colors.black,
          ),),
      ),
      body: Center(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                  child: Image.network(
                    newsModel.image,
                    fit: BoxFit.fill ,
                  )),
              Text(newsModel.title,
                style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                ) ,)
            ],
          ),
        ),
      ),
    );

  }
}
