// import 'package:data_connection_checker/data_connection_checker.dart';
// import 'package:get_it/get_it.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
// import 'dataProviders/local_data_provider.dart';
// import 'dataProviders/network/Network_info.dart';
// import 'dataProviders/remote_data_provider.dart';
// import 'features/Favorite/data/repository/ProdectsRepository.dart';
// import 'features/Favorite/presintation/manager/Prodects_bloc.dart';
// import 'features/Perofile/data/repository/ProfileRepository.dart';
// import 'features/Perofile/presintation/manager/Profile_bloc.dart';
// import 'features/Regstrtion/data/repository/LoginRepository.dart';
// import 'features/Regstrtion/presintation/manager/Login_bloc.dart';
// import 'features/Main/data/repository/TechersRepository.dart';
// import 'features/Main/presintation/manager/Techers_bloc.dart';
//
//
// final sl = GetIt.instance; //sl = service locator
//
// Future<void> init() async {
//   print('start injection');
//
// //  ! Features
// //   _initRegisterFeature();
//
//   _initFavoriteFeature();
//   _initTechersFeature();
//   _initProfileFeature();
//   _initloginFeature();
//
//   ///service provider
//
//   //! Core
//   sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
//   //data providers
//
//   // data sources
//   sl.registerLazySingleton<RemoteDataProvider>(() => RemoteDataProvider(client: sl()));
//   sl.registerLazySingleton<LocalDataProvider>(() => LocalDataProvider(sharedPreferences: sl()));
//
//   //! External
//   final sharedPreferences = await SharedPreferences.getInstance();
//   sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
//   sl.registerLazySingleton(() => http.Client());
//   sl.registerLazySingleton(() => DataConnectionChecker());
//
// }
//
//
//
// void _initFavoriteFeature() {
// //bloc
//   sl.registerFactory(() => FavoriteBloc(repository: sl()));
//
//   //repositories
//   sl.registerLazySingleton<FavoriteRepository>(
//     () => FavoriteRepository(
//       remoteDataProvider: sl(),
//       localDataProvider: sl(),
//       networkInfo: sl(),
//     ),
//   );
//
// }
// void _initTechersFeature() {
// //bloc
//   sl.registerFactory(() => TechersBloc(repository: sl()));
//
//   //repositories
//   sl.registerLazySingleton<TechersRepository>(
//         () => TechersRepository(
//       remoteDataProvider: sl(),
//       localDataProvider: sl(),
//       networkInfo: sl(),
//     ),
//   );
//
// }
// void _initProfileFeature() {
// //bloc
//   sl.registerFactory(() => ProfileBlocS(repository: sl()));
//   sl.registerFactory(() => ProfileBlocT(repository: sl()));
//
//   //repositories
//   sl.registerLazySingleton<ProfileRepository>(
//         () => ProfileRepository(
//       remoteDataProvider: sl(),
//       localDataProvider: sl(),
//       networkInfo: sl(),
//     ),
//   );
//
// }
// void _initloginFeature() {
// //bloc
//   sl.registerFactory(() => LoginBloc(repository: sl()));
//   sl.registerFactory(() => SignupBloc(repository: sl()));
//
//   //repositories
//   sl.registerLazySingleton<LoginRepository>(
//         () => LoginRepository(
//       remoteDataProvider: sl(),
//       localDataProvider: sl(),
//       networkInfo: sl(),
//     ),
//   );
//
// }
//
//
//
//
