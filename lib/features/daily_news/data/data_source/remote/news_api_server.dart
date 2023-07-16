import 'package:flutter_clean_architecture/core/constant/constant.dart';
import 'package:flutter_clean_architecture/features/daily_news/data/models/article.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
part 'news_api_server.g.dart';

@RestApi(baseUrl: newsAPIBaseURL)
abstract class NewsApiService {
      factory NewsApiService(Dio dio) = _NewsApiService;

      @GET('/top-headlines')
      Future<HttpResponse<List<ArticleModel>>> getNewsArticles({
        @Query("apiKey") String? apiKey,
        @Query("country") String? country,
        @Query("category") String? category
});
}