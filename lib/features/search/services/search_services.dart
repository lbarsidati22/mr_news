import 'package:dio/dio.dart';
import 'package:mr_news/core/model/news_api_response.dart';
import 'package:mr_news/core/utils/app_constants.dart';
import 'package:mr_news/features/search/model/search_body.dart';

class SearchServices {
  final aDio = Dio();
  Future<NewsApiResponse> search(SearchBody body) async {
    try {
      aDio.options.baseUrl = AppConstants.baseUrl;
      final headers = {'Authorization': 'Bearer ${AppConstants.apiKey}'};
      final response = await aDio.get(
        AppConstants.everything,
        options: Options(
          headers: headers,
        ),
        queryParameters: body.toMap(),
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
