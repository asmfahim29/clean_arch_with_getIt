import 'package:clean_arch_demo/features/daily_news/domain/entities/article.dart';
import 'package:clean_arch_demo/features/daily_news/domain/repository/article_repository.dart';
import 'package:clean_arch_demo/features/daily_news/domain/usecase/usecase.dart';

class SaveArticleUseCase implements UseCase<void, ArticleEntity> {
  final ArticleRepository _articleRepository;

  SaveArticleUseCase(this._articleRepository);

  @override
  Future<void> call({ArticleEntity?  params}) {
    return _articleRepository.saveArticle(params!);
  }
}
