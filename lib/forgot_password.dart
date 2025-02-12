// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _emailController = TextEditingController();
  bool _isLoading = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _resetPassword() async {
    setState(() {
      _isLoading = true;
    });

    try {
      await _auth.sendPasswordResetEmail(
        email: _emailController.text.trim(),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text("ส่งลิงก์รีเซ็ตรหัสผ่านไปที่อีเมลของคุณแล้ว")),
      );
      Navigator.pop(context); // กลับไปที่หน้าล็อกอิน
    } on FirebaseAuthException catch (e) {
      String message = e.message ?? 'เกิดข้อผิดพลาด';
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message)));
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("เกิดข้อผิดพลาด")));
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text(
          "ลืมรหัสผ่าน",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: "อีเมล"),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: _isLoading ? null : _resetPassword,
                style: ButtonStyle(
                  overlayColor: WidgetStateProperty.all(
                      Colors.transparent), // Removes the hover effect
                ),
                child: Text(
                  _isLoading ? "กำลังโหลด..." : "รีเซ็ตรหัสผ่าน",
                  style: const TextStyle(
                      fontSize: 16,
                      color: Colors.blueGrey,
                      decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
