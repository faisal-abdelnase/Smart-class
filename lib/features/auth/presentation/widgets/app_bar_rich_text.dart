import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class AppBarRichText extends StatelessWidget {
  const AppBarRichText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(text: TextSpan(
      text: "Edu",
      style: Theme.of(context).textTheme.headlineMedium!.copyWith(),
      children: [
        TextSpan(
          text: "Connect",
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
            color: AppColors.primary,
          ),
        )
      ],
    
    ), );
  }
}