import 'package:flutter/cupertino.dart';
import 'package:material_ui/material_ui.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LoginScreen(), debugShowCheckedModeBanner: false);
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Text('WelcomeBack'),
              TextField(
                decoration: InputDecoration(label: const Text('Username')),
                controller: usernameController,
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(label: const Text('Password')),
                controller: passwordController,
              ),

              ElevatedButton(
                onPressed: () {
                  if (usernameController.text == 'admin' &&
                      passwordController.text == '1234') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (dialogContext) => const AlertDialog(
                        title: Text('login failed'),
                        content: Text('user or name password incorrect'),
                      ),
                    );
                  }
                },

                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(child: const Text('Welcome to Home')),
    );
  }
}
