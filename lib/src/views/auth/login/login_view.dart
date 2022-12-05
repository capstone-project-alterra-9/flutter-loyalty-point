import 'package:flutter/material.dart';
import 'package:flutter_loyalty_point/src/models/auth/data_request_login_model.dart';
import 'package:flutter_loyalty_point/src/styles/styles.dart';
import 'package:flutter_loyalty_point/src/utils/extensions/string_extension.dart';
import 'package:flutter_loyalty_point/src/utils/types/view_state_type.dart';
import 'package:flutter_loyalty_point/src/view_models/auth/login/login_view_model.dart';
import 'package:flutter_loyalty_point/src/views/auth/register/register_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  static const String routeName = "/auth/login";

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final GlobalKey<FormState> _formKey;

  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();

    _formKey = GlobalKey<FormState>();

    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();

    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // text login section
                  const Text(
                    "Login",
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),

                  // text title section
                  const Text(
                    "Welcome",
                    style: TextStyle(fontSize: 32),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 4),

                  // text subtitle section
                  const Text(
                    "Please enter your account here",
                    style: TextStyle(fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),

                  // form section
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        // textfield username
                        TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: Styles.textFieldAuth.copyWith(
                            label: const Text('Email'),
                          ),
                          validator: (value) => value.toString().isValidEmail()
                              ? null
                              : 'Invalid Email!',
                        ),
                        const SizedBox(height: 20),

                        // textfield password
                        Consumer<LoginViewModel>(
                          builder: (context, value, child) => TextFormField(
                            controller: _passwordController,
                            keyboardType: TextInputType.text,
                            obscureText: value.obscureText,
                            decoration: Styles.textFieldAuth.copyWith(
                              label: const Text('Password'),
                              suffixIcon: IconButton(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                                splashRadius: 24,
                                onPressed: value.changeObscureText,
                                icon: Icon(
                                  value.obscureText
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Styles.colorBlack400,
                                ),
                              ),
                            ),
                            validator: (value) =>
                                value.toString().isValidPassword()
                                    ? null
                                    : "Must be at least 6 characters",
                          ),
                        ),

                        //  end form section
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // link to forgot password
                  InkWell(
                    onTap: () {},
                    child: const Text(
                      "Forgot password?",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // button login section

                  Consumer<LoginViewModel>(
                    builder: (context, value, child) {
                      switch (value.loginState) {
                        case ViewStateType.loading:
                          {
                            return const Center(
                              child: CircularProgressIndicator.adaptive(),
                            );
                          }
                        default:
                          {
                            return ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  Provider.of<LoginViewModel>(context,
                                          listen: false)
                                      .submit(
                                    DataRequestLoginModel(
                                      email: _emailController.text,
                                      password: _passwordController.text,
                                    ),
                                  );
                                }
                              },
                              style: Styles.primaryButton.copyWith(
                                minimumSize: const MaterialStatePropertyAll(
                                  Size.fromHeight(44),
                                ),
                              ),
                              child: const Text("Login"),
                            );
                          }
                      }
                    },
                  ),
                  const SizedBox(height: 32),
                  // link to register
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't you have an account? ",
                        style: TextStyle(fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            RegisterView.routeName,
                          );
                        },
                        child: Text(
                          "Register here",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),

                  // end section
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
