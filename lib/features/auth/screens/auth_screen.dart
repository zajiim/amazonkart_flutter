import 'package:amazon_clone/common/widgets/homepage_button.dart';
import 'package:amazon_clone/common/widgets/homepage_textfield.dart';
import 'package:amazon_clone/constants/variables.dart';
import 'package:amazon_clone/features/auth/services/auth_services.dart';
import 'package:flutter/material.dart';

enum Auth { signup, signin }

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  final AuthService authService = AuthService();
  final _signupFormKey = GlobalKey<FormState>();
  final _signinFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  void signupUser() {
    authService.signupUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
      name: _nameController.text,
    );
  }

  void signinUser() {
    authService.signinUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 80),
              SizedBox(
                height: 80,
                width: double.infinity,
                child: Image.asset(
                  'assets/images/amazon.png',
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                'Sign in to your account',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              ListTile(
                tileColor: _auth == Auth.signup
                    ? GlobalVariables.backgroundColor
                    : GlobalVariables.greyBackgroundColor,
                title: const Text(
                  'Create Account',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                leading: Radio(
                  value: Auth.signup,
                  activeColor: GlobalVariables.secondaryColor,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth = val!;
                    });
                  },
                ),
              ),
              if (_auth == Auth.signup)
                Container(
                  padding: const EdgeInsets.all(8.0),
                  color: GlobalVariables.backgroundColor,
                  child: Form(
                    key: _signupFormKey,
                    child: Column(
                      children: [
                        HomepageTextfield(
                          controller: _nameController,
                          hintText: ('Name'),
                          isObscure: false,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        HomepageTextfield(
                          controller: _emailController,
                          hintText: ('E-mail'),
                          isObscure: false,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        HomepageTextfield(
                          controller: _passwordController,
                          hintText: ('Password'),
                          isObscure: true,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        HomepageButton(
                          onTap: () {
                            if (_signupFormKey.currentState!.validate()) {
                              signupUser();
                            }
                          },
                          text: 'Sign Up',
                        ),
                      ],
                    ),
                  ),
                ),
              ListTile(
                tileColor: _auth == Auth.signin
                    ? GlobalVariables.backgroundColor
                    : GlobalVariables.greyBackgroundColor,
                title: const Text(
                  'Sign In',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                leading: Radio(
                  value: Auth.signin,
                  activeColor: GlobalVariables.secondaryColor,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth = val!;
                    });
                  },
                ),
              ),
              if (_auth == Auth.signin)
                Container(
                  padding: const EdgeInsets.all(8.0),
                  color: GlobalVariables.backgroundColor,
                  child: Form(
                    key: _signinFormKey,
                    child: Column(
                      children: [
                        HomepageTextfield(
                          controller: _emailController,
                          hintText: ('E-mail'),
                          isObscure: false,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        HomepageTextfield(
                          controller: _passwordController,
                          hintText: ('Password'),
                          isObscure: true,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        HomepageButton(
                          onTap: () {
                            if (_signinFormKey.currentState!.validate()) {
                              signinUser();
                            }
                          },
                          text: 'Sign In',
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
