import 'package:clean_arch_demo/features/daily_news/domain/entities/article.dart';
import 'package:equatable/equatable.dart';


abstract class LocalArticleEvent extends Equatable {
  final ArticleEntity? article;

  const LocalArticleEvent({this.article});

  @override
  List<Object> get props => [article!];

}

class GetSavedArticles extends LocalArticleEvent {
  const GetSavedArticles();
}

class SavedArticles extends LocalArticleEvent {
  const SavedArticles(ArticleEntity article) : super(article: article);
}

class RemoveArticles extends LocalArticleEvent {
  const RemoveArticles(ArticleEntity article) : super(article: article);
}