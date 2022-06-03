import 'package:nl_web/core/di/di_module.dart';
import 'package:nl_web/core/network/network_info.dart';
import 'package:nl_web/features/_sample_feature/data/datasources/local/post_local_data_source.dart';
import 'package:nl_web/features/_sample_feature/data/datasources/remote/post_remote_data_source.dart';
import 'package:nl_web/features/_sample_feature/data/repositories/post_repository.dart';
import 'package:nl_web/features/_sample_feature/domain/repositories/post_repository.dart';
import 'package:nl_web/features/_sample_feature/domain/usecase/get_posts.dart';
import 'package:nl_web/features/_sample_feature/presentation/bloc/post_bloc.dart';

class PostModule extends DIModule {
  @override
  provides() {
    // BLoC
    sl.registerFactory(() => PostBloc(getPosts: sl()));

    // Use case
    sl.registerLazySingleton(() => GetPosts(sl()));

    // Repository
    sl.registerLazySingleton<PostRepository>(() => PostRepositoryImpl(
          networkInfo: sl(),
          postLocalDataSource: sl(),
          postRemoteDatasource: sl(),
        ));

    // Datasource
    sl.registerLazySingleton<PostLocalDataSource>(
        () => PostLocalDataSourceImpl());
    sl.registerLazySingleton<PostRemoteDataSource>(
        () => PostRemoteDataSource(sl()));

    // Core
    sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl.instance);
  }
}
