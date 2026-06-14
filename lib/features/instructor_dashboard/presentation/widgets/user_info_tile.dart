import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_class/features/auth/presentation/cubit/auth_cubit.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/theme/app_dimension.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_theme_extensions.dart';
import '../../../auth/domain/entiyies/user_role.dart';

class UserInfoTile extends StatelessWidget {
  const UserInfoTile({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final t = theme.extension<AppThemeColors>()!;
    final colorScheme = theme.colorScheme;

    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        final user = state is AuthSuccess ? state.user : null;
        return Row(
          children: [
            CircleAvatar(
              radius: AppDimensions.avatarXS,
              backgroundColor: colorScheme.primary,
              child: Text(
                user != null ? user.name.substring(0, 2).toUpperCase() : 'I',
                style: AppTypography.h4.copyWith(color: colorScheme.onPrimary),
              ),
            ),
            SizedBox(width: AppDimensions.sp3),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user != null ? user.name : 'Instructor Name',
                  style: AppTypography.h3.copyWith(color: t.text1),
                ),
                const SizedBox(height: 4),
                Text(
                  AppLocalizations.getLocalizedUserRole(
                    context,
                    user != null ? user.role : UserRole.instructor,
                  ),
                  style: AppTypography.bodySmall.copyWith(
                    color: colorScheme.primary,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
