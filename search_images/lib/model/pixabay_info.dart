import 'package:freezed_annotation/freezed_annotation.dart';

part 'pixabay_info.freezed.dart';
part 'pixabay_info.g.dart';

@freezed
class PixabayInfo with _$PixabayInfo {
  const factory PixabayInfo({
    required String imageURL,
    required int likes,
  }) = _PixabayInfo;

  factory PixabayInfo.fromJson(Map<String, dynamic> json) =>
      _$PixabayInfoFromJson(json);
}
