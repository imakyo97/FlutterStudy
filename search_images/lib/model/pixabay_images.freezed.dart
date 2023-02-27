// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pixabay_images.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PixabayImages _$PixabayImagesFromJson(Map<String, dynamic> json) {
  return _PixabayImages.fromJson(json);
}

/// @nodoc
mixin _$PixabayImages {
  int get total => throw _privateConstructorUsedError;
  int get totalHits => throw _privateConstructorUsedError;
  List<PixabayInfo> get hits => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PixabayImagesCopyWith<PixabayImages> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PixabayImagesCopyWith<$Res> {
  factory $PixabayImagesCopyWith(
          PixabayImages value, $Res Function(PixabayImages) then) =
      _$PixabayImagesCopyWithImpl<$Res, PixabayImages>;
  @useResult
  $Res call({int total, int totalHits, List<PixabayInfo> hits});
}

/// @nodoc
class _$PixabayImagesCopyWithImpl<$Res, $Val extends PixabayImages>
    implements $PixabayImagesCopyWith<$Res> {
  _$PixabayImagesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? totalHits = null,
    Object? hits = null,
  }) {
    return _then(_value.copyWith(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      totalHits: null == totalHits
          ? _value.totalHits
          : totalHits // ignore: cast_nullable_to_non_nullable
              as int,
      hits: null == hits
          ? _value.hits
          : hits // ignore: cast_nullable_to_non_nullable
              as List<PixabayInfo>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PixabayImagesCopyWith<$Res>
    implements $PixabayImagesCopyWith<$Res> {
  factory _$$_PixabayImagesCopyWith(
          _$_PixabayImages value, $Res Function(_$_PixabayImages) then) =
      __$$_PixabayImagesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int total, int totalHits, List<PixabayInfo> hits});
}

/// @nodoc
class __$$_PixabayImagesCopyWithImpl<$Res>
    extends _$PixabayImagesCopyWithImpl<$Res, _$_PixabayImages>
    implements _$$_PixabayImagesCopyWith<$Res> {
  __$$_PixabayImagesCopyWithImpl(
      _$_PixabayImages _value, $Res Function(_$_PixabayImages) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? totalHits = null,
    Object? hits = null,
  }) {
    return _then(_$_PixabayImages(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      totalHits: null == totalHits
          ? _value.totalHits
          : totalHits // ignore: cast_nullable_to_non_nullable
              as int,
      hits: null == hits
          ? _value._hits
          : hits // ignore: cast_nullable_to_non_nullable
              as List<PixabayInfo>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PixabayImages implements _PixabayImages {
  const _$_PixabayImages(
      {required this.total,
      required this.totalHits,
      required final List<PixabayInfo> hits})
      : _hits = hits;

  factory _$_PixabayImages.fromJson(Map<String, dynamic> json) =>
      _$$_PixabayImagesFromJson(json);

  @override
  final int total;
  @override
  final int totalHits;
  final List<PixabayInfo> _hits;
  @override
  List<PixabayInfo> get hits {
    if (_hits is EqualUnmodifiableListView) return _hits;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hits);
  }

  @override
  String toString() {
    return 'PixabayImages(total: $total, totalHits: $totalHits, hits: $hits)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PixabayImages &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.totalHits, totalHits) ||
                other.totalHits == totalHits) &&
            const DeepCollectionEquality().equals(other._hits, _hits));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, total, totalHits,
      const DeepCollectionEquality().hash(_hits));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PixabayImagesCopyWith<_$_PixabayImages> get copyWith =>
      __$$_PixabayImagesCopyWithImpl<_$_PixabayImages>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PixabayImagesToJson(
      this,
    );
  }
}

abstract class _PixabayImages implements PixabayImages {
  const factory _PixabayImages(
      {required final int total,
      required final int totalHits,
      required final List<PixabayInfo> hits}) = _$_PixabayImages;

  factory _PixabayImages.fromJson(Map<String, dynamic> json) =
      _$_PixabayImages.fromJson;

  @override
  int get total;
  @override
  int get totalHits;
  @override
  List<PixabayInfo> get hits;
  @override
  @JsonKey(ignore: true)
  _$$_PixabayImagesCopyWith<_$_PixabayImages> get copyWith =>
      throw _privateConstructorUsedError;
}
