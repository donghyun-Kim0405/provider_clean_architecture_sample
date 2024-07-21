


import 'package:dio/dio.dart';
import 'package:provider_clean_architecture/data/req_dto/req_login_dto.dart';
import 'package:provider_clean_architecture/structure/enums/request_type.dart';
import 'package:provider_clean_architecture/structure/network/tokens_model.dart';

import '../../domain/repositories/auth_repository.dart';
import '../../structure/base/base_repository.dart';

class AuthRepositoryImpl extends BaseRepository implements AuthRepository {
	AuthRepositoryImpl({required Dio dio}): super(dio: dio);

  @override
  Future<TokensModel> login({required ReqLoginDto reqDto}) async =>
      await callApiWithErrorParser(
          requestType: RequestType.POST,
          endPoint: 'login',
          reqDto: reqDto.toMap(),
          fromMap: TokensModel.fromJson
      );


}