

import '../../data/res_dto/res_fetch_user_info_dto.dart';

abstract class UserRepository {
  Future<ResFetchUserInfoDto> fetchUserInfo();
}