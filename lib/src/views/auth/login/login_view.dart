import 'package:flutter/material.dart';
import 'package:flutter_loyalty_point/src/models/auth/data_request_login_model.dart';
import 'package:flutter_loyalty_point/src/view_models/auth/login/login_view_model.dart';
import 'package:flutter_loyalty_point/src/views/auth/register/register_view.dart';
import 'package:flutter_loyalty_point/src/views/widgets/bottomnav_widget.dart';
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
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // text login section
                  Text(
                    "Login",
                    style: GoogleFonts.poppins(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),

                  // text title section
                  Text(
                    "Welcome",
                    style: GoogleFonts.poppins(
                        fontSize: 28, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),

                  // text subtitle section
                  Text(
                    "Please enter your account here",
                    style: GoogleFonts.poppins(fontSize: 13),
                    textAlign: TextAlign.center,
                  ),
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
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            contentPadding: const EdgeInsets.only(
                                top: 10, bottom: 10, left: 10, right: 10),
                            label: Text(
                              'Username',
                              style: GoogleFonts.poppins(),
                            ),
                            hintStyle: GoogleFonts.poppins(),
                          ),
                          validator: (value) =>
                              value == '' ? "Not Valid!" : null,
                        ),
                        const SizedBox(height: 15),

                        // textfield password
                        TextFormField(
                          controller: _passwordController,
                          keyboardType: TextInputType.text,
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            contentPadding: const EdgeInsets.only(
                                top: 10, bottom: 10, left: 10, right: 10),
                            label: Text(
                              'Password',
                              style: GoogleFonts.poppins(),
                            ),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: IconButton(
                                onPressed: () => setState(() {
                                  _obscureText = !_obscureText;
                                }),
                                icon: Icon(
                                  _obscureText
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                              ),
                            ),
                            hintStyle: GoogleFonts.poppins(),
                          ),
                          validator: (value) =>
                              value == '' ? "Mohon isi password" : null,
                        ),
                        const SizedBox(height: 10),

                        //  end form section
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),

                  // link to forgot password
                  InkWell(
                    onTap: () {},
                    child: Text(
                      "Forgot password?",
                      style: GoogleFonts.poppins(
                          fontSize: 13, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // button login section
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Provider.of<LoginViewModel>(context, listen: false)
                            .submit(
                          DataRequestLoginModel(
                              username: _usernameController.text,
                              password: _passwordController.text),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(156, 194, 155, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    child: Text(
                      "Login",
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // link to register
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't you have an account? ",
                        style: GoogleFonts.poppins(fontSize: 13),
                        textAlign: TextAlign.center,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(RegisterView.routeName);
                        },
                        child: Text(
                          "Register here",
                          style: GoogleFonts.poppins(
                              fontSize: 13, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
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
      ),
    );
  }
}
