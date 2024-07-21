

import 'package:provider_clean_architecture/data/res_dto/res_fetch_user_info_dto.dart';
import 'package:provider_clean_architecture/domain/repositories/user_repository.dart';

class MockUserRepository implements UserRepository {

  @override
  Future<ResFetchUserInfoDto> fetchUserInfo() async {
    await Future.delayed(Duration(seconds: 1));
    return ResFetchUserInfoDto(
      age: '10',
      birth: '2022.12.22',
      name: 'testName'
    );
  }

}