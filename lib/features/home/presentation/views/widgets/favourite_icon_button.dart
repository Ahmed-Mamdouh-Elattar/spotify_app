import 'package:flutter/material.dart';

class FavouriteIconButton extends StatelessWidget {
  const FavouriteIconButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: const Icon(Icons.favorite_border_outlined),
      iconSize: 30,
    );
  }
}
