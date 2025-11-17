import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      GoRouter.of(context).go('/collection');
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final grey = Colors.white70;
    final gold = const Color(0xFFFFB901);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                Text(
                  "Sign in",
                  style: theme.textTheme.displayMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 40),
                _FieldLabel("Email", grey),
                CustomField(
                  controller: email,
                  hintText: "email@email.com",
                  keyboardType: TextInputType.emailAddress,
                  validator: LoginValidator.email,
                  underlineColor: grey,
                  focusColor: gold,
                ),

                const SizedBox(height: 28),

                _FieldLabel("Password", grey),
                PasswordField(
                  controller: password,
                  validator: LoginValidator.password,
                  underlineColor: grey,
                  focusColor: gold,
                ),

                const SizedBox(height: 40),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _submit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: gold,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      "Continue",
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Can't sign in? ",
                      style: theme.textTheme.bodyMedium?.copyWith(color: grey),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Recover password",
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: gold,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _FieldLabel extends StatelessWidget {
  final String text;
  final Color color;

  const _FieldLabel(this.text, this.color);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodySmall?.copyWith(color: color),
    );
  }
}

class CustomField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final Color underlineColor;
  final Color focusColor;

  const CustomField({
    super.key,
    required this.controller,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.validator,
    required this.underlineColor,
    required this.focusColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      cursorColor: focusColor,
      decoration: InputDecoration(
        hintText: hintText,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: underlineColor),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: focusColor, width: 2),
        ),
      ),
    );
  }
}

class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Color underlineColor;
  final Color focusColor;

  const PasswordField({
    super.key,
    required this.controller,
    this.validator,
    required this.underlineColor,
    required this.focusColor,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool hidden = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: hidden,
      validator: widget.validator,
      cursorColor: widget.focusColor,
      decoration: InputDecoration(
        hintText: "••••••••",
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: widget.underlineColor),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: widget.focusColor, width: 2),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            hidden ? Icons.visibility : Icons.visibility_off,
            color: widget.underlineColor,
            size: 20,
          ),
          onPressed: () => setState(() => hidden = !hidden),
        ),
      ),
    );
  }
}

class LoginValidator {
  static String? email(String? value) {
    if (value == null || value.isEmpty) return "Email is required.";
    if (!value.contains('@')) return "Invalid email.";
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) return "Password is required.";
    return null;
  }
}
