import 'package:dartz/dartz.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
import 'dart:io';
import '../../core/constants/app_error.dart';
import '../../data/data_resource/remote_data_resource.dart';
import '../../presentation/model.dart';

class DataRepositoryImpl {
  final RemoteDataSourceImpl _remoteDataSource;
  // ignore: unused_field
  DataRepositoryImpl(this._remoteDataSource);

  Future<Either<AppError, PostModel>> getPosts(
      Map<String, dynamic> params) async {
    try {
      final response = await _remoteDataSource.getPosts(params);
      return Right(response);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }
}
