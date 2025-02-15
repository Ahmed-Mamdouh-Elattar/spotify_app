import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_app/core/configs/assets.dart';
import 'package:spotify_app/core/helper/is_dark_theme_extention.dart';
import 'package:spotify_app/features/choose_mode/presentation/manager/choose_mode_cubit/choose_mode_cubit.dart';
import 'package:spotify_app/features/choose_mode/presentation/views/widgets/blur_container.dart';

class ChooseTheme extends StatelessWidget {
  const ChooseTheme({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlurContainer(
          isChoosed: context.isDarkTheme,
          onTap: () {
            BlocProvider.of<ChooseModeCubit>(context)
                .chooseMode(themeMode: ThemeMode.dark);
          },
          image: Assets.imagesMoon,
          title: "Dark Mode",
        ),
        const SizedBox(
          width: 71,
        ),
        BlurContainer(
          isChoosed: !context.isDarkTheme,
          onTap: () {
            BlocProvider.of<ChooseModeCubit>(context)
                .chooseMode(themeMode: ThemeMode.light);
          },
          image: Assets.imagesSun,
          title: "Light Mode",
        ),
      ],
    );
  }
}
