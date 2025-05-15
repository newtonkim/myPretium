import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pretium_app/screens/forget_password.dart';
import 'package:pretium_app/screens/register_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _obscurePassword = true;
  bool _rememberMe = false;

  final RegExp emailValidator = RegExp(
    r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
  );

  void _toggleVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/images/wallet_image.png', height: 80),
              const SizedBox(height: 20),
              Text(
                'Welcome Back!',
                style: GoogleFonts.robotoCondensed(
                  color: const Color.fromARGB(255, 29, 29, 29),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Sign in to continue',
                style: GoogleFonts.robotoCondensed(
                  color: Colors.grey[700],
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 30),

              // Email Input
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  style: GoogleFonts.robotoCondensed(
                    color: const Color.fromARGB(255, 23, 100, 98),
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                    hintText: "Email",
                    labelText: "Email",
                    labelStyle: GoogleFonts.robotoCondensed(
                      color: const Color.fromARGB(255, 23, 100, 98),
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                    prefixIcon: const Icon(
                      FontAwesomeIcons.envelope,
                      size: 18,
                      color: Colors.grey,
                    ),
                    border: const OutlineInputBorder(),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 23, 100, 98),
                        width: 1.0,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              // Password Input
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: TextField(
                  controller: passwordController,
                  obscureText: _obscurePassword,
                  style: GoogleFonts.robotoCondensed(
                    color: const Color.fromARGB(255, 23, 100, 98),
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                    hintText: "Password",
                    labelText: "Password",
                    labelStyle: GoogleFonts.robotoCondensed(
                      color: const Color.fromARGB(255, 23, 100, 98),
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                    prefixIcon: const Icon(
                      FontAwesomeIcons.lock,
                      size: 18,
                      color: Colors.grey,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? FontAwesomeIcons.eyeSlash
                            : FontAwesomeIcons.eye,
                        size: 18,
                        color: Colors.grey,
                      ),
                      onPressed: _toggleVisibility,
                    ),
                    border: const OutlineInputBorder(),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 23, 100, 98),
                        width: 1.0,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 25),
              RichText(
                text: TextSpan(
                  style: GoogleFonts.robotoCondensed(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                  children: [
                    // Simulate checkbox behavior
                    WidgetSpan(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _rememberMe = !_rememberMe;
                          });
                        },
                        child: Icon(
                          _rememberMe ? Icons.check_box : Icons.check_box_outline_blank,
                          size: 18,
                           color: Colors.grey,
                        ),
                      ),
                    ),
                    const WidgetSpan(child: SizedBox(width: 8)),

                    TextSpan(
                      text: 'Remember me',
                      style: GoogleFonts.robotoCondensed(
                        fontWeight: FontWeight.w200,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          setState(() {
                            _rememberMe = !_rememberMe;
                          });
                        },
                    ),

                    // Spacer
                    const WidgetSpan(child: SizedBox(width: 160)),

                    // Forget password
                    TextSpan(
                      text: 'Forgot Password?',
                      style: GoogleFonts.robotoCondensed(
                      color: const Color.fromARGB(255, 23, 100, 98),
                      fontWeight: FontWeight.w600,
                      
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ForgotPassword(),
                                ),
                            );
                        },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),
              // Login Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(23, 100, 98, 1),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),

              const SizedBox(height: 20),
              // Sign Up Link
              RichText(
                text: TextSpan(
                  style: GoogleFonts.robotoCondensed(
                    fontSize: 14,
                    fontWeight: FontWeight.w200,
                  ),
                  children: [
                    TextSpan(
                      text: "Don't have an account? ",
                      style: GoogleFonts.robotoCondensed(
                        fontSize: 14,
                        fontWeight: FontWeight.w200,
                        color: Colors.grey[700],
                      ),
                    ),
                    WidgetSpan(child: SizedBox(width: 14)),
                    TextSpan(
                      text: "Sign up",
                      style: GoogleFonts.robotoCondensed(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 23, 100, 98),
                      ),
                      recognizer:
                          TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const RegisterScreen(),
                                ),
                              );
                            },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
