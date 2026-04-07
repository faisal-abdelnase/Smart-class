import 'package:flutter/material.dart';
import 'package:smart_class/core/responsive/app_responsive.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/app_theme_extensions.dart';
import '../widgets/build_auth_row.dart';
import '../widgets/build_background.dart';
import '../widgets/auth_card.dart';
import '../widgets/build_login_form_fields.dart';
import '../widgets/auth_button.dart';


class LoginPage extends StatefulWidget {
  final VoidCallback? onToggleTheme;

  const LoginPage({super.key, this.onToggleTheme});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool _isLoading = false;

  late AnimationController _animController;
  late Animation<double> _fadeAnim;
  late Animation<Offset> _slideAnim;

  @override
  void initState() {
    super.initState();

    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _fadeAnim =
        CurvedAnimation(parent: _animController, curve: Curves.easeOut);

    _slideAnim = Tween<Offset>(
      begin: const Offset(0, 0.06),
      end: Offset.zero,
    ).animate(_fadeAnim);

    _animController.forward();
  }

  @override
  void dispose() {
    _animController.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void handleLogin() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      await Future.delayed(const Duration(seconds: 2));
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).extension<AppThemeColors>()!;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final r = AppResponsive.of(context);
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      body: Stack(
        children: [
          buildBackground(isDark),
          SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: r.hPadding,
                vertical: 20,
              ),
              child: FadeTransition(
                opacity: _fadeAnim,
                child: SlideTransition(
                  position: _slideAnim,
                  child: Form(
                    key: _formKey,
                    child: AuthCard(
                            t: t,
                            r: r,
                            l10n: l10n,
                            isDark: isDark,

                            title: "welcome_back",
                            subtitle: "login_subtitle",

                            formFields: buildLoginFormFields(
                              l10n,
                              emailController,
                              passwordController,
                            ),

                            actionButton: AuthButton(
                              l10n: l10n,
                              r: r,
                              isLoading: _isLoading,
                              onPressed: handleLogin,
                              textKey: "login",
                              ),

                            bottomRow: buildAuthRow(
                              t,
                              l10n,
                              context,
                              "dont_have_account",
                              Routes.signupPage,
                            ),
                          ),
                  ),
                ),
              ),
            ),
          ),
          
        ],
      ),
    );
  }

}