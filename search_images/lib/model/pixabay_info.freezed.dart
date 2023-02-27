// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pixabay_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PixabayInfo _$PixabayInfoFromJson(Map<String, dynamic> json) {
  return _PixabayInfo.fromJson(json);
}

/// @nodoc
mixin _$PixabayInfo {
  String? get previewURL => throw _privateConstructorUsedError;
  int get likes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PixabayInfoCopyWith<PixabayInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PixabayInfoCopyWith<$Res> {
  factory $PixabayInfoCopyWith(
          PixabayInfo value, $Res Function(PixabayInfo) then) =
      _$PixabayInfoCopyWithImpl<$Res, PixabayInfo>;
  @useResult
  $Res call({String? previewURL, int likes});
}

/// @nodoc
class _$PixabayInfoCopyWithImpl<$Res, $Val extends PixabayInfo>
    implements $PixabayInfoCopyWith<$Res> {
  _$PixabayInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? previewURL = freezed,
    Object? likes = null,
  }) {
    return _then(_value.copyWith(
      previewURL: freezed == previewURL
          ? _value.previewURL
          : previewURL // ignore: cast_nullable_to_non_nullable
              as String?,
      likes: null == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PixabayInfoCopyWith<$Res>
    implements $PixabayInfoCopyWith<$Res> {
  factory _$$_PixabayInfoCopyWith(
          _$_PixabayInfo value, $Res Function(_$_PixabayInfo) then) =
      __$$_PixabayInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? previewURL, int likes});
}

/// @nodoc
class __$$_PixabayInfoCopyWithImpl<$Res>
    extends _$PixabayInfoCopyWithImpl<$Res, _$_PixabayInfo>
    implements _$$_PixabayInfoCopyWith<$Res> {
  __$$_PixabayInfoCopyWithImpl(
      _$_PixabayInfo _value, $Res Function(_$_PixabayInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? previewURL = freezed,
    Object? likes = null,
  }) {
    return _then(_$_PixabayInfo(
      previewURL: freezed == previewURL
          ? _value.previewURL
          : previewURL // ignore: cast_nullable_to_non_nullable
              as String?,
      likes: null == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PixabayInfo implements _PixabayInfo {
  const _$_PixabayInfo({required this.previewURL, required this.likes});

  factory _$_PixabayInfo.fromJson(Map<String, dynamic> json) =>
      _$$_PixabayInfoFromJson(json);

  @override
  final String? previewURL;
  @override
  final int likes;

  @override
  String toString() {
    return 'PixabayInfo(previewURL: $previewURL, likes: $likes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PixabayInfo &&
            (identical(other.previewURL, previewURL) ||
                other.previewURL == previewURL) &&
            (identical(other.likes, likes) || other.likes == likes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, previewURL, likes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PixabayInfoCopyWith<_$_PixabayInfo> get copyWith =>
      __$$_PixabayInfoCopyWithImpl<_$_PixabayInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PixabayInfoToJson(
      this,
    );
  }
}

abstract class _PixabayInfo implements PixabayInfo {
  const factory _PixabayInfo(
      {required final String? previewURL,
      required final int likes}) = _$_PixabayInfo;

  factory _PixabayInfo.fromJson(Map<String, dynamic> json) =
      _$_PixabayInfo.fromJson;

  @override
  String? get previewURL;
  @override
  int get likes;
  @override
  @JsonKey(ignore: true)
  _$$_PixabayInfoCopyWith<_$_PixabayInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
