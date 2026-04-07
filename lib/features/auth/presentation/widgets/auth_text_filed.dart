import 'package:flutter/material.dart';
import 'package:smart_class/core/localization/app_localizations.dart';


class AuthTextField extends StatefulWidget {
  final String label;
  final String hint;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final bool obscureText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final bool showToggle;
  final AppLocalizations l10n;

  const AuthTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    required this.controller,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.showToggle = false, 
    required this.l10n,
  });

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  bool _obscure = true;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _obscure = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.l10n.translate(widget.label),
          style: theme.textTheme.labelLarge,
        ),
        SizedBox(height: 8),

        Focus(
          onFocusChange: (focused) => setState(() => _isFocused = focused),
          child: TextFormField(
            controller: widget.controller,
            obscureText: widget.showToggle ? _obscure : widget.obscureText,
            keyboardType: widget.keyboardType,
            validator: widget.validator,
            style: theme.textTheme.bodyMedium,

            decoration: InputDecoration(
              hintText: widget.hint,

              prefixIcon: Icon(
                widget.prefixIcon,
                color: _isFocused
                    ? theme.colorScheme.primary
                    : theme.inputDecorationTheme.prefixIconColor,
              ),

              suffixIcon: widget.showToggle
                  ? IconButton(
                      onPressed: () =>
                          setState(() => _obscure = !_obscure),
                      icon: Icon(
                        _obscure
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                      ),
                    )
                  : widget.suffixIcon != null
                      ? Icon(widget.suffixIcon)
                      : null,
            ),
          ),
        ),
      ],
    );
  }
}