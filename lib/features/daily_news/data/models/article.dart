import 'package:clean_arch_demo/features/daily_news/domain/entities/article.dart';

class ArticleModel extends ArticleEntity {
  final int? id;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? publishedAt;
  final String? urlToImage;
  final String? content;

  const ArticleModel({
    this.id,
    this.author,
    this.title,
    this.description,
    this.url,
    this.publishedAt,
    this.urlToImage,
    this.content,
  }) : super(
    id: id,
    author: author,
    title: title,
    description: description,
    url: url,
    urlToImage: urlToImage,
    publishedAt: publishedAt,
    content: content,
  );

  factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
    id: json["id"],
    author: json["author"] ?? "",
    title: json["title"] ?? "",
    description: json["description"] ?? "",
    url: json["url"] ?? "",
    urlToImage: json["urlToImage"] ?? "",
    publishedAt: json["publishedAt"] ?? "",
    content: json["content"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "author": author,
    "title": title,
    "description": description,
    "url": url,
    "urlToImage": urlToImage,
    "publishedAt": publishedAt,
    "content": content,
  };

}