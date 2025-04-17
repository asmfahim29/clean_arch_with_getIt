
import 'package:clean_arch_demo/features/daily_news/data/data_source/remote/news_api_service.dart';
import 'package:clean_arch_demo/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:clean_arch_demo/features/daily_news/domain/repository/article_repository.dart';
import 'package:clean_arch_demo/features/daily_news/domain/usecase/get_article_usecase.dart';
import 'package:clean_arch_demo/features/daily_news/presentation/bloc/remote/remote_article_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final s1 = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio inject
  s1.registerSingleton<Dio>(Dio());

  // dependencies
  s1.registerSingleton<NewsApiService>(NewsApiService(s1()));
  s1.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(s1()));

  // UseCases
  s1.registerSingleton<GetArticleUseCase>(GetArticleUseCase(s1())); // ✅ Inject ArticleRepository

  // Blocs
  s1.registerFactory<RemoteArticlesBloc>(() => RemoteArticlesBloc(s1()));
}

