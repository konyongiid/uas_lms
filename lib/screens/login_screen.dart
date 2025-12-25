import 'package:flutter/material.dart';
import '../widgets/help_bottom_sheet.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Branding Section
              Padding(
                padding: EdgeInsets.only(top: 16),
                child: Column(
                  children: [
                    Icon(Icons.school, size: 64, color: Color(0xFF2C7DA0)),
                    SizedBox(height: 16),
                    Text(
                      'Learnify',
                      style: Theme.of(context).textTheme.displayMedium!
                          .copyWith(color: Color(0xFF2C7DA0)),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Learning Management System',
                      style: Theme.of(context).textTheme.headlineSmall!
                          .copyWith(color: Color(0xFF6B7280)),
                    ),
                  ],
                ),
              ),
              // Informational Container
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xFFF5F7FA),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    Text(
                      'Gunakan akun institusi untuk masuk',
                      style: Theme.of(
                        context,
                      ).textTheme.bodyLarge!.copyWith(color: Color(0xFF1F2933)),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Untuk mahasiswa dan dosen',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Color(0xFF6B7280),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              // Form Section
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(hintText: 'Email'),
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        hintText: 'Kata Sandi',
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Color(0xFF6B7280),
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Action Section
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to Home Screen
                      Navigator.pushReplacementNamed(context, '/home');
                    },
                    child: Text('Masuk'),
                  ),
                  SizedBox(height: 16),
                  TextButton(
                    onPressed: () => _showHelpBottomSheet(context),
                    child: Text('Bantuan?'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showHelpBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => HelpBottomSheet(),
    );
  }
}
