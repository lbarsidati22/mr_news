import 'package:dio/dio.dart';
import 'package:mr_news/core/model/news_api_response.dart';
import 'package:mr_news/core/utils/app_constants.dart';
import 'package:mr_news/features/home/model/top_headlines_body.dart';

class HomeServices {
  final aDio = Dio();
  Future<NewsApiResponse> getTopHeadlines(
    TopHeadlinesBody body,
  ) async {
    try {
      aDio.options.baseUrl = AppConstants.baseUrl;
      final headers = {'Authorization': 'Bearer ${AppConstants.apiKey}'};
      final response = await aDio.get(
        AppConstants.topHeadlines,
        queryParameters: body.toMap(),
        options: Options(
          headers: headers,
        ),
      );
      if (response.statusCode == 200) {
        return NewsApiResponse.fromMap(response.data);
      } else {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      rethrow;
    }
  }
}
