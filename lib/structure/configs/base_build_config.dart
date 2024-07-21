
import 'package:provider_clean_architecture/structure/configs/env_enums.dart';

abstract class BaseBuildConfig {

  final EnvType envType;
  final String appTitle;
  final String baseUrl;
  final String accessTokenEndPoint;
  final String refreshTokenEndPoint;

  BaseBuildConfig({
    required this.envType,
    required this.appTitle,
    this.baseUrl = '',
    this.accessTokenEndPoint = '',
    this.refreshTokenEndPoint = '',
  });




}