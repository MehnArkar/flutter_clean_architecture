import 'dart:io';
import 'package:flutter_clean_architecture/core/constant/constant.dart';
import 'package:flutter_clean_architecture/core/resources/data_state.dart';
import 'package:flutter_clean_architecture/features/daily_news/data/data_source/remote/news_api_server.dart';
import 'package:flutter_clean_architecture/features/daily_news/data/models/article.dart';
import 'package:flutter_clean_architecture/features/daily_news/domain/respository/article_repository.dart';
import 'package:dio/dio.dart';

class ArticleRepositoryImpl implements ArticleRepository{
  final NewsApiService newsApiService;
  ArticleRepositoryImpl(this.newsApiService);


  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async {
    try {
      final response = await newsApiService.getNewsArticles(
          apiKey: apiKey,
          country: countryQurey,
          category: categoryQuery
      );

      if (response.response.statusCode == HttpStatus.ok) {
        return DataSuccess(response.data);
      } else {
        return DataFailed(DioError(error: response.response.statusMessage,
            response: response.response,
            type: DioErrorType.badResponse,
            requestOptions: response.response.requestOptions));
      }
    } on DioError catch(e){
      return DataFailed(e);
    }
  }

}