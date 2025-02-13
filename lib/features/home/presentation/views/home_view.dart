import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_app/core/utils/service_locator.dart';
import 'package:spotify_app/features/home/data/repo/home_repo/home_repo_imp.dart';
import 'package:spotify_app/features/home/presentation/views/managers/favourites_record_cubit/favorite_record_cubit.dart';
import 'package:spotify_app/features/home/presentation/views/managers/general_data_cubit/home_view_cubit.dart';
import 'package:spotify_app/features/home/presentation/views/managers/quran_and_podcast_cubit/quran_and_podcast_cubit.dart';

import 'package:spotify_app/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    List<dynamic> favoriteRecords =
        BlocProvider.of<FavoritesRecordCubit>(context).favoriteRecords;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GeneralDataCubit(
            getIt.get<HomeRepoImp>(),
          )..getGeneralRecordsData(favoriteRecords),
        ),
        BlocProvider(
          create: (context) => QuranAndPodcastCubit(
            getIt.get<HomeRepoImp>(),
          )..getQuranRecordsData(favoriteRecords),
        ),
      ],
      child: const Scaffold(
        body: HomeViewBody(),
      ),
    );
  }
}
