import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:kml_flutter_app/core/network/app_client.dart';
import 'package:kml_flutter_app/core/network/network_info.dart';
import 'package:kml_flutter_app/features/changepassword/data/change_pass_remote_data_source.dart';
import 'package:kml_flutter_app/features/changepassword/data/change_pass_repository_impl.dart';
import 'package:kml_flutter_app/features/changepassword/domain/change_pass_repository.dart';
import 'package:kml_flutter_app/features/changepassword/domain/change_pass_use_case.dart';
import 'package:kml_flutter_app/features/changepassword/presentation/change_pass/change_pass_bloc.dart';
import 'package:kml_flutter_app/features/login/data/datasources/login_local_data_source.dart';
import 'package:kml_flutter_app/features/login/data/datasources/login_local_data_source_impl.dart';
import 'package:kml_flutter_app/features/login/data/datasources/login_remote_data_source.dart';
import 'package:kml_flutter_app/features/login/data/datasources/login_remote_data_source_impl.dart';
import 'package:kml_flutter_app/features/login/data/login_repository_impl.dart';
import 'package:kml_flutter_app/features/login/domain/login_repository.dart';
import 'package:kml_flutter_app/features/login/domain/usecases/get_saved_log_data_use_case.dart';
import 'package:kml_flutter_app/features/login/domain/usecases/send_log_data_use_case.dart';
import 'package:kml_flutter_app/features/login/presentation/bloc/login/login_bloc.dart';
import 'package:kml_flutter_app/features/profile/data/datasources/profile_remote_data_source.dart';
import 'package:kml_flutter_app/features/profile/data/datasources/profile_remote_data_source_impl.dart';
import 'package:kml_flutter_app/features/profile/data/profile_repository_impl.dart';
import 'package:kml_flutter_app/features/profile/domain/profile_repository.dart';
import 'package:kml_flutter_app/features/profile/domain/usecases/fetch_profile_use_case.dart';
import 'package:kml_flutter_app/features/profile/presentation/profile/profile_bloc.dart';
import 'package:kml_flutter_app/features/work_history/data/work_remote_data_source.dart';
import 'package:kml_flutter_app/features/work_history/data/work_repository_impl.dart';
import 'package:kml_flutter_app/features/work_history/domain/fetch_works_use_case.dart';
import 'package:kml_flutter_app/features/work_history/domain/work_repository.dart';
import 'package:kml_flutter_app/features/work_history/presentation/bloc/work_history_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Features - Login
  sl.registerFactory(() => LoginBloc(sl(), sl()));
  sl.registerLazySingleton(() => SendLogDataUseCase(sl()));
  sl.registerLazySingleton(() => GetSavedLogDataUseCase(sl()));
  sl.registerLazySingleton<LoginRemoteDataSource>(() => LoginRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<LoginLocalDataSource>(() => LoginLocalDataSourceImpl(sl()));
  sl.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl(sl(), sl(), sl()));

  // Features - Profile
  sl.registerFactory(() => ProfileBloc(sl()));
  sl.registerLazySingleton(() => FetchProfileUseCase(sl()));
  sl.registerLazySingleton<ProfileRemoteDataSource>(() => ProfileRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<ProfileRepository>(() => ProfileRepositoryImpl(sl(), sl()));

  // Features - ChangePass
  sl.registerFactory(() => ChangePassBloc(sl()));
  sl.registerLazySingleton(() => ChangePassUseCase(sl()));
  sl.registerLazySingleton<ChangePassRemoteDataSource>(() => ChangePassRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<ChangePassRepository>(() => ChangePassRepositoryImpl(sl(), sl()));

  // Features - WorkHistory
  sl.registerFactory(() => WorkHistoryBloc(sl()));
  sl.registerLazySingleton(() => FetchWorkUseCase(sl()));
  sl.registerLazySingleton<WorkRemoteDataSource>(() => WorkRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<WorkRepository>(() => WorkRepositoryImpl(sl(), sl()));

  // Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => AppClient());
  sl.registerLazySingleton(() => DataConnectionChecker());

}