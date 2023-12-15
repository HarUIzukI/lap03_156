import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => __FirstPagStateState();
}

class __FirstPagStateState extends State<FirstPage> {
  final _loginFormKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Worawat"),
        backgroundColor: Color.fromARGB(255, 230, 224, 198),
      ),
      body: Form(
        key: _loginFormKey,
        child: Column(
          children: [
            Text(
              "Login",
              style: TextStyle(fontSize: 50),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    AlertDialog alert = AlertDialog(
                      title: Text('Alert Dialog'),
                      content: Container(
                          child: Text('Please Fill the empty textbox.')),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('OK'),
                        )
                      ],
                    );
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return alert;
                      },
                    );
                    return "Please enter your username.";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: "Username",
                  prefixIcon: Icon(Icons.person),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.green)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                controller: _usernameController,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your password.";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: "Password",
                  prefixIcon: Icon(Icons.lock),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.green)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                obscureText: true,
                controller: _passwordController,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (_loginFormKey.currentState!.validate()) {
                  print("successfull");
                }
              },
              child: const Text("Login"),
            ),
            Text(_passwordController.text)
          ],
        ),
      ),
    );
  }
}
