import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_class/core/responsive/app_responsive.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/app_theme_extensions.dart';
import '../../../../core/utils/auth_dialogs.dart';
import '../../../../core/utils/extensions.dart';
import '../cubit/auth_cubit.dart';
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
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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

    _fadeAnim = CurvedAnimation(parent: _animController, curve: Curves.easeOut);

    _slideAnim = Tween<Offset>(
      begin: const Offset(0, 0.06),
      end: Offset.zero,
    ).animate(_fadeAnim);

    _animController.forward();
  }

  @override
  void dispose() {
    _animController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void handleLogin() async {
    if (_formKey.currentState!.validate()) {
      context.read<AuthCubit>().login(
        emailController.text.trim(),
        passwordController.text.trim(),
      );
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
            child: BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthError && state.status == AuthStatus.login) {
                showErrorSnackBar(context, l10n?.translate(state.message) ?? state.message);
              }

              if (state is AuthError &&
                  state.status == AuthStatus.login &&
                  state.message.contains("verify")) {

                Navigator.pushNamed(context, Routes.verifyEmailPage);
              }

              if (state is AuthSuccess && state.status == AuthStatus.login) {
                showSuccessSnackBar(context, l10n?.translate("Login successful") ?? "Login successful");
                  emailController.clear();
                  passwordController.clear();

                  context.pushReplacementNamed(Routes.instructorFormPage);
              }
              },
              builder: (context, state) {
                final isLoading = state is AuthLoading;
                return SingleChildScrollView(
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
                            context,
                          ),

                          actionButton: AuthButton(
                            l10n: l10n,
                            r: r,
                            isLoading: isLoading,
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
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
