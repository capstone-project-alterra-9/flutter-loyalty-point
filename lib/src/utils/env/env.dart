import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'API_SERVER_BASE_URL', obfuscate: true)
  static final apiServerBaseUrl = _Env.apiServerBaseUrl;
}
