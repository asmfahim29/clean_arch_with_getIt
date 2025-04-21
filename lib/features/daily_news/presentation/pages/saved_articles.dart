import 'package:clean_arch_demo/features/daily_news/domain/entities/article.dart';
import 'package:clean_arch_demo/features/daily_news/presentation/bloc/local/local_article_bloc.dart';
import 'package:clean_arch_demo/features/daily_news/presentation/bloc/local/local_article_event.dart';
import 'package:clean_arch_demo/features/daily_news/presentation/bloc/local/local_article_state.dart';
import 'package:clean_arch_demo/features/daily_news/presentation/widgets/article_tile.dart';
import 'package:clean_arch_demo/injection_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SavedArticles extends StatefulWidget {
  const SavedArticles({super.key});

  @override
  State<SavedArticles> createState() => _SavedArticlesState();
}

class _SavedArticlesState extends State<SavedArticles> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => s1<LocalArticleBloc>(),
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: _buildBody(),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      leading: GestureDetector(
        child: const Icon(
          Icons.chevron_left_outlined,
          color: Colors.black,
          size: 24,
        ),
        onTap: () {
          _onBackButtonTapped();
        },
      ),
    );
  }

  void _onBackButtonTapped() {
    Navigator.pop(context);
  }

  Widget _buildBody() {
    return BlocBuilder<LocalArticleBloc, LocalArticleState>(
      builder: (context, state) {
        if (state is LocalArticlesLoading) {
          return Center(
            child: CupertinoActivityIndicator(),
          );
        }
        if (state is LocalArticlesDone) {
          return _buildArticleList(state.article!);
        }

        return SizedBox();
      },
    );
  }

  Widget _buildArticleList(List<ArticleEntity> article) {
    if (article.isEmpty) {
      return Center(
        child: Text(
          'No Saved Articles',
          style: TextStyle(color: Colors.black),
        ),
      );
    }

    return ListView.builder(
      itemCount: article.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            article[index].title!,
            style: TextStyle(fontSize: 18),
          ),
          subtitle: Text(
            article[index].title!,
            style: TextStyle(fontSize: 12),
          ),
          trailing: GestureDetector(
            onTap: () => _onRemovedArticle(article[index]),
            child: Icon(
              Icons.remove_circle,
              size: 24,
              color: Colors.red,
            ),
          ),
          onTap: () => _onArticlePressed(article[index]),
        );
      },
    );
  }

  void _onRemovedArticle(ArticleEntity article) {
    BlocProvider.of<LocalArticleBloc>(context).add(RemoveArticles(article),);
  }

  void _onArticlePressed(ArticleEntity article) {
    Navigator.pushNamed(context, '/ArticleDetails', arguments: article);
  }

}
