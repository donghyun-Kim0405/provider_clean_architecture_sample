
import 'package:provider_clean_architecture/data/req_dto/req_login_dto.dart';
import 'package:provider_clean_architecture/domain/repositories/auth_repository.dart';
import 'package:provider_clean_architecture/structure/network/tokens_model.dart';

class MockAuthRepository implements AuthRepository {

  @override
  Future<TokensModel> login({required ReqLoginDto reqDto}) async {
    // 비동기 테스트를 위해 delay 1초 넣기
    await Future.delayed(Duration(seconds: 1));
    return TokensModel(
        accessToken: 'testAccessToken',
        refreshToken: 'testRefreshToken'
    );
  }

}