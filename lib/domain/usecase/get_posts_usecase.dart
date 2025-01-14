import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../core/constants/app_error.dart';
import '../../presentation/model.dart';
import '../repository_implementation/data_repository_implementation.dart';
import 'usecase.dart';

class GetPostsUsecse extends UseCase<PostModel, PostParam> {
  final DataRepositoryImpl _dataRepository;

  GetPostsUsecse(this._dataRepository);
  @override
  Future<Either<AppError, PostModel>> call(PostParam params) async {
    Map<String, dynamic> newParams = {};
    newParams.addAll(params.toMap());
    return await _dataRepository.getPosts(newParams);
  }
}

class PostParam extends Equatable {
  final String id;
  final String jsonrpc;
  final String method;
  final Map<String, dynamic> params;

  const PostParam({
    required this.id,
    required this.jsonrpc,
    required this.method,
    required this.params,
  });

  /// Converts the object to a map for JSON serialization
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "jsonrpc": jsonrpc,
      "method": method,
      "params": params, // Include params in the map
    };
  }

  /// Create a PostParam object from a map (useful for deserialization)
  factory PostParam.fromMap(Map<String, dynamic> map) {
    return PostParam(
      id: map['id'] as String,
      jsonrpc: map['jsonrpc'] as String,
      method: map['method'] as String,
      params: Map<String, dynamic>.from(map['params']),
    );
  }

  @override
  List<Object?> get props => [id, jsonrpc, method, params];
}
