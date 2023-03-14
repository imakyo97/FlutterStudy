import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:search_images/model/pixabay_images.dart';
import 'package:search_images/provider/api_client_provider.dart';

class PixabayNotirier extends StateNotifier<AsyncValue<PixabayImages?>> {
  PixabayNotirier(this.ref) : super(const AsyncValue.data(null));

  final Ref ref;

  Future<void> fetchPixabayImages(String q) async {
    state = const AsyncValue<PixabayImages?>.loading().copyWithPrevious(state);
    state = await AsyncValue.guard(
        () => ref.read(apiClientProvider).fetchPixabayImages(q: q));
  }
}

final pixabayProvider = StateNotifierProvider.autoDispose<PixabayNotirier,
    AsyncValue<PixabayImages?>>((ref) {
  return PixabayNotirier(ref);
});
