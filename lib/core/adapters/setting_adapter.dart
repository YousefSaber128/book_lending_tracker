part of '../entities/setting_entity.dart';

final class SettingAdapter extends TypeAdapter<SettingEntity> {
  @override
  int get typeId => 1;

  @override
  SettingEntity read(final BinaryReader reader) => SettingModel.fromJson(
    Map<String, dynamic>.from(reader.readMap()),
  ).toEntity();

  @override
  void write(final BinaryWriter writer, final SettingEntity obj) =>
      writer.writeMap(SettingModel.fromEntity(obj).toJson());

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(final Object other) =>
      identical(this, other) ||
      other is SettingAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
