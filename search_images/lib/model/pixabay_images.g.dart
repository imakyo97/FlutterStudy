// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pixabay_images.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PixabayImages _$$_PixabayImagesFromJson(Map<String, dynamic> json) =>
    _$_PixabayImages(
      total: json['total'] as int,
      totalHits: json['totalHits'] as int,
      hits: (json['hits'] as List<dynamic>)
          .map((e) => PixabayInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PixabayImagesToJson(_$_PixabayImages instance) =>
    <String, dynamic>{
      'total': instance.total,
      'totalHits': instance.totalHits,
      'hits': instance.hits,
    };
