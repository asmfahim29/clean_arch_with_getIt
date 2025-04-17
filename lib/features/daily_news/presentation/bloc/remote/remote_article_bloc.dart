import 'package:clean_arch_demo/core/resources/data_state.dart';
import 'package:clean_arch_demo/features/daily_news/domain/usecase/get_article_usecase.dart';
import 'package:clean_arch_demo/features/daily_news/presentation/bloc/remote/remote_article_event.dart';
import 'package:clean_arch_demo/features/daily_news/presentation/bloc/remote/remote_article_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class RemoteArticlesBloc extends Bloc<RemoteArticlesEvent, RemoteArticlesState> {

  final GetArticleUseCase _getArticleUseCase;

  RemoteArticlesBloc(this._getArticleUseCase) : super (RemoteArticlesLoading()) {
    on <GetArticles> (onGetArticles);
  }

  void onGetArticles(GetArticles event, Emitter<RemoteArticlesState> emit) async {
    final dataState = await _getArticleUseCase();

    if(dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(
        RemoteArticlesDone(dataState.data!)
      );
    }else {
      emit(
          RemoteArticlesError(dataState.exception!)
      );
    }
  }

}