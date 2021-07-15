import 'package:flutter/material.dart';
import 'package:game/utils/app_strings.dart';
import 'package:game/utils/ui/theme_config.dart';

class PlayerAvatar extends StatelessWidget {
  final int index;

  const PlayerAvatar(this.index) : super();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: CircleAvatar(
        minRadius: 16,
        maxRadius: 24,
        backgroundColor: AppColors.avatarColors[index],
        child: Image(
          image: AssetImage("${AppStrings.avatarsPath}${"$index"}${AppStrings.avatarExt}"),
        ),
      ),
    );
  }
}
