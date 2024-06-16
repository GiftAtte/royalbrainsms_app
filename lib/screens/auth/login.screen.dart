import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:royalbrainsmsapp/components/app_button.component.dart';
import 'package:royalbrainsmsapp/components/app_input.component.dart';
import 'package:royalbrainsmsapp/providers/user.provider.dart';
import 'package:royalbrainsmsapp/utility/app_theme.util.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'School Management App',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primaryColor,
                  ),
                ),
                const SizedBox(height: 32),
                AppInput(
                  controller: usernameController,
                  hintText: 'Username',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                AppInput(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 32),
                isLoading
                    ? const CircularProgressIndicator(color: AppTheme.primaryColor)
                    : AppButton(
                        text: 'Login',
                        onPressed: () async {
                          setState(() {
                            isLoading = true;
                          });

                          try {
                            await userProvider.login(
                              usernameController.text,
                              passwordController.text,
                            );
                            // Redirect based on user role
                            final userRole = userProvider.user?.role;
                            if (userRole == 'teacher') {
                              Navigator.pushNamed(context, '/teacher');
                            } else if (userRole == 'parent') {
                              Navigator.pushNamed(context, '/parent');
                            } else if (userRole == 'admin') {
                              Navigator.pushNamed(context, '/admin');
                            } else {
                              Navigator.pushNamed(context, '/students');
                            }
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Login failed: $e')),
                            );
                          } finally {
                            setState(() {
                              isLoading = false;
                            });
                          }
                        },
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
