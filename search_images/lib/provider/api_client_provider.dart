import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:search_images/api/api_client.dart';

final apiClientProvider = Provider((ref) {
  final dio = Dio();
  return ApiClient(dio: dio);
});
