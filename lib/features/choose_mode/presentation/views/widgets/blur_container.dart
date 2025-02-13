import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify_app/core/configs/app_text_style.dart';

class BlurContainer extends StatelessWidget {
  const BlurContainer({
    required this.image,
    required this.title,
    super.key,
    this.onTap,
    this.isChoosed = false,
  });
  final String image;
  final String title;
  final bool isChoosed;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              isChoosed
                  ? Positioned(
                      left: 20.5,
                      top: 44,
                      child: Container(
                        height: 35,
                        width: 32,
                        decoration: const BoxDecoration(
                            color: Color(0xff62CD5D),
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(200),
                            )),
                      ),
                    )
                  : const SizedBox(),
              ClipOval(
                child: Container(
                  height: 73,
                  width: 73,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                    child: SvgPicture.asset(
                      image,
                      fit: BoxFit.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 17,
          ),
          Text(
            title,
            style: AppTextStyle.styleMedium17().copyWith(
              color: const Color(0xffDADADA),
            ),
          )
        ],
      ),
    );
  }
}
