// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_login_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 1;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      apicode: fields[0] as String,
      url: fields[1] as String,
      apiVersion: fields[2] as String,
      usuario: fields[3] as String,
      senha: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.apicode)
      ..writeByte(1)
      ..write(obj.url)
      ..writeByte(2)
      ..write(obj.apiVersion)
      ..writeByte(3)
      ..write(obj.usuario)
      ..writeByte(4)
      ..write(obj.senha);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
