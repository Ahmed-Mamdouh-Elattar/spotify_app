import 'package:get_it/get_it.dart';
import 'package:spotify_app/features/auth/data/repo/auth_repo_imp.dart';
import 'package:spotify_app/features/home/data/repo/home_repo/home_repo_imp.dart';

final GetIt getIt = GetIt.instance;
void setupGetIt() {
  getIt.registerSingleton<AuthRepoImp>(AuthRepoImp());
  getIt.registerSingleton<HomeRepoImp>(HomeRepoImp());
}
