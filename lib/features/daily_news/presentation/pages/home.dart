import 'package:clean_arch_demo/features/daily_news/domain/entities/article.dart';
import 'package:clean_arch_demo/features/daily_news/presentation/bloc/remote/remote_article_bloc.dart';
import 'package:clean_arch_demo/features/daily_news/presentation/bloc/remote/remote_article_state.dart';
import 'package:clean_arch_demo/features/daily_news/presentation/widgets/article_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageWithDailyNews extends StatelessWidget {
  const HomePageWithDailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(context),
    );
  }

  _buildAppBar() {
    return AppBar(
      title: const Text('Daily News', style: TextStyle(color: Colors.black),),
    );
  }

  _buildBody(BuildContext context) {
    return BlocBuilder<RemoteArticlesBloc,RemoteArticlesState>(
        builder: (_,state){
          if(state is RemoteArticlesLoading) {
            return const Center(child: CupertinoActivityIndicator(),);
          }
          if(state is RemoteArticlesError) {
            return const Center(child: Icon(Icons.refresh_rounded),);
          }
          if(state is RemoteArticlesDone) {
            return ListView.builder(
               //itemCount: state.articles!.length,
                itemBuilder: (context,index){
            return GestureDetector(
                onTap: () => _onArticlePressed(context, state.articles![index]),
                child:
                    ArticleTileWidget(articleEntity: state.articles![index]));
          },);
          }
          else {
            return const SizedBox.shrink();
          }
    });
  }


  void _onArticlePressed(BuildContext context, ArticleEntity article) {
    Navigator.pushNamed(context, '/ArticleDetails', arguments: article);
  }

}
