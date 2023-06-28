

class NewsModel{
  late String id;
  late String url;
  late String title;
  late String text;
  late String publisher;
  late String author;
  late String image;
  late String date;

  NewsModel(this.id, this.url, this.title, this.date, this.author, this.publisher, this.text, this.image);

  NewsModel.fromJson(Map<String, dynamic> json){
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