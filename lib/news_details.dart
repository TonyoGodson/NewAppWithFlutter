import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

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
        title: Text(
          newsModel.title,
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: 250.0,
                    child: Image.network(
                      newsModel.image,
                      fit: BoxFit.contain,
                    )),
                SizedBox(height: 10.0,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    newsModel.title,
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 10.0,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    newsModel.publisher,
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black38,
                        fontWeight: FontWeight.normal),
                  ),
                ),
                SizedBox(height: 20.0,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    newsModel.text,
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                        fontWeight: FontWeight.normal),
                  ),
                ),
                SizedBox(height: 20.0,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    newsModel.author,
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                        fontWeight: FontWeight.normal),
                  ),
                ),
                SizedBox(height: 20.0,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text("Date published: ${newsModel.date}",
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                        fontWeight: FontWeight.normal),
                  ),
                ),
                SizedBox(height: 20.0,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: GestureDetector(
                    onTap: () async {
                      if(await canLaunchUrlString(newsModel.url)){
                        await launch(newsModel.url);
                      }
                    },
                    child: Text("full story at: ${newsModel.date}",
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.blue,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
                SizedBox(height: 30.0,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
