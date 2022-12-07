import 'package:flutter/material.dart';
import 'package:flutter_loyalty_point/src/models/auth/data_request_register_model.dart';
import 'package:flutter_loyalty_point/src/styles/styles.dart';
import 'package:flutter_loyalty_point/src/utils/extensions/string_extension.dart';
import 'package:flutter_loyalty_point/src/utils/types/view_state_type.dart';
import 'package:flutter_loyalty_point/src/view_models/auth/register/register_view_model.dart';
import 'package:flutter_loyalty_point/src/views/auth/login/login_view.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  static const String routeName = "/auth/register";

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late final GlobalKey<FormState> _formKey;

  late final TextEditingController _usernameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();

    _formKey = GlobalKey<FormState>();

    _usernameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();

    _usernameController.dispose();
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
                children: [
                  // text login section
                  const Text(
                    "Register",
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),

                  // text title section
                  const Text(
                    "Create Your Account",
                    style: TextStyle(fontSize: 32),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 4),

                  // text subtitle section
                  const Text(
                    "Please register below",
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
                          controller: _usernameController,
                          keyboardType: TextInputType.text,
                          decoration: Styles.textFieldAuth.copyWith(
                            label: const Text('Username'),
                          ),
                          validator: (value) =>
                              value.toString().isValidUsername()
                                  ? null
                                  : "Must be at least 3 characters",
                        ),
                        const SizedBox(height: 20),

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
                        const SizedBox(height: 15),

                        // textfield password
                        Consumer<RegisterViewModel>(
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

                  // button register section
                  Consumer<RegisterViewModel>(
                    builder: (context, value, child) {
                      switch (value.registerState) {
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
                                  Provider.of<RegisterViewModel>(context,
                                          listen: false)
                                      .submit(
                                    DataRequestRegisterModel(
                                      username: _usernameController.text,
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
                              child: const Text("Register"),
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
                        "Have an account? ",
                        style: TextStyle(fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(LoginView.routeName);
                        },
                        child: const Text(
                          "Login here",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
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
