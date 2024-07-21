

import 'package:dio/dio.dart';
import 'package:provider_clean_architecture/data/res_dto/res_fetch_user_info_dto.dart';
import 'package:provider_clean_architecture/structure/enums/request_type.dart';

import '../../domain/repositories/user_repository.dart';
import '../../structure/base/base_repository.dart';

class UserRepositoryImpl extends BaseRepository implements UserRepository {
	UserRepositoryImpl({required Dio dio}): super(dio: dio);

  @override
  Future<ResFetchUserInfoDto> fetchUserInfo() async =>
      await callApiWithErrorParser<ResFetchUserInfoDto>(
          requestType: RequestType.GET,
          endPoint: 'info',
          reqDto: null,
          fromMap: ResFetchUserInfoDto.fromMap
      );

}