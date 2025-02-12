import 'package:flutter/material.dart';
import 'sign_in.dart';
import 'sign_up.dart';
import 'forgot_password.dart';

class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text("เข้าสู่ระบบ",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700)),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SignIn()),
                  );
                },
                style: ButtonStyle(
                  overlayColor: WidgetStateProperty.all(
                      Colors.transparent), // Removes the hover effect
                ),
                child: const Text("เข้าสู่ระบบ",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.blueGrey,
                        decoration: TextDecoration.underline)),
              ),
              const SizedBox(height: 4),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SignUp()),
                  );
                },
                style: ButtonStyle(
                  overlayColor: WidgetStateProperty.all(
                      Colors.transparent), // Removes the hover effect
                ),
                child: const Text("สร้างแอคเคาท์ใหม่",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.blueGrey,
                        decoration: TextDecoration.underline)),
              ),
              const SizedBox(height: 4),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const ForgotPassword()),
                  );
                },
                style: ButtonStyle(
                  overlayColor: WidgetStateProperty.all(
                      Colors.transparent), // Removes the hover effect
                ),
                child: const Text("ลืมรหัสผ่าน",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.blueGrey,
                        decoration: TextDecoration.underline)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
