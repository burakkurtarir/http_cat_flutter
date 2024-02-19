import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:http_cat_flutter/features/random_cat/cubit/random_cat_cubit.dart';
import 'package:http_cat_flutter/shared/repositories/cat_repository.dart';

final sl = GetIt.instance;

void init() {
  // External
  sl.registerLazySingleton<http.Client>(() => http.Client());

  // Repository
  sl.registerFactory<CatRepository>(() => CatRepositoryImpl(sl()));

  // Bloc/Cubit
  sl.registerFactory<RandomCatCubit>(() => RandomCatCubit(sl()));
}
