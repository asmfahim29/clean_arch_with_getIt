import 'package:clean_arch_demo/features/daily_news/domain/usecase/get_saved_article_usecase.dart';
import 'package:clean_arch_demo/features/daily_news/domain/usecase/remove_article_usecase.dart';
import 'package:clean_arch_demo/features/daily_news/domain/usecase/save_article_usecase.dart';
import 'package:clean_arch_demo/features/daily_news/presentation/bloc/local/local_article_event.dart';
import 'package:clean_arch_demo/features/daily_news/presentation/bloc/local/local_article_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocalArticleBloc extends Bloc<LocalArticleEvent, LocalArticleState> {
  final GetSavedArticleUseCase _getSavedArticleUseCase;
  final SaveArticleUseCase _saveArticleUseCase;
  final RemoveArticleUseCase _removeArticleUseCase;

  LocalArticleBloc(
    this._getSavedArticleUseCase,
    this._saveArticleUseCase,
    this._removeArticleUseCase,
  ) : super(const LocalArticlesLoading()){
    on<GetSavedArticles>(onGetSavedArticles);
    on<SavedArticles>(onSavedArticles);
    on<RemoveArticles>(onRemoveArticles);
  }

  void onGetSavedArticles(GetSavedArticles event, Emitter<LocalArticleState> emit) async {
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticlesDone(articles));
  }

  void onRemoveArticles(RemoveArticles removeArticle, Emitter<LocalArticleState> emit) async {
    await _removeArticleUseCase(params: removeArticle.article);

    final articles = await _getSavedArticleUseCase();
    emit(LocalArticlesDone(articles));
  }

  void onSavedArticles(SavedArticles saveArticle, Emitter<LocalArticleState> emit) async {
    await _saveArticleUseCase(params: saveArticle.article);
    final articles = await _getSavedArticleUseCase();
    emit(LocalArticlesDone(articles));
  }

}
