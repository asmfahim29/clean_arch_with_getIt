import 'package:clean_arch_demo/core/resources/data_state.dart';
import 'package:clean_arch_demo/features/daily_news/domain/entities/article.dart';
import 'package:clean_arch_demo/features/daily_news/domain/repository/article_repository.dart';
import 'package:clean_arch_demo/features/daily_news/domain/usecase/usecase.dart';

class GetArticleUseCase implements UseCase<DataState<List<ArticleEntity>>, void> {
  final ArticleRepository _articleRepository;

  GetArticleUseCase(this._articleRepository);

  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return _articleRepository.getNewsArticles();
  }
}
