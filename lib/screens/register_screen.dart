import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pretium_app/screens/login_screen.dart';
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
    State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
 
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

   bool _obscurePassword = true;

   void _toggleVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                 Text(
                'Create Account',
                style: GoogleFonts.robotoCondensed(
                  color: const Color.fromARGB(255, 29, 29, 29),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
               const SizedBox(height: 10),
               Text(
                'Simplify your crypto payments with us',
                style: GoogleFonts.robotoCondensed(
                  color: Colors.grey[700],
                  fontSize: 14,
                ),
              ),

              // Spacer
              const SizedBox(height: 20),

              // First Name
               Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  style: GoogleFonts.robotoCondensed(
                    color: const Color.fromARGB(255, 23, 100, 98),
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                    hintText: "First Name",
                    labelText: "First Name",
                    labelStyle: GoogleFonts.robotoCondensed(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                    prefixIcon: const Icon(
                      FontAwesomeIcons.user,
                      size: 18,
                      color: Color.fromARGB(255, 48, 48, 48),
                    ),
                    border: const OutlineInputBorder(),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 23, 100, 98),
                        width: 0.5,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                  ),
                ),
              ),

                // Spacer
              const SizedBox(height: 5),

              // First Name
               Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  style: GoogleFonts.robotoCondensed(
                    color: const Color.fromARGB(255, 23, 100, 98),
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                    hintText: "Last Name",
                    labelText: "Last Name",
                    labelStyle: GoogleFonts.robotoCondensed(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                    prefixIcon: const Icon(
                      FontAwesomeIcons.user,
                      size: 18,
                      color: Color.fromARGB(255, 48, 48, 48),
                    ),
                    border: const OutlineInputBorder(),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 23, 100, 98),
                        width: 0.5,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                  ),
                ),
              ),

              // spacer 
              const SizedBox(height: 5),
              // Email Input
                 Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  style: GoogleFonts.robotoCondensed(
                    color: const Color.fromARGB(255, 23, 100, 98),
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                    hintText: "Email",
                    labelText: "Email",
                    labelStyle: GoogleFonts.robotoCondensed(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                    prefixIcon: const Icon(
                      FontAwesomeIcons.envelope,
                      size: 18,
                      color: Color.fromARGB(255, 48, 48, 48),
                    ),
                    border: const OutlineInputBorder(),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 23, 100, 98),
                        width: 0.5,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 15,
                    ),
                  ),
                ),
              ),

              //spacer
                const SizedBox(height: 5),
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

              Row(
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (value) {},
                  ),
                   Text(
                      'Accept Terms and Conditions',
                      style: GoogleFonts.robotoCondensed(
                        fontWeight: FontWeight.w200,
                        fontSize: 13,
                        decoration: TextDecoration.underline,
                        color:  Color.fromARGB(255, 23, 100, 98), 
                      ),
                    ),
                ],
              ),
              // spacer
              const SizedBox(height: 15),
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
                    'Create Account',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),

              // spacer 
              const SizedBox(height: 30),
               Center(
                 child: RichText(
                  text: TextSpan(
                    style: GoogleFonts.robotoCondensed(
                      fontSize: 14,
                      fontWeight: FontWeight.w200,
                    ),
                    children: [
                      TextSpan(
                        text: "Already have an account? ",
                        style: GoogleFonts.robotoCondensed(
                          fontSize: 14,
                          fontWeight: FontWeight.w200,
                          color: Colors.grey[700],
                        ),
                      ),
                      WidgetSpan(child: SizedBox(width: 14)),
                      TextSpan(
                        text: "Login",
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
                                    builder: (context) => const LoginScreen(),
                                  ),
                                );
                              },
                      ),
                    ],
                  ),
                               ),
               ),
            ], 
          ),
        ),
      )
    );
  }
}