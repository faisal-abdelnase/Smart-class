import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/responsive/app_responsive.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/theme/app_theme_extensions.dart';
import '../../../../core/utils/auth_dialogs.dart';
import '../cubit/auth_cubit.dart';
import '../widgets/auth_card.dart';
import '../widgets/auth_button.dart';
import '../widgets/build_background.dart';
import '../widgets/build_forgot_form_field.dart';
import '../widgets/build_forgot_bottom.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();


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
    super.dispose();
  }

  void handleSendLink() async {
    if (_formKey.currentState!.validate()) {
      context.read<AuthCubit>().forgotPassword(emailController.text.trim());
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

          BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthError && state.status == AuthStatus.forgot) {
                showErrorSnackBar(context, l10n?.translate(state.message) ?? state.message);
              }

              if (state is AuthSuccess && state.status == AuthStatus.forgot) {
                showSuccessSnackBar(context, l10n?.translate("Reset link sent successfully") ?? "Reset link sent successfully");
                  emailController.clear();
              }
            },
            builder: (context, state) {
              final isLoading = state is AuthLoading;
              return SafeArea(
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

                          title: "forgot_password",
                          subtitle: "enter_email_reset",

                          formFields: buildForgotFormField(
                            l10n,
                            emailController,
                          ),

                          actionButton: AuthButton(
                            l10n: l10n,
                            r: r,
                            isLoading: isLoading,
                            onPressed: handleSendLink,
                            textKey: "send_link",
                          ),

                          bottomRow: buildForgotBottom(t, l10n),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
