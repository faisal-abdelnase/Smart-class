import 'package:flutter/material.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../../../core/responsive/app_responsive.dart';

class AuthButton extends StatelessWidget {
  final AppLocalizations? l10n;
  final AppResponsive r;
  final bool isLoading;
  final VoidCallback onPressed;

  /// key for translation (login / sign_up)
  final String textKey;

  const AuthButton({
    super.key,
    required this.l10n,
    required this.r,
    required this.isLoading,
    required this.onPressed,
    required this.textKey,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: r.sp(48),
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              )
            : Text(
                l10n?.translate(textKey) ?? textKey,
              ),
      ),
    );
  }
}