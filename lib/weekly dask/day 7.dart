import 'package:flutter/cupertino.dart';
import 'package:material_ui/material_ui.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SplashScreen(), debugShowCheckedModeBanner: false);
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(children: [Icon(Icons.school), Text('My Study')]),
        ),
      ),
    );
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
                  if (usernameController.text == 'zamzam' &&
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
    List<String> topics = ['Widgets', 'Navigation', 'Splash Screen'];
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
                (route) => false,
              );
            },
            child: const Text('Logout'),
          ),
        ],
      ),

      body: ListView.builder(
        itemCount: topics.length,
        itemBuilder: (context, index) {
          return ListTile(title: Text(topics[index]));
        },
      ),
    );
  }
}
