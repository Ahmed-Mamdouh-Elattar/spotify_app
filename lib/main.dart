import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:spotify_app/core/configs/app_themes.dart';
import 'package:spotify_app/core/utils/service_locator.dart';
import 'package:spotify_app/features/choose_mode/presentation/manager/choose_mode_cubit/choose_mode_cubit.dart';
import 'package:spotify_app/features/home/data/repo/home_repo/home_repo_imp.dart';

import 'package:spotify_app/features/home/presentation/views/managers/favourites_record_cubit/favorite_record_cubit.dart';
import 'package:spotify_app/features/splash_view/presentation/views/splash_view.dart';
import 'package:spotify_app/firebase_options.dart';
import 'package:spotify_app/simple_bloc_observer.dart';

void main() async {
  Bloc.observer = SimpleBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorageDirectory.web
        : HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final favoritesRecordCubit = FavoritesRecordCubit(getIt.get<HomeRepoImp>());
  favoritesRecordCubit.fetchFavoriteRecordList();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => SpotifyApp(
        favoritesRecordCubit: favoritesRecordCubit,
      ),
    ),
  );
}

class SpotifyApp extends StatelessWidget {
  const SpotifyApp({super.key, required this.favoritesRecordCubit});
  final FavoritesRecordCubit favoritesRecordCubit;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ChooseModeCubit()),
        BlocProvider(
            create: (context) =>
                FavoritesRecordCubit(getIt.get<HomeRepoImp>())),
        BlocProvider<FavoritesRecordCubit>.value(value: favoritesRecordCubit),
      ],
      child: BlocBuilder<ChooseModeCubit, ThemeMode>(
        builder: (context, mode) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppThemes.lightTheme,
            darkTheme: AppThemes.darkTheme,
            themeMode: mode,
            home: const SplashView(),
          );
        },
      ),
    );
  }
}
