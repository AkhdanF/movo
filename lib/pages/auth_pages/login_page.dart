import 'package:flutter/material.dart';
import 'package:movoapp/pages/auth_pages/signup_page.dart';
import 'package:movoapp/services/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF141516),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 100),
                // App title
                const Text(
                  "MOVO",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFF6F10),
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(height: 20),
                // Subtitle
                const Text(
                  "Get Moving, Get MOVO!",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 40),
                // Email field
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    prefixIcon:
                        const Icon(Icons.email, color: Color(0xFF8C8C8C)),
                    hintText: "Email Address",
                    hintStyle: const TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.black,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 20),
                // Password field
                TextField(
                  controller: _passwordController,
                  obscureText: _isObscured,
                  decoration: InputDecoration(
                    prefixIcon:
                        const Icon(Icons.lock, color: Color(0xFF8C8C8C)),
                    hintText: "Password",
                    hintStyle: const TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.black,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isObscured ? Icons.visibility : Icons.visibility_off,
                        color: const Color(0xFF8C8C8C),
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscured = !_isObscured;
                        });
                      },
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 30),
                // Login button
                ElevatedButton(
                  onPressed: () {
                    String email = _emailController.text.trim();
                    String password = _passwordController.text.trim();

                    if (email.isNotEmpty && password.isNotEmpty) {
                      AuthService().signIn(
                          email: email, password: password, context: context);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please enter email and password'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF6F10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                // "Or login with" text
                const Text(
                  "Or login with",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 20),
                // Social media buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        border: Border.all(
                            color: const Color(0xFFFF6F10), width: 2),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Image.asset(
                          'lib/assets/images/googleIcon.png',
                          width: 40,
                          height: 40,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        border: Border.all(
                            color: const Color(0xFFFF6F10), width: 2),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Image.asset(
                          'lib/assets/images/facebookIcon.png',
                          width: 40,
                          height: 40,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        border: Border.all(
                            color: const Color(0xFFFF6F10), width: 2),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                          child: Image.asset(
                        'lib/assets/images/xIcon.png',
                        color: const Color(0xFFFF6F10),
                        colorBlendMode: BlendMode.srcIn,
                      )),
                    ),
                  ],
                ),
                const Spacer(),
                // Sign-up link
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an Account?",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpPage(),
                          ),
                        );
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Color(0xFFFF6F10),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
