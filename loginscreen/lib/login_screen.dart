import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // TITLE
               Text('Welcome back!',
              style: TextStyle(
                fontSize: 36,
                color: Colors.lightBlue[700],
                fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height:8),
              // SUBTITLE
              Text('Start managing your OnlyFans account',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.blueGrey[500],
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(height: 30),
              // EMAIL FIELD
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color(0xFFEAEEF5),

                  prefixIcon: Icon(
                      Icons.email_outlined,
                      color: Colors.lightBlue[700],
                  ),
                  hintText: "onlyfans@gmail.com",
                  hintStyle: TextStyle(
                    color: Colors.grey[500],
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  )
                ),
              ),
              // PASSWORD FIELD
              const SizedBox(height: 10),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xFFEAEEF5),

                    prefixIcon: Icon(
                        Icons.key_outlined,
                        color: Colors.lightBlue[700],
                    ),
                    hintText: "************",
                    hintStyle: TextStyle(
                      color: Colors.grey[500],
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    )
                ),
              ),
              const SizedBox(height: 10),
              // FORGOT PASSWORD
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  fixedSize: const Size(double.maxFinite, 56),
                  elevation: 10,
                ),
                child: const Text("Login"),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot password?",
                    style: TextStyle(
                      color: Colors.blue[600],
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                    ),
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
