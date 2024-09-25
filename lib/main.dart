import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 122, 62, 227)),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    String email = _emailController.text;
    String password = _passwordController.text;

    // เช็คข้อมูลการล็อคอิน (สามารถปรับเป็นเงื่อนไขจริงตามการเชื่อมต่อ API)
    if (email == "test@example.com" && password == "password") {
      // เมื่อข้อมูลถูกต้อง นำไปที่หน้าแสดงคำว่า "สวัสดี"
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const GreetingPage()),
      );
    } else {
      // แจ้งเตือนเมื่อข้อมูลผิด
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Login Failed'),
            content: const Text('Incorrect email or password.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  void _forgotPassword() {
    if (kDebugMode) {
      print('Forgot Password Clicked');
    }
  }

  void _createAccount() {
    if (kDebugMode) {
      print('Create Account Clicked');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _login,
              child: const Text('Login'),
            ),
            TextButton(
              onPressed: _forgotPassword,
              child: const Text('Forgot Password?'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _createAccount,
              child: const Text('Create Account'),
            ),
          ],
        ),
      ),
    );
  }
}

// หน้าจอหลังจากล็อคอินสำเร็จ
class GreetingPage extends StatelessWidget {
  const GreetingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Greeting Page'),
      ),
      body: const Center(
        child: Text(
          'สวัสดี',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
