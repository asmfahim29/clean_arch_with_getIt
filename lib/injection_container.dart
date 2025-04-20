
import 'package:clean_arch_demo/features/daily_news/data/data_source/local/app_database.dart';
import 'package:clean_arch_demo/features/daily_news/data/data_source/remote/news_api_service.dart';
import 'package:clean_arch_demo/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:clean_arch_demo/features/daily_news/domain/repository/article_repository.dart';
import 'package:clean_arch_demo/features/daily_news/domain/usecase/get_article_usecase.dart';
import 'package:clean_arch_demo/features/daily_news/domain/usecase/get_saved_article_usecase.dart';
import 'package:clean_arch_demo/features/daily_news/domain/usecase/remove_article_usecase.dart';
import 'package:clean_arch_demo/features/daily_news/domain/usecase/save_article_usecase.dart';
import 'package:clean_arch_demo/features/daily_news/presentation/bloc/local/local_article_bloc.dart';
import 'package:clean_arch_demo/features/daily_news/presentation/bloc/remote/remote_article_bloc.dart';
import 'package:dio/dio.dart';
import 'package:floor/floor.dart';
import 'package:get_it/get_it.dart';

final s1 = GetIt.instance;

Future<void> initializeDependencies() async {

  final database = await $FloorAppDatabase.databaseBuilder('app_database_db').build();
  s1.registerSingleton<AppDatabase>(database);


  // Dio inject
  s1.registerSingleton<Dio>(Dio());

  // dependencies
  s1.registerSingleton<NewsApiService>(NewsApiService(s1()));
  s1.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(s1(), s1()));

  // UseCases
  s1.registerSingleton<GetArticleUseCase>(GetArticleUseCase(s1())); // ✅ Inject ArticleRepository
  s1.registerSingleton<GetSavedArticleUseCase>(GetSavedArticleUseCase(s1()));
  s1.registerSingleton<SaveArticleUseCase>(SaveArticleUseCase(s1()));
  s1.registerSingleton<RemoveArticleUseCase>(RemoveArticleUseCase(s1()));

  // Blocs
  s1.registerFactory<RemoteArticlesBloc>(() => RemoteArticlesBloc(s1()));

  s1.registerFactory<LocalArticleBloc>(() => LocalArticleBloc(s1(), s1(), s1()));
}

