import 'package:clean_arch_demo/features/daily_news/domain/entities/article.dart';
import 'package:floor/floor.dart';


@Entity(tableName: 'article', primaryKeys: ['id'])
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


  factory ArticleModel.fromEntity(ArticleEntity entity) {
    return ArticleModel(
      id: entity.id,
      author: entity.author,
      title: entity.title,
      description: entity.description,
      url: entity.url,
      urlToImage: entity.urlToImage,
      publishedAt: entity.publishedAt,
      content: entity.content,
    );
  }

}