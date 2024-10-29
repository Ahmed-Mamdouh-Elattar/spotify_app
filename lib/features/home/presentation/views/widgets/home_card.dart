import 'package:flutter/material.dart';
import 'package:spotify_app/core/configs/app_color.dart';
import 'package:spotify_app/core/configs/app_text_style.dart';
import 'package:spotify_app/core/configs/assets.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          alignment: Alignment.bottomRight,
          clipBehavior: Clip.none,
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 125,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: SizedBox(
                    width: constraints.maxWidth * 0.5,
                    child: Text(
                      "Happier Than Ever",
                      style: AppTextStyle.styleBold20().copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(30),
              ),
              child: SizedBox(
                height: 150,
                width: constraints.maxWidth * 0.3,
                child: FittedBox(
                    fit: BoxFit.fill,
                    child: Image.asset(Assets.imagesMashariAlfasyCover)),
              ),
            ),
          ],
        );
      },
    );
  }
}
