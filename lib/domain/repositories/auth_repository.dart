

import '../../data/req_dto/req_login_dto.dart';
import '../../structure/network/tokens_model.dart';

abstract class AuthRepository {

  Future<TokensModel> login({required ReqLoginDto reqDto});

}