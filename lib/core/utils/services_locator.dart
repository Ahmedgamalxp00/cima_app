import 'package:cima_app/core/networking/api_services.dart';
import 'package:cima_app/features/home_feature/data/data_sources/home_local_data_source.dart';
import 'package:cima_app/features/home_feature/data/data_sources/home_remote_data_source.dart';
import 'package:cima_app/features/home_feature/data/repos/home_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServicesLocator() {
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<ApiServices>(ApiServices(getIt.get<Dio>()));
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
      homeRemoteDataSource:
          HomeRemoteDataSourceImpl(apiServices: getIt.get<ApiServices>()),
      homeLocalDataSource: HomeLocalDataSourceImpl()));
}
