import 'package:dio/dio.dart';
import 'package:search_images/model/pixabay_images.dart';

class ApiClient {
  final Dio dio;

  ApiClient({required this.dio});

  Future<PixabayImages> fetchPixabayImages({String q = '月'}) async {
    const baseURL = 'https://pixabay.com/api';
    const key = '';
    const imageType = 'photo';
    const perPage = 99;

    final response = await dio.get(
      baseURL,
      queryParameters: {
        'key': key,
        'image_type': imageType,
        'q': q,
        'per_page': perPage,
      },
    );

    Map<String, dynamic> json = response.data;
    return PixabayImages.fromJson(json);
  }
}
