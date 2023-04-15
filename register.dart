import 'package:flutter/material.dart';
import 'login.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: "Username",
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                String username = _usernameController.text;
                String password = _passwordController.text;
                registerUser(username, password);
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("Registration Successful"),
                    content: Text("You can now login with your new account."),
                    actions: [
                      TextButton(
                        child: Text("OK"),
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                          );
                        },
                      )
                    ],
                  ),
                );
              },
              child: Text("Register"),
            ),
            SizedBox(height: 16.0),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Back to Login"),
            ),
          ],
        ),
      ),
    );
  }

  void registerUser(String username, String password) {
// Menyimpan data user yang telah melakukan registrasi ke dalam daftar user yang terdaftar
    registeredUsers.add({"username": username, "password": password});
  }
}

// Variable untuk menyimpan data user yang telah registrasi
List<Map<String, String>> registeredUsers = [];
