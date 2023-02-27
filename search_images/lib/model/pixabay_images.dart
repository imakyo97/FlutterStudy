import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:search_images/model/pixabay_info.dart';

part 'pixabay_images.freezed.dart';
part 'pixabay_images.g.dart';

@freezed
class PixabayImages with _$PixabayImages {
  const factory PixabayImages({
    required int total,
    required int totalHits,
    required List<PixabayInfo> hits,
  }) = _PixabayImages;

  factory PixabayImages.fromJson(Map<String, dynamic> json) =>
      _$PixabayImagesFromJson(json);
}
