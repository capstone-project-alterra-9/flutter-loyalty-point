import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  static const String routeName = "/auth/login";

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final GlobalKey<FormState> _formKey;

  late final TextEditingController _usernameController;
  late final TextEditingController _passwordController;

  bool _obscureText = true;

  @override
  void initState() {
    super.initState();

    _formKey = GlobalKey<FormState>();

    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();

    _usernameController.dispose();
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                      // textfield username
                      TextFormField(
                        controller: _usernameController,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          label: Text('Username'),
                        ),
                        validator: (value) => value == '' ? "Not Valid!" : null,
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
                    if (_formKey.currentState!.validate()) {}
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
                      onPressed: () {},
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
