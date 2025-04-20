import 'package:clean_arch_demo/features/daily_news/domain/entities/article.dart';
import 'package:clean_arch_demo/features/daily_news/presentation/bloc/local/local_article_bloc.dart';
import 'package:clean_arch_demo/features/daily_news/presentation/bloc/local/local_article_event.dart';
import 'package:clean_arch_demo/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArticleDetails extends StatelessWidget {
  final ArticleEntity? article;

  const ArticleDetails({super.key, this.article});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => s1<LocalArticleBloc>(),
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: _buildBody(),
        floatingActionButton: _buildFloatingActionButton(context),
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
          _onBackButtonTapped(context);
        },
      ),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildArticleTitleAndDate(),
          _buildArticleImage(),
          _buildArticleDescription(),
        ],
      ),
    );
  }

  Widget _buildArticleTitleAndDate() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            article!.title!,
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 14,
          ),
          Row(
            children: [
              const Icon(
                Icons.timeline_outlined,
                size: 16,
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                article!.publishedAt!,
                style: const TextStyle(fontSize: 12),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildArticleImage() {
    return Container(
      width: double.maxFinite,
      height: 250,
      margin: const EdgeInsets.only(top: 14),
      child: Image.network(
        article!.urlToImage!,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildArticleDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      child: Text(
        article!.description!,
        style: const TextStyle(fontSize: 12),
      ),
    );
  }

  Widget _buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        BlocProvider.of<LocalArticleBloc>(context).add(SavedArticles(article!));
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Article saved successfully'),
            backgroundColor: Colors.black,
          ),
        );
      },
    );
  }


  void _onBackButtonTapped(BuildContext context) {
    Navigator.pop(context);
  }


}
