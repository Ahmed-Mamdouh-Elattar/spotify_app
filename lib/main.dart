import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:spotify_app/core/configs/app_themes.dart';
import 'package:spotify_app/core/utils/service_locator.dart';
import 'package:spotify_app/features/choose_mode/presentation/manager/choose_mode_cubit/choose_mode_cubit.dart';
import 'package:spotify_app/features/splash_view/presentation/views/splash_view.dart';
import 'package:spotify_app/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const SpotifyApp());
}

class SpotifyApp extends StatelessWidget {
  const SpotifyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChooseModeCubit(),
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
