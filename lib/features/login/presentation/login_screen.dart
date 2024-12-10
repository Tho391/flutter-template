import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../profile/presentation/profile_screen.dart';
import 'login_provider.dart';

class LoginScreen extends ConsumerWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key}) {
    usernameController.text = "emilys";
    passwordController.text = "emilyspass";
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginState = ref.watch(loginStateProvider);

    // Navigate after successful login
    if (loginState.isSuccess) {
      Future.delayed(Duration.zero, () {
        if (context.mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const ProfileScreen()),
          );
        }
      });
    }

    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: "Username"),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: "Password"),
            ),
            if (loginState.isLoading)
              CircularProgressIndicator()
            else
              ElevatedButton(
                onPressed: () {
                  ref.read(loginStateProvider.notifier).login(
                        usernameController.text,
                        passwordController.text,
                      );
                },
                child: Text("Login"),
              ),
            if (loginState.errorMessage != null)
              Text(
                loginState.errorMessage!,
                style: TextStyle(color: Colors.red),
              ),
          ],
        ),
      ),
    );
  }
}
