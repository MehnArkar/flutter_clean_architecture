import 'package:flutter_clean_architecture/features/daily_news/domain/entities/article.dart';

class ArticleModel extends ArticleEntity{
  const ArticleModel({required super.id, required super.author, required super.title, required super.description, required super.url, required super.urlToImage, required super.publishedAt, required super.content});

  factory ArticleModel.fromJson(Map < String, dynamic > map) {
    return ArticleModel(
      id: map['source']['id']??"",
      author: map['author'] ?? "",
      title: map['title'] ?? "",
      description: map['description'] ?? "",
      url: map['url'] ?? "",
      urlToImage: map['urlToImage'] ??"",
      publishedAt: map['publishedAt'] ?? "",
      content: map['content'] ?? "",
    );
  }

  factory ArticleModel.fromEntity(ArticleEntity entity) {
    return ArticleModel(
        id: entity.id,
        author: entity.author,
        title: entity.title,
        description: entity.description,
        url: entity.url,
        urlToImage: entity.urlToImage,
        publishedAt: entity.publishedAt,
        content: entity.content
    );
  }
}