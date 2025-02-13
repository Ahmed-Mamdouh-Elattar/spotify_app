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
import 'package:spotify_app/features/home/presentation/views/managers/favorite_records/favorite_records_cubit.dart';
import 'package:spotify_app/features/home/presentation/views/managers/general_data_cubit/home_view_cubit.dart';
import 'package:spotify_app/features/home/presentation/views/managers/user_info_cubit/user_info_cubit.dart';

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
  final UserInfoCubit userInfoCubit = UserInfoCubit(getIt.get<HomeRepoImp>());
  userInfoCubit.fetchFavoriteRecordList();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => SpotifyApp(
        userInfoCubit: userInfoCubit,
      ),
    ),
  );
}

class SpotifyApp extends StatelessWidget {
  const SpotifyApp({required this.userInfoCubit, super.key});
  final UserInfoCubit userInfoCubit;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ChooseModeCubit()),
        BlocProvider<UserInfoCubit>.value(value: userInfoCubit),
        BlocProvider(
          create: (context) => GeneralDataCubit(
            getIt.get<HomeRepoImp>(),
          )..getGeneralRecordsData(userInfoCubit.user.favorites),
        ),
        BlocProvider(
          create: (context) => FavoriteRecordsCubit(
            getIt.get<HomeRepoImp>(),
          ),
        )
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
