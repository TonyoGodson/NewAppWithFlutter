

class NewsModel{
  late String id;
  late String url;
  late String title;
  late String text;
  late String publisher;
  late String author;
  late String image;
  late String date;

  NewsModel({
    required this.id,
    required this.url,
    required this.title,
    required this.date,
    required this.author,
    required this.publisher,
    required this.text,
    required this.image,
  });

  NewsModel.fromJso(Map<String, dynamic> json){
    id = json['id'] ?? '';
    url = json['url'] ?? '';
    title = json['title'] ?? '';
    date = json['date'] ?? '';
    author = json['author'] ?? '';
    publisher = json['publisher'] ?? '';
    text = json['text'] ?? '';
    image = json['image'] ?? '';
  }
}