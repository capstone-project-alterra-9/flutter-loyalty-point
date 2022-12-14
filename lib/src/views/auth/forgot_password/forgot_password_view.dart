import 'package:flutter/material.dart';
import 'package:flutter_loyalty_point/src/models/auth/data_request_forgot_password_model.dart';
import 'package:flutter_loyalty_point/src/styles/styles.dart';
import 'package:flutter_loyalty_point/src/utils/extensions/string_extension.dart';
import 'package:flutter_loyalty_point/src/utils/types/view_state_type.dart';
import 'package:flutter_loyalty_point/src/view_models/auth/forgot_password/forgot_password_view_model.dart';
import 'package:heroicons/heroicons.dart';
import 'package:provider/provider.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  static const String routeName = "/auth/forgot-password";

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  late final GlobalKey<FormState> _formKey;

  late final TextEditingController _emailController;

  @override
  void initState() {
    super.initState();

    _formKey = GlobalKey<FormState>();

    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();

    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const HeroIcon(
              HeroIcons.arrowLeft,
              style: HeroIconStyle.outline,
              size: 24,
              color: Styles.colorBlack400,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // text login section
                const Text(
                  "Forgot Password",
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),

                // text title section
                const Text(
                  "Recover Your Password",
                  style: TextStyle(fontSize: 28),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),

                // text subtitle section
                const Text(
                  "Enter the email that you used when register to recover your password. You will receive a password reset link.",
                  style: TextStyle(fontSize: 12),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),

                // form section
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // textfield email
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: Styles.textFieldAuth.copyWith(
                          label: const Text('Email'),
                        ),
                        validator: (value) => value.toString().isValidEmail()
                            ? null
                            : 'Must be at least 8 characters & valid email',
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // button  section
                Consumer<ForgotPasswordViewModel>(
                  builder: (context, value, child) {
                    return ElevatedButton(
                      onPressed: value.forgotPasswordState ==
                              ViewStateType.loading
                          ? null
                          : () {
                              if (_formKey.currentState!.validate()) {
                                Provider.of<ForgotPasswordViewModel>(context,
                                        listen: false)
                                    .submit(
                                  DataRequestForgotPasswordModel(
                                    email: _emailController.text,
                                  ),
                                );
                              }
                            },
                      style: Styles.primaryButton.copyWith(
                        minimumSize: const MaterialStatePropertyAll(
                          Size.fromHeight(44),
                        ),
                      ),
                      child: const Text("Send Link"),
                    );
                  },
                ),

                const SizedBox(height: 32),

                Consumer<ForgotPasswordViewModel>(
                  builder: (context, value, child) {
                    if (value.forgotPasswordState != null &&
                        value.forgotPasswordState == ViewStateType.none) {
                      return const Text("Check your email");
                    }

                    return const SizedBox();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}
