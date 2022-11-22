import 'package:flutter/material.dart';

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

  bool _obscureText = true;

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
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // text login section
                const Text("Register"),
                const SizedBox(height: 20),

                // text title section
                const Text("Create Account"),
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

                      // textfield email
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          label: Text('Email'),
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

                // button register section
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {}
                  },
                  child: const Text("Register"),
                ),
                const SizedBox(height: 20),

                // link to register
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Have an account? "),
                    TextButton(
                      onPressed: () {},
                      child: const Text("Login here"),
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
