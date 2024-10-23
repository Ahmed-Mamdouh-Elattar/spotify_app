import 'package:flutter/material.dart';
import 'package:spotify_app/core/configs/app_text_style.dart';

class AskWithTextButton extends StatelessWidget {
  const AskWithTextButton({
    super.key,
    required this.askContent,
    required this.textButtonContent,
    this.onPressed,
  });
  final String askContent, textButtonContent;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Text(
          askContent,
          style: AppTextStyle.styleMedium14(),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            textButtonContent,
            style: AppTextStyle.styleBold15()
                .copyWith(color: const Color(0xff288CE9)),
          ),
        )
      ],
    );
  }
}
