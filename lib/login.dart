import 'package:flutter/material.dart';
import 'package:loginwithrest_api/providers/authProvider.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: emailcontroller,
                decoration: InputDecoration(label: Text("Email")),
              ),
              TextField(
                controller: passwordcontroller,
                decoration: InputDecoration(label: Text("Password")),
              ),
              InkWell(
                  onTap: () {},
                  child: ElevatedButton(
                      onPressed: () {
                        loginProvider.login(emailcontroller.text.trim(),
                            passwordcontroller.text.trim());
                      },
                      child: loginProvider.loading == true
                          ? Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : Text("Login")))
            ],
          ),
        ),
      ),
    );
  }
}
