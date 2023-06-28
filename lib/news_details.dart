import 'package:flutter/material.dart';

class NewsDetails extends StatefulWidget {
  static const routeName = '/news_details';
  const NewsDetails({Key? key}) : super(key: key);

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News Details",
        style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
            },
          icon: const Icon(
              Icons.arrow_back_ios
          ),),
      ),
      body: Center(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(""),
              Text("title",
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
