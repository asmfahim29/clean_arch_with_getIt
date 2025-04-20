import 'package:clean_arch_demo/core/resources/data_state.dart';
import 'package:clean_arch_demo/features/daily_news/domain/entities/article.dart';

abstract class ArticleRepository {

  // Api methods
  Future<DataState<List<ArticleEntity>>> getNewsArticles();


  // Database methods
  Future<List<ArticleEntity>> getSavedArticles();

  Future<void> saveArticle(ArticleEntity article);

  Future<void> removeArticle(ArticleEntity article);

}