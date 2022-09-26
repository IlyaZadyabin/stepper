import 'package:freezed_annotation/freezed_annotation.dart';

part 'step_model.freezed.dart';
part 'step_model.g.dart';

@freezed
class StepModel with _$StepModel {
  const factory StepModel({
    String? title,
    String? subtitle,
    String? content,
  }) = _StepModel;

  factory StepModel.fromJson(Map<String, Object?> json) =>
      _$StepModelFromJson(json);
}
