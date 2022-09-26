// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'step_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StepModel _$StepModelFromJson(Map<String, dynamic> json) {
  return _StepModel.fromJson(json);
}

/// @nodoc
mixin _$StepModel {
  String? get title => throw _privateConstructorUsedError;
  String? get subtitle => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StepModelCopyWith<StepModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StepModelCopyWith<$Res> {
  factory $StepModelCopyWith(StepModel value, $Res Function(StepModel) then) =
      _$StepModelCopyWithImpl<$Res>;
  $Res call({String? title, String? subtitle, String? content});
}

/// @nodoc
class _$StepModelCopyWithImpl<$Res> implements $StepModelCopyWith<$Res> {
  _$StepModelCopyWithImpl(this._value, this._then);

  final StepModel _value;
  // ignore: unused_field
  final $Res Function(StepModel) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? subtitle = freezed,
    Object? content = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      subtitle: subtitle == freezed
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String?,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_StepModelCopyWith<$Res> implements $StepModelCopyWith<$Res> {
  factory _$$_StepModelCopyWith(
          _$_StepModel value, $Res Function(_$_StepModel) then) =
      __$$_StepModelCopyWithImpl<$Res>;
  @override
  $Res call({String? title, String? subtitle, String? content});
}

/// @nodoc
class __$$_StepModelCopyWithImpl<$Res> extends _$StepModelCopyWithImpl<$Res>
    implements _$$_StepModelCopyWith<$Res> {
  __$$_StepModelCopyWithImpl(
      _$_StepModel _value, $Res Function(_$_StepModel) _then)
      : super(_value, (v) => _then(v as _$_StepModel));

  @override
  _$_StepModel get _value => super._value as _$_StepModel;

  @override
  $Res call({
    Object? title = freezed,
    Object? subtitle = freezed,
    Object? content = freezed,
  }) {
    return _then(_$_StepModel(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      subtitle: subtitle == freezed
          ? _value.subtitle
          : subtitle // ignore: cast_nullable_to_non_nullable
              as String?,
      content: content == freezed
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StepModel implements _StepModel {
  const _$_StepModel({this.title, this.subtitle, this.content});

  factory _$_StepModel.fromJson(Map<String, dynamic> json) =>
      _$$_StepModelFromJson(json);

  @override
  final String? title;
  @override
  final String? subtitle;
  @override
  final String? content;

  @override
  String toString() {
    return 'StepModel(title: $title, subtitle: $subtitle, content: $content)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StepModel &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.subtitle, subtitle) &&
            const DeepCollectionEquality().equals(other.content, content));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(subtitle),
      const DeepCollectionEquality().hash(content));

  @JsonKey(ignore: true)
  @override
  _$$_StepModelCopyWith<_$_StepModel> get copyWith =>
      __$$_StepModelCopyWithImpl<_$_StepModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StepModelToJson(
      this,
    );
  }
}

abstract class _StepModel implements StepModel {
  const factory _StepModel(
      {final String? title,
      final String? subtitle,
      final String? content}) = _$_StepModel;

  factory _StepModel.fromJson(Map<String, dynamic> json) =
      _$_StepModel.fromJson;

  @override
  String? get title;
  @override
  String? get subtitle;
  @override
  String? get content;
  @override
  @JsonKey(ignore: true)
  _$$_StepModelCopyWith<_$_StepModel> get copyWith =>
      throw _privateConstructorUsedError;
}
