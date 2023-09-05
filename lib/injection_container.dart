import 'package:flutter_clean_architecture/features/daily_news/data/data_source/local/app_database.dart';
import 'package:flutter_clean_architecture/features/daily_news/data/data_source/remote/news_api_server.dart';
import 'package:flutter_clean_architecture/features/daily_news/data/repository/article_repository_impl.dart';
import 'package:flutter_clean_architecture/features/daily_news/domain/respository/article_repository.dart';
import 'package:flutter_clean_architecture/features/daily_news/domain/usecases/get_articles.dart';
import 'package:flutter_clean_architecture/features/daily_news/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

final sl = GetIt.instance;

Future<void> initializeDependences() async{

  final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();

  sl.registerSingleton<AppDatabase>(database);

  //Dio
  sl.registerSingleton<Dio>(Dio());

  //Dependences
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));
  
  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl()));

  //Usecase
  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));


  //Blocs
  sl.registerFactory<RemoteArticlesBloc>(() => RemoteArticlesBloc(sl()));

}