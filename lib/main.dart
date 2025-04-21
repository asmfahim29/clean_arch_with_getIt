import 'package:clean_arch_demo/config/themes/app_themes.dart';
import 'package:clean_arch_demo/features/daily_news/presentation/bloc/remote/remote_article_bloc.dart';
import 'package:clean_arch_demo/features/daily_news/presentation/bloc/remote/remote_article_event.dart';
import 'package:clean_arch_demo/features/daily_news/presentation/pages/home.dart';
import 'package:clean_arch_demo/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticlesBloc>(
      create: (context) => s1()..add(const GetArticles()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: theme(),
        home: const HomePageWithDailyNews(),
      ),
    );
  }
}
