import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:search_images/provider/api_client_provider.dart';

final pixabayImagesFutureProvider = FutureProvider.autoDispose((ref) async {
  final apiClient = ref.read(apiClientProvider);
  final seatchTerm = ref.watch(searchTermProvider);
  return apiClient.fetchPixabayImages(q: seatchTerm);
});

final searchTermProvider = StateProvider((_) {
  return '月';
});
