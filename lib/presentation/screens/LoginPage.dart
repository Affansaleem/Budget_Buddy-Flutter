import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../app/constants.dart';
import 'package:google_fonts/google_fonts.dart'; // Import the package

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  late bool _isVisible;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _isVisible = false;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _signInWithFacebook() async {
    try {
      setState(() {
        _isLoading = true;
      });

      final supabase = Supabase.instance.client;

      final bool loginInitiated = await supabase.auth.signInWithOAuth(
        OAuthProvider.facebook,
      );

      if (loginInitiated) {
        CherryToast.success(
          title: const Text(
              "Facebook Login Initiated! Complete in browser",
              style: TextStyle(color: Colors.black)),
          displayIcon: true,
          animationType: AnimationType.fromTop,
        ).show(context);
        Navigator.pushReplacementNamed(context, "/dashboard");
      } else {
        CherryToast.error(
          title: const Text("Failed to initiate Facebook Login",
              style: TextStyle(color: Colors.black)),
          displayIcon: true,
          animationType: AnimationType.fromTop,
        ).show(context);
      }
    } catch (e) {
      CherryToast.error(
        title: const Text("Login Process Failed",
            style: TextStyle(color: Colors.black)),
        displayIcon: true,
        animationType: AnimationType.fromTop,
      ).show(context);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _signIn() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    try {
      setState(() {
        _isLoading = true;
      });
      final AuthResponse res =
          await Supabase.instance.client.auth.signInWithPassword(
        email: email,
        password: password,
      );
      final Session? session = res.session;
      final User? user = res.user;

      if (user != null) {
        CherryToast.success(
          title: const Text("Login Successfully!",
              style: TextStyle(color: Colors.black)),
          displayIcon: true,
          animationType: AnimationType.fromTop,
        ).show(context);
        Navigator.pushReplacementNamed(context, "/dashboard");
      }
    } catch (e) {
      CherryToast.error(
        title:
            const Text("Process Failed", style: TextStyle(color: Colors.black)),
        displayIcon: true,
        animationType: AnimationType.fromTop,
      ).show(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  height: 400,
                  width: 400,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade600,
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 5),
                      )
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Stack(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Image.asset(
                              'assets/icons/BB.png',
                              height: 50,
                              width: 50,
                            ),
                          ),
                        ],
                      ),
                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          hintText: 'Enter your email',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: !_isVisible,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Enter your password',
                          border: const OutlineInputBorder(),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isVisible
                                  ? Icons.check_box
                                  : Icons.check_box_outline_blank,
                              color: AppColors.primaryColor,
                            ),
                            onPressed: () {
                              setState(() {
                                _isVisible = !_isVisible;
                              });
                            },
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: const Color(0xFFCDDEFB),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 5,
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            await _signIn();
                            setState(() {
                              _isLoading = false;
                            });
                          }
                        },
                        child: _isLoading
                            ? CircularProgressIndicator(
                                strokeAlign: BorderSide.strokeAlignCenter,
                                strokeWidth: 3,
                              )
                            : Text(
                                'Sign In',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                      const SizedBox(height: 20),
                      RichText(
                        text: TextSpan(
                          text: 'Not have an account? ',
                          style: const TextStyle(
                              fontSize: 12, color: Colors.blueAccent),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Sign up',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamed(context, '/register');
                                  }),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            hoverColor: Colors.grey,
                              onTap: () {
                                print("Google login");
                              },
                              child: Image.asset(
                                "assets/icons/google.png",
                                height: 20,
                                width: 20,
                              )),
                          IconButton(
                              onPressed: () async {
                                await _signInWithFacebook();
                              },
                              icon: Icon(
                                Icons.facebook,
                                color: Colors.blue,
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
