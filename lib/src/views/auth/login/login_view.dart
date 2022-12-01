import 'package:flutter/material.dart';
import 'package:flutter_loyalty_point/src/models/auth/data_request_login_model.dart';
import 'package:flutter_loyalty_point/src/utils/extensions/string_extension.dart';
import 'package:flutter_loyalty_point/src/utils/urls.dart';
import 'package:flutter_loyalty_point/src/view_models/auth/login/login_view_model.dart';
import 'package:flutter_loyalty_point/src/views/auth/register/register_view.dart';
import 'package:flutter_loyalty_point/src/views/home/bottomnav_view.dart';
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

  bool _obscureText = true;

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
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              children: [
                // text login section
                const Text("Login"),
                const SizedBox(height: 20),

                // text title section
                const Text("Welcome Back"),
                const SizedBox(height: 20),

                // text subtitle section
                const Text("Please enter your account here"),
                const SizedBox(height: 20),

                // form section
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // textfield email
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          label: Text('Email'),
                        ),
                        validator: (value) => value.toString().isValidEmail()
                            ? null
                            : 'Invalid Email!',
                      ),
                      const SizedBox(height: 20),

                      // textfield password
                      TextFormField(
                        controller: _passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                          label: const Text('Password'),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: IconButton(
                              onPressed: () => setState(() {
                                _obscureText = !_obscureText;
                              }),
                              icon: Icon(
                                _obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),
                          ),
                        ),
                        validator: (value) => value.toString().isValidPassword()
                            ? null
                            : "Must be at least 6 characters",
                      ),
                      const SizedBox(height: 20),

                      //  end form section
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // link to forgot password
                TextButton(
                  onPressed: () {},
                  child: const Text("Forgot Password"),
                ),
                const SizedBox(height: 20),

                // button login section
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Provider.of<LoginViewModel>(context, listen: false)
                          .submit(
                        DataRequestLoginModel(
                            email: _emailController.text,
                            password: _passwordController.text),
                      );
                    }
                  },
                  child: const Text("Login"),
                ),
                const SizedBox(height: 20),

                // link to register
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't you have an account? "),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(RegisterView.routeName);
                      },
                      child: const Text("Register here"),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),

                // end section
              ],
            ),
          ),
        ),
      ),
    );
  }
}
