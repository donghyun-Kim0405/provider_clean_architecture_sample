import '../../structure/configs/base_build_config.dart';
import '../../structure/configs/env_enums.dart';

class BuildConfig extends BaseBuildConfig {
  static late BuildConfig _instance;

  static BuildConfig get instance {
    if (_instance == null) {
      throw Exception("BuildConfig is not initialized. Call initialize() first.");
    }
    return _instance;
  }

  final bool usingMockRepository;

  BuildConfig._internal({
    required EnvType envType,
    required String appTitle,
    String? baseUrl,
    String? accessTokenEndPoint,
    String? refreshTokenEndPoint,
    this.usingMockRepository = false,
  }) : super(
    envType: envType,
    appTitle: appTitle,
    baseUrl: baseUrl ?? "",
    accessTokenEndPoint: accessTokenEndPoint ?? "",
    refreshTokenEndPoint: refreshTokenEndPoint ?? "",
  );

  static void initialize({
    required EnvType envType,
    required String appTitle,
    String? baseUrl,
    String? accessTokenEndPoint,
    String? refreshTokenEndPoint,
    bool usingMockRepository = false,
  }) {
    _instance = BuildConfig._internal(
      envType: envType,
      appTitle: appTitle,
      baseUrl: baseUrl,
      accessTokenEndPoint: accessTokenEndPoint,
      refreshTokenEndPoint: refreshTokenEndPoint,
      usingMockRepository: usingMockRepository,
    );
  }
}
