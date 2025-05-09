import 'dart:io';
import 'package:clean_arch_demo/core/constants/constants.dart';
import 'package:clean_arch_demo/core/resources/data_state.dart';
import 'package:clean_arch_demo/features/daily_news/data/data_source/local/app_database.dart';
import 'package:clean_arch_demo/features/daily_news/data/data_source/remote/news_api_service.dart';
import 'package:clean_arch_demo/features/daily_news/data/models/article.dart';
import 'package:clean_arch_demo/features/daily_news/domain/entities/article.dart';
import 'package:clean_arch_demo/features/daily_news/domain/repository/article_repository.dart';
import 'package:dio/dio.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;
  final AppDatabase _appDatabase;

  ArticleRepositoryImpl(this._newsApiService, this._appDatabase);

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async {
    try{
      final httpResponse = await _newsApiService.getNewsArticles(
        apiKey: apiKey,
        country: country,
        category: category,
      );

      // for(int i = 0; i< httpResponse.data.length; i++) {
      //   print("---------${httpResponse.data[i].title}");
      // }

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
          DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.values.firstWhere(
                  (type) => type.toString() == httpResponse.response.statusCode.toString(),
              orElse: () => DioExceptionType.unknown,
            ),
            requestOptions: httpResponse.response.requestOptions,
          ),
        );
      }
    } on DioException catch(e){
      return DataFailed(e);
    }
  }

  @override
  Future<List<ArticleEntity>> getSavedArticles() {
    return _appDatabase.articleDao.getArticles();
  }

  @override
  Future<void> removeArticle(ArticleEntity article) {
    return _appDatabase.articleDao.deleteArticle(ArticleModel.fromEntity(article));
  }

  @override
  Future<void> saveArticle(ArticleEntity article) {

    return _appDatabase.articleDao.insertArticle(ArticleModel.fromEntity(article));
  }
}
