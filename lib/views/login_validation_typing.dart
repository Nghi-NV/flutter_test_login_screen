import 'package:flutter/material.dart';

class LoginValidation extends StatefulWidget {
  const LoginValidation({Key? key}) : super(key: key);

  @override
  _LoginValidationState createState() => _LoginValidationState();
}

class _LoginValidationState extends State<LoginValidation> {
  final _controller = TextEditingController();
  var _text = '';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String? get _errorName {
    final text = _controller.value.text;

    if (text.isEmpty) {
      return "Tên không được để trống";
    }

    if (text.length < 4) {
      return "Tên quá ngắn";
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 24),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                  labelText: "Enter your name", errorText: _errorName),
              onChanged: (value) {
                setState(() {
                  _text = value;
                });
              },
            ),
            const SizedBox(height: 24),
            ElevatedButton(
                onPressed: () {
                  if (_controller.value.text.isNotEmpty) {
                    if (_errorName == null) {
                      // submith
                    }
                  }
                },
                child: const Text("Login")),
          ],
        ),
      ),
    );
  }
}
