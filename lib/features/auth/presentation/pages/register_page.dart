import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_class/core/responsive/app_responsive.dart';
import 'package:smart_class/core/utils/extensions.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/app_theme_extensions.dart';
import '../../../../core/utils/auth_dialogs.dart';
import '../cubit/auth_cubit.dart';
import '../view_models/role_model.dart';
import '../widgets/build_auth_row.dart';
import '../widgets/build_background.dart';
import '../widgets/auth_card.dart';
import '../widgets/build_footer.dart';
import '../widgets/build_signup_form_field.dart';
import '../widgets/auth_button.dart';

class SignupPage extends StatefulWidget {
  final VoidCallback? onToggleTheme;

  const SignupPage({super.key, this.onToggleTheme});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
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
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void handleSignup() {
    final role = ModalRoute.of(context)!.settings.arguments as UserRole;

    if (_formKey.currentState!.validate()) {
      log("FORM VALID ✅");
      context.read<AuthCubit>().signup(
        nameController.text.trim(),
        emailController.text.trim(),
        passwordController.text.trim(),
        role.name,
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
                if (state is AuthError && state.status == AuthStatus.signup) {
                  showErrorSnackBar(context, l10n?.translate(state.message) ?? state.message);
                }

                if (state is AuthSuccess && state.status == AuthStatus.signup) {
                  showSuccessSnackBar(context, l10n?.translate("Check your email to verify your account 📧") ?? "Check your email to verify your account 📧");
                  nameController.clear();
                  emailController.clear();
                  passwordController.clear();
                  context.pushReplacementNamed(Routes.verifyEmailPage);
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

                          title: "create_account",
                          subtitle: "join_community",

                          formFields: buildSignUpFormFields(
                            l10n,
                            nameController,
                            emailController,
                            passwordController,
                            context
                          ),

                          actionButton: AuthButton(
                            l10n: l10n,
                            r: r,
                            isLoading: isLoading,
                            onPressed: handleSignup,
                            textKey: "sign_up",
                          ),

                          bottomRow: buildAuthRow(
                            t,
                            l10n,
                            context,
                            "already_have_account",
                            Routes.loginPage,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          buildFooter(t, l10n),
        ],
      ),
    );
  }
}
