import 'package:hive/hive.dart';
part 'user_login_adapter.g.dart';

@HiveType(typeId: 1)
class User extends HiveObject {
  @HiveField(0)
  late String apicode;

  @HiveField(1)
  late String url;

  @HiveField(2)
  late String apiVersion;

  @HiveField(3)
  late String usuario;

  @HiveField(4)
  late String senha;

  User({
    required this.apicode,
    required this.url,
    required this.apiVersion,
    required this.usuario,
    required this.senha,
  });
}
