import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spotify_app/core/helper/constants.dart';
import 'package:spotify_app/core/helper/is_dark_theme_extention.dart';
import 'package:spotify_app/core/utils/app_navigation.dart';
import 'package:spotify_app/features/choose_mode/presentation/views/choose_mode_view.dart';

class LogoutAlertDialog extends StatelessWidget {
  const LogoutAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: context.isDarkTheme ? Colors.black : Colors.white,
      icon: const Icon(
        Icons.logout,
      ),
      content: const Text("Are you sure you want to logout?"),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () async {
            await removeUserLocalData();
            if (context.mounted) {
              navigateToRegisterOrSignInView(context);
            }
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              "Logout",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  void navigateToRegisterOrSignInView(BuildContext context) {
    AppNavigation.pushAndRemoveAllWithFadingAnimation(
      context: context,
      view: const ChooseModeView(),
    );
  }

  Future<void> removeUserLocalData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(kUserIdKey);
    await prefs.remove(kUserLoggedIn);
  }
}
