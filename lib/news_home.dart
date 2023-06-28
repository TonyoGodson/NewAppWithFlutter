import 'package:flutter/material.dart';
import 'package:news_app_flutter/news_details.dart';
import 'model/news_model.dart';

class NewsHome extends StatefulWidget {
  static const routeName = '/news_home';
  const NewsHome({Key? key}) : super(key: key);

  @override
  State<NewsHome> createState() => _NewsHomeState();
}

class _NewsHomeState extends State<NewsHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("News as e dey hot",
        style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold, color: Colors.black),),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(5.0, 0.0,  5.0, 0.0),
        child: ListView.builder(itemBuilder: (context, index) => _listItem(index),
                    itemCount: 10,  //_allNews.length;
      ),
      ));
  }

  _listItem(index){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(NewsDetails.routeName);
                  },
                  // child: Image.asset("asset/001.jpg",
                  child: Image.network('https://t.auntmia.com/nthumbs/2016-08-26/2856074/2856074_14b.jpg',
                  ),
                ),
              ),
              const SizedBox(width: 10),
               Expanded(
                flex: 8,
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap:() {
                        Navigator.of(context).pushNamed(NewsDetails.routeName);
                    },
                      child: Text(
                        "First Line Of News First Line Of News",
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 12.0),
                      child: Text("Author",
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
                      Navigator.of(context).pushNamed(NewsDetails.routeName);
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
      ),
    );
  }
}
